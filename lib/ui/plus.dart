import 'package:flutter/material.dart';
import 'package:my_care/ui/plus_list_elem.dart';
import './drawer_list_separator.dart';
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
      padding: EdgeInsets.all(10),
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Divider(
            color: Colors.white,
            indent: 140,
            endIndent: 140,
            height: 20,
            thickness: 6,
          ),
          DrawerListSeparator(),
          PlusListElem('Medicinale', FontAwesomeIcons.pills),
          DrawerListSeparator(),
          PlusListElem('Appuntamento', FontAwesomeIcons.checkCircle),
          DrawerListSeparator(),
          PlusListElem('Documento', FontAwesomeIcons.fileVideo),
          DrawerListSeparator(),
          PlusListElem('Analisi', FontAwesomeIcons.fileMedicalAlt)
        ],
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
