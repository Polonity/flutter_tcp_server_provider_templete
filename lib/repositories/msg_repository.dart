import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';

import 'package:tcp_server_provider_templete/models/my_model.dart';
import 'package:tcp_server_provider_templete/configs/config.dart';

class MsgRepository {
  MsgRepository({required this.appConfig});

  ServerSocket? _tcpServerSocket;
  Map<Socket, Socket> _clientSocketMap = {};

  // stream for consumer
  final _controller = StreamController<MyModel>();
  Stream<MyModel> get stream => _controller.stream;

  // stream for current clients
  final _clientsController = StreamController<Map<Socket, Socket>>();
  Stream<Map<Socket, Socket>> get clients => _clientsController.stream;

  AppConfig appConfig;
  int seqNum = 0;
  DateFormat _dataFmt = DateFormat('yyyy/MM/dd HH:mm:ss');

  Future<void> startReceiveStream() async {
    _tcpServerSocket = await ServerSocket.bind(
        InternetAddress.anyIPv4, appConfig.tcpServerPort);

    // start to listen
    _tcpServerSocket!.listen(onAccepted);
  }

  onAccepted(Socket clientSocket) {
    print("on accept");

    _clientSocketMap.addAll({clientSocket: clientSocket});
    _clientsController.sink.add(_clientSocketMap);

    clientSocket.listen((u8list) {
      print("on receive");
      _controller.sink.add(MyModel(
          date: _dataFmt.format(DateTime.now()),
          ipAddr: clientSocket.remoteAddress.address,
          port: clientSocket.remotePort,
          msg: String.fromCharCodes(u8list)));
    }, onDone: () {
      // delete disconnected client from client list
      _clientSocketMap.remove(clientSocket);
      _clientsController.sink.add(_clientSocketMap);
    });
  }

  void send(String msg) {
    for (var item in _clientSocketMap.values) {
      item.write(String.fromCharCodes(msg.codeUnits));
    }
  }

  Stream<MyModel>? listen() async* {
    // listen _tcpServerEndpoint
    await for (MyModel data in stream) {
      // TODO: decode received bytes
      yield data;
    }
  }
}
