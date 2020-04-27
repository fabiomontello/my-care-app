import 'package:flutter/material.dart';
import './drawer_list_separator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusButton extends StatefulWidget {
  //final Function addTx;
  PlusButton();

  @override
  _PlusButton createState() => _PlusButton();
}

class _PlusButton extends State<PlusButton> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(10),
        height: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Divider(
              color: Colors.white,
              indent: 30,
              endIndent: 30,
              height: 5,
              thickness: 2,
            ),
            ListTile(
              title: Text('Medicinale',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6
                  //TextStyle (color: Colors.white, ),
                  // Theme.of(context).textTheme.headline6
                  ),
              trailing: FaIcon(FontAwesomeIcons.pills),
              //extDirection: Icons.format_align_center),
            ),
            DrawerListSeparator(),
            ListTile(
              title: Text('Appuntamento',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6),
            ),
          ],
        ),
      ),
    );
  }
}
// TextField(
//   cursorColor: Colors.lightGreenAccent,
//   decoration: InputDecoration(labelText: 'Title'),
//   controller: titleController,
//   onSubmitted: (_) => submitData(),
//   // onChanged: (val) {
//   // titleInput = val;
//   // },
// ),
// // TextField(
// //   cursorColor: Colors.deepPurpleAccent,
// //   decoration: InputDecoration(labelText: 'Title'),
// //   controller: amountController,
// //   keyboardType: TextInputType.number,
// //   onSubmitted: (_) => submitData(),
//   // onChanged: (val) => amountInput = val,
// ),
// FlatButton(
//   child: Text('Add'),
//   textColor: Colors.lightGreenAccent,
//   onPressed: () => submitData,
// )
