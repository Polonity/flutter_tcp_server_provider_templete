import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:tcp_server_provider_templete/models/my_model.dart';
import 'package:tcp_server_provider_templete/repositories/msg_repository.dart';
import 'package:tcp_server_provider_templete/configs/config.dart';

class MyViewModel with ChangeNotifier, DiagnosticableTreeMixin {
  MyViewModel({required this.appConfig});

  AppConfig appConfig;
  MsgRepository? _msgRepository;

  late Stream<List<String>> connectedClients =
      _msgRepository!.clients.transform(toMyViewModelClientList);

  late Stream<ListQueue<MyModel>> msgList =
      _msgRepository!.stream.transform(toMyViewModelMsg);

  ListQueue<MyModel> msgQueue = ListQueue(10);

  bool isInitialized = false;

  final toMyViewModelClientList =
      StreamTransformer<Map<Socket, Socket>, List<String>>.fromHandlers(
          handleData: (clients, sink) {
    // TODO: transform client data received from repository to your view.
    final List<String> clientList = [];
    for (var client in clients.values) {
      clientList.add(
          "${client.remoteAddress.address}:${client.remotePort.toString()}");
    }
    sink.add(clientList);
  });

  late StreamTransformer<MyModel, ListQueue<MyModel>> toMyViewModelMsg =
      StreamTransformer<MyModel, ListQueue<MyModel>>.fromHandlers(
          handleData: (value, sink) {
    /// TODO : add your data convert implementation
    if (msgQueue.length == 10) {
      msgQueue.removeFirst();
    }
    msgQueue.add(value);
    sink.add(msgQueue);
  });

  startReceiveStream() async {
    _msgRepository = MsgRepository(appConfig: appConfig);
    await _msgRepository!.startReceiveStream();
    isInitialized = true;
    notifyListeners();
  }

  void send(String msg) {
    _msgRepository!.send(msg);
  }
}
