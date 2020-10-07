import 'package:flutter/material.dart';
import 'package:flutter_app/models/room_model.dart';
import 'package:provider/provider.dart';

class RoomList extends StatefulWidget {
  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {

  _showMenuButton() {
    return PopupMenuButton(
        itemBuilder: (_) => <PopupMenuItem<String>>[
          new PopupMenuItem<String>(
              child: const Text('Cabinet'), value: 'cabinet'),
          new PopupMenuItem<String>(
              child: const Text('Thing'), value: 'thing'),
        ],
        onSelected: (value) {
          print(value.toString());
        });
  }

  @override
  Widget build(BuildContext context) {
    final _rooms = Provider.of<List<RoomModel>>(context);
    print(_rooms);
    if(_rooms != null && _rooms.length > 0 ) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _rooms.length,
          itemBuilder: (BuildContext context, int index) {
            String roomName = _rooms[index].roomName;
            String roomId = _rooms[index].roomId;

            return Card(
              shadowColor: Color(0Xff5f72a9),
              elevation: 30,
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                ),
              ),
              child: ExpansionTile(
                  leading: Image.asset("assets/images/img_home_room.png"),
                  /*leading: ImageIcon(
                    AssetImage("assets/images/img_home_room.png"),
                    size: 50,
                    color: Color(0Xff334a7d),
                  ),*/
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(roomName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0Xff334a7d)
                    ),),
                  ),
                  trailing: _showMenuButton(),
                  children: [
                    ListTile(title: Text(roomId),)
                  ],
              ),
            );
          });
    } else {

      return Center(
          child: Text(
            "Add your first room.",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0Xff5f72a9),
                shadows: [
                  Shadow(
                    color: Colors.blueGrey,
                    blurRadius: 20.0,
                    offset: Offset(5.0, 5.0),
                  )
                ]
            ),
          )
      );
    }
  }
}