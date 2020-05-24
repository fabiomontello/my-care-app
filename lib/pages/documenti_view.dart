import 'package:flutter/material.dart';
import '../models/documenti.dart';
import '../ui/red_separator.dart';
import './documenti_page.dart';

class DocumentiView extends StatelessWidget {
  _docType(val) {
    switch (val) {
      case TipoDoc.fotoVideo:
        return 'alla foto / al video';
      case TipoDoc.documento:
        return 'al documento';
      case TipoDoc.audio:
        return 'all\'audio';
    }
    return 'al documento';
  }

  @override
  Widget build(BuildContext context) {
    final argum = ModalRoute.of(context).settings.arguments as Map;
    Documenti med = argum['object'];

    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Informazioni medicinale',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
        child: Column(
          children: [
            Container(
              child: ListTile(
                title: Text(
                  med.title,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffBE1622),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(60.0)),
                onPressed: () {},
                child: Text(
                  'Vai ' + _docType(med.tipoDoc),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                color: Color(0xffBE1622),
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 18, 15, 10),
                  child: Text(
                    'Note',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Text(
                    med.note == '' ? 'Nessuna nota' : med.note,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            RedSeparator(),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/documento/edit',
                          arguments: {'edit': med});
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xffBE1622),
                      size: 36,
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Color(0xffBE1622),
                        size: 36,
                      ),
                      onPressed: (){
                        argum['fun']();
                        docuList.removeWhere((element) => element.id == med.id);
                        Navigator.of(context).pop();
                      })
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffBE1622),
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/documento/edit');
          }),
    );
  }
}
