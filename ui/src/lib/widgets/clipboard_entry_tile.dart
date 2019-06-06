import 'package:clippr/generated/clipboard.pb.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipboardEntryTile extends StatefulWidget {
  final ClipboardEntry clipboardEntry;
  const ClipboardEntryTile({Key key, this.clipboardEntry}) : super(key: key);
  @override
  _ClipboardTileSEntryState createState() => _ClipboardTileSEntryState();
}

class _ClipboardTileSEntryState extends State<ClipboardEntryTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => Clipboard.setData(
            ClipboardData(text: widget.clipboardEntry.content)),
        contentPadding: EdgeInsets.only(left: 40, bottom: 10),
        title: Row(children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    widget.clipboardEntry.createdBy,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 115),
              child: Text(
                widget.clipboardEntry.createdAt,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 15),
              ))
        ]),
        subtitle: Row(children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 1, top: 10),
                  child: Text(widget.clipboardEntry.content,
                      style: TextStyle(color: Colors.black, fontSize: 14))))
        ]));
  }
}
