import 'package:clippr/generated/clipboard.pbgrpc.dart';
import 'package:clippr/services/config_service.dart';
import 'package:clippr/utils/constants.dart';
import 'package:clippr/views/home/home.dart';
import 'package:clippr/views/home/home_view_events.dart';
import 'package:clippr/widgets/clipboard_entry_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeViewData extends StatefulWidget {
  HomeViewData({Key key}) : super(key: key);

  @override
  _HomeView createState() => new _HomeView();
}

class _HomeView extends State<HomeViewData> {
  HomeViewBloc _homeViewBloc;
  ConfigService _configService = ConfigService();

  @override
  void initState() {
    super.initState();
    _homeViewBloc = new HomeViewBloc();
    _homeViewBloc.dispatch(FetchClipboardEntities());
  }

  @override
  Widget build(BuildContext context) {
    final makeBody = Container(
        padding: EdgeInsets.only(bottom: 15, top: 30),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                Widget>[
          Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - 155,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                            offset: Offset.fromDirection(20, 15),
                            blurRadius: 15,
                            color: Colors.black45)
                      ]),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: cardColor,
                        elevation: 25,
                        child: Column(children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 45, right: 35),
                                  child: IconButton(
                                    onPressed: () {
                                      Clipboard.getData("text/plain")
                                          .then((clip) {
                                        _homeViewBloc.dispatch(
                                            CreateClipboardEntry(
                                                content: clip.text));
                                      });
                                    },
                                    icon: new SvgPicture.asset(assetName),
                                    iconSize: 28,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 45, right: 35),
                                  child: IconButton(
                                    onPressed: () {
                                      _homeViewBloc
                                          .dispatch(FetchClipboardEntities());
                                    },
                                    icon: new SvgPicture.asset(cloudAssetName),
                                    iconSize: 28,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(left: 45, right: 35),
                                  child: IconButton(
                                      onPressed: () {
                                        Alert(
                                            context: context,
                                            title: "Settings",
                                            style: AlertStyle(
                                                animationType:
                                                    AnimationType.grow,
                                                overlayColor: bgColor),
                                            content: Column(
                                              children: <Widget>[
                                                FormBuilder(
                                                    child: Column(children: <
                                                        Widget>[
                                                  FormBuilderTextField(
                                                    initialValue: _configService
                                                        .endpointHost,
                                                    attribute: "endpoint_host",
                                                    onChanged: ((value) {
                                                      _configService
                                                          .endpointHost = value;
                                                    }),
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Endpoint"),
                                                  ),
                                                  FormBuilderTextField(
                                                    initialValue: _configService
                                                        .deviceName,
                                                    attribute: "device_name",
                                                    onChanged: ((value) {
                                                      _configService
                                                          .deviceName = value;
                                                    }),
                                                    decoration: InputDecoration(
                                                        labelText:
                                                            "Device name"),
                                                  ),
                                                  FormBuilderSwitch(
                                                    onChanged: ((value) {
                                                      _configService
                                                              .synchronizeClipboard =
                                                          value;
                                                    }),
                                                    label: Text(
                                                        "Push clipboard content automatically"),
                                                    attribute:
                                                        "push_clipboard_content",
                                                    initialValue: _configService
                                                        .synchronizeClipboard,
                                                  ),
                                                ]))
                                              ],
                                            ),
                                            buttons: [
                                              DialogButton(
                                                onPressed: () =>
                                                    {Navigator.pop(context)},
                                                child: Text(
                                                  "Ok",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ]).show();
                                      },
                                      icon: new SvgPicture.asset(stt),
                                      iconSize: 36)),
                            ],
                          ),
                          Flexible(child: _myListView(context)),
                        ]),
                      ))))
        ]));

    return BlocProvider<HomeViewBloc>(bloc: _homeViewBloc, child: makeBody);
  }

  Widget _myListView(BuildContext context) {
    return BlocBuilder(
        bloc: _homeViewBloc,
        builder: (BuildContext context, HomeViewState state) {
          if (state is InitialView)
            return Text("Feels empty...");
          else if (state is ClipboardFetching)
            return Text("Fetching...");
          else if (state is ClipboardFetched) {
            return StreamBuilder<List<ClipboardEntry>>(
                stream: _homeViewBloc.clipboardEntriesStream,
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data.length <= 0) return Text("Feels empty...");
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemCount: snapshot.hasData ? snapshot.data.length : 0,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemBuilder: (context, index) {
                          final item = snapshot.data[index];
                          return Slidable(
                              closeOnScroll: false,
                              key: ValueKey(item),
                              actionPane: SlidableScrollActionPane(),
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: bgColor,
                                  icon: Icons.delete,
                                  onTap: () => {
                                        _homeViewBloc.dispatch(
                                            DeleteClipboardEntry(id: item.id))
                                      },
                                ),
                              ],
                              dismissal: SlidableDismissal(
                                  onWillDismiss: (actionType) {
                                    return showDialog<bool>(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Delete'),
                                          content: Text(
                                              'Are you really sure that you want to delete this entry?'),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: Text('Cancel'),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                }),
                                            FlatButton(
                                                child: Text('Yes'),
                                                onPressed: () {
                                                  _homeViewBloc.dispatch(
                                                      DeleteClipboardEntry(
                                                          id: item.id));
                                                  Navigator.of(context)
                                                      .pop(true);
                                                }),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: SlidableDrawerDismissal(),
                                  onDismissed: (direction) {
                                    setState(() {
                                      print("removing $index");
                                    });
                                  }),
                              child: ClipboardEntryTile(clipboardEntry: item));
                        });
                  }
                });
          }
        });
  }
}
