import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:provider/provider.dart';
import 'package:tcp_server_provider_templete/viewModels/my_view_model.dart';
import 'package:tcp_server_provider_templete/models/my_model.dart';

class MsgView extends StatefulWidget {
  const MsgView({Key? key}) : super(key: key);

  @override
  _MsgViewState createState() => _MsgViewState();
}

class _MsgViewState extends State<MsgView> {
  @override
  void initState() {
    // TODO: implement initState
    print("init");
    context.read<MyViewModel>().startReceiveStream();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            flex: 5,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 2,
                      fit: FlexFit.loose,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: _clinetList(context))),
                  Flexible(
                      flex: 5,
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: _msgBox(context)))
                ])),
        Expanded(
            flex: 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'your message',
                  icon: Icon(Icons.message),
                ),
                onSubmitted: (msg) {
                  context.read<MyViewModel>().send(msg);
                },
              ),
            )),
      ],
    );
  }

  Widget _clinetList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Client list", style: Theme.of(context).textTheme.headline5),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: StreamBuilder(
            stream: context.read<MyViewModel>().connectedClients,
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.hasData) {
                return Container(
                    child: Column(
                  children: snapshot.data!.map((e) => Text(e)).toList(),
                ));
              } else {
                return Container(
                  child: null,
                );
              }
            },
          ),
        )
      ],
    );
  }

  Widget _msgBox(BuildContext context) {
    return (context.watch<MyViewModel>().isInitialized)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Recent received messages",
                  style: Theme.of(context).textTheme.headline5),
              FittedBox(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: StreamBuilder(
                    stream: context.read<MyViewModel>().msgList,
                    builder: (BuildContext context,
                        AsyncSnapshot<ListQueue<MyModel>> snapShot) {
                      if (snapShot.hasData) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: snapShot.data!
                                .map((msg) => Text(
                                    "${msg.date} ${msg.ipAddr}:${msg.port}: ${msg.msg}"))
                                .toList());
                      } else {
                        return Container(
                          child: null,
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          )
        : Column(
            children: const [
              Text("Now loading..."),
              CircularProgressIndicator()
            ],
          );
  }
}
