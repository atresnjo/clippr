import 'package:clippr/events/events.dart';
import 'package:clippr/services/clipboard_service.dart';
import 'package:clippr/services/clipboard_timer.dart';
import 'package:clippr/services/config_service.dart';
import 'package:clippr/utils/constants.dart';
import 'package:clippr/utils/injector.dart';
import 'package:flutter/material.dart';
import 'views/home/home_view.dart';

ClipboardTimer timer = new ClipboardTimer();
ConfigService _configService = ConfigService();
EventHandler _eventHandler;

class ClipprApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueGrey),
      home: ClipprHomePage(),
    );
  }
}

class ClipprHomePage extends StatefulWidget {
  ClipprHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ClipprHomePageState createState() => _ClipprHomePageState();
}

class _ClipprHomePageState extends State<ClipprHomePage> {
  @override
  void initState() {
    injector.registerSingleton<EventHandler>(new EventHandler());
    _configService.initialize().then((value) {
      injector.registerSingleton<ClipboardService>(new ClipboardService());
      timer.start();
    });
    _eventHandler = injector.get<EventHandler>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: HomeViewData(),
        appBar: AppBar(
            backgroundColor: bgColor,
            title: TextField(
                onChanged: (filter) =>
                    {_eventHandler.searchFilterUpdatedEvent(filter)},
                style: TextStyle(color: Colors.black),
                cursorColor: bgColor,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search through your entries..."))));
  }
}
