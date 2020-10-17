import 'package:flutter/material.dart';

class RoomNameWithImage extends StatelessWidget {
  const RoomNameWithImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Room Name",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            "Kitchen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/fir-demo-f2cc7.appspot.com/o/JL0fg3j0M2fHlsfWjIlDq6zJD093%2Froom%2F84b76558-2726-4964-8e3a-4bcba5caea9b8649310840609881453.jpg?alt=media&token=6e963259-ebb8-427c-af3c-318bfc2e42cf",
                      fit: BoxFit.fill,
                      height: 300,
                      width: 100,
                      loadingBuilder: (context, child, progress) =>
                      progress == null
                          ? child
                          : LinearProgressIndicator(),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}