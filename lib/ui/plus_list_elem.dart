import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care/ui/plus.dart';

class PlusListElem extends StatelessWidget {
  final String labelTitle;
  final IconData labelIcon;
  PlusListElem(this.labelTitle, this.labelIcon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 45),
      child: ListTile(
        title: Text(labelTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline
            //TextStyle (color: Colors.white, ),
            ),
        trailing: FaIcon(
          labelIcon,
          color: Colors.white,
        ),
        //textDirection: Icons.format_align_center),
      ),
    );
  }
}
