import 'package:flutter/material.dart';

class SmartDevices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            'Connetti',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.blue[800],
              textStyle: TextStyle(
                color: Colors.white,
              ),
              child: Icon(
                Icons.bluetooth,
                size: 100,
              ),
              padding: EdgeInsets.all(15.0),
              splashColor: Colors.blue,
              shape: CircleBorder(),
            )
          ],
        ),
      ],
    );
  }
}
