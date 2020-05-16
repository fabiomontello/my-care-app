import 'package:flutter/material.dart';
import 'package:my_care/pages/smart_devices.dart';
import 'home_list.dart';
import 'map_page.dart';
import 'medicinali_page.dart';
import 'appuntamenti_page.dart';
import 'analisi_page.dart';
import 'documenti_page.dart';
import 'notification_list.dart';


class HomeSwitcher extends StatelessWidget {
  final int index;
  HomeSwitcher(this.index);

  @override
  Widget build(BuildContext context) {
    Widget child = Text('This text ' + index.toString());
    switch (index) {
      case 0:
        child = HomeList();
        break;
      case 1:
        child = SmartDevices();
        break;
      case 2:
      break;
      case 3:
        child = NotificationList();
        break;
      case 4:
        child = MapPage();
        break;
      case 5:
        child = MedicinaliPage();
        break;
      case 6:
        child = AppuntamentiPage();
        break;
      case 7:
        child = DocumentiPage();
        break;
      case 8:
        child = AnalisiPage();
        break;
      default:
    }
    return Center(child: child);
  }
}
