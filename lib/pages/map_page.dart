import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../logos/logos.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0)),
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                  _controller.nextPage(duration: _kDuration, curve: _kCurve);
                },
                child: Text(
                  'Ospedali',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xffBE1622),
              ),
            ),
            Container(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                  _controller.previousPage(
                      duration: _kDuration, curve: _kCurve);
                },
                textColor: Color(0xffBE1622),
                child: Text(
                  'Farmacie',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xffBE1622),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            child: FlutterMap(
              options: new MapOptions(
                center: new LatLng(41.871941, 12.567380),
                zoom: 13.0,
              ),
              layers: [
                new TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      width: 80.0,
                      height: 80.0,
                      point: new LatLng(41.871941, 12.567380),
                      builder: (ctx) => new Container(
                        child: snakeHealth,
                        // child: Icon(
                        //   FontAwesomeIcons.snake,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//map.setView(new L.LatLng(51.3, 0.7),9);
