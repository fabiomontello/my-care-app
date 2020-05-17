import 'package:flutter/material.dart';
import 'package:my_care/pages/smart_devices.dart';
import 'home_list.dart';
import 'map_page.dart';
import 'medicinali_page.dart';
import 'appuntamenti_view.dart';
import 'analisi_page.dart';
import 'documenti_page.dart';
import 'notification_list.dart';


class HomeSwitcher extends StatelessWidget {
  final int index;
  final Function homeSwitcher;
  HomeSwitcher(this.index, this.homeSwitcher);

  @override
  Widget build(BuildContext context) {
    Widget child = Text('This text ' + index.toString());
    switch (index) {
      case 0:
        child = HomeList(homeSwitcher);
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
        child = AppuntamentiView();
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
