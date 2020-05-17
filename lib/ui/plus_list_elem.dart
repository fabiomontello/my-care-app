import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusListElem extends StatelessWidget {
  final String labelTitle;
  final IconData labelIcon;
  final String route;
  final Function onItemTapped;

  PlusListElem(this.labelTitle, this.labelIcon, this.route, this.onItemTapped);

  void _openEditPage(BuildContext ctx,) {
    Navigator.of(ctx).pop();
    if(route == '/documento/edit' || route == '/analisi/edit'){
      Navigator.of(ctx).pushNamed(route, arguments: {'routeFunction': onItemTapped});
    } else{
      Navigator.of(ctx).pushNamed(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 45),
      child: ListTile(
        onTap: () => _openEditPage( 
          context,
        ),
        title: Text(labelTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6
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
