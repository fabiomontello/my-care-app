import 'package:flutter/material.dart';
import './home_list.dart';
import '../ui/red_separator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicinaliPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  ListTile(
                    dense: true,
                    title: Text(
                      'I tuoi medicinali',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        color: Color(0xffBE1622),
                      ),
                    ),
                  ),
                  ...medList.map((elem) {
                    return Container(
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed('/medicinale/view',
                              arguments: {'object': elem});
                        },
                        leading: Icon(
                          FontAwesomeIcons.pills,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: Text(
                          elem.title,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          elem.frequency.toString() + ' volte al giorno',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  RedSeparator(),
                ]))
          ],
        ),
      ),
    );
  }
}
