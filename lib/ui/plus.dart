import 'package:flutter/material.dart';
import './drawer_list_separator.dart';

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
              title: Text(
                'Medicinali',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6//TextStyle (color: Colors.white, ), 
              // Theme.of(context).textTheme.headline6
              ),
            ),
            DrawerListSeparator()
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
