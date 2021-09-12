import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

class TcpServerEndpoint {
  TcpServerEndpoint();

  ServerSocket? _tcpServerSocket;
  Map<Socket, Socket> _clientSocketMap = {};

  // stream for consumer
  final _controller = StreamController<Uint8List>();
  Stream<Uint8List> get stream => _controller.stream;

  // stream for acceptor
  final _acceptController = StreamController<Socket>();
  Stream<Socket> get onAccept => _acceptController.stream;

  Future<void> startReceiveStream(String ipAddr, int port) async {
    _tcpServerSocket = await ServerSocket.bind(InternetAddress.anyIPv4, port);

    // start to listen
    _tcpServerSocket!.listen(onAccepted);
  }

  onAccepted(Socket clientSocket) {
    print("on accept");
    _acceptController.sink.add(clientSocket);

    _clientSocketMap.addAll({clientSocket: clientSocket});

    clientSocket.listen(onReceive, onDone: () {
      _clientSocketMap.remove(clientSocket);
    });
  }

  onReceive(Uint8List u8list) {
    print("on receive");
    _controller.sink.add(u8list);
  }

  void send(List<int> buffer) {
    for (var item in _clientSocketMap.values) {
      item.write(String.fromCharCodes(buffer));
    }
  }

  @override
  dispose() {
    _controller.close();
  }
}
