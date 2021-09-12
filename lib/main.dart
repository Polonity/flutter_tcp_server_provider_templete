import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tcp_server_provider_templete/viewModels/my_view_model.dart';
import 'package:tcp_server_provider_templete/views/msg_view.dart';
import 'package:tcp_server_provider_templete/configs/config.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => MyViewModel(appConfig: AppConfig())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TCP server with Provider Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('TCP server with Provider Flutter Demo')),
          body: const MsgView(),
        ));
  }
}
