//  @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(flex: 100,
//           child: ListView(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ListTile(
//                 // trailing: Icon(
//                 //   FontAwesomeIcons.pills,
//                 // ),
//                 title: Text(
//                   'I tuoi medicinali',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Ubuntu',
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xffBE1622),
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: medList.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     // elevation: 5,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 5,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         medList[index].title,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       subtitle: Text(
//                         medList[index].id,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 shrinkWrap: true,
//               ),
//             ],
//           ),
//         ),
//         RedSeparator(),
//         Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ListTile(
//                 // trailing: Icon(
//                 //   FontIcons.pills,
//                 // ),
//                 title: Text(
//                   'I tuoi appuntamenti',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Ubuntu',
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xffBE1622),
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: appuntamentiList.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     // elevation: 5,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 5,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         appuntamentiList[index].title,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       subtitle: Text(
//                         DateFormat.yMMMd().format(appuntamentiList[index].date),
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 shrinkWrap: true,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }








// @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ListTile(
//                 // trailing: Icon(
//                 //   FontAwesomeIcons.pills,
//                 // ),
//                 title: Text(
//                   'I tuoi medicinali',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Ubuntu',
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xffBE1622),
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: medList.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     // elevation: 5,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 5,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         medList[index].title,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       subtitle: Text(
//                         medList[index].id,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 shrinkWrap: true,
//               ),
//             ],
//           ),
//         ),
//         RedSeparator(),
//         Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ListTile(
//                 // trailing: Icon(
//                 //   FontAwesomeIcons.pills,
//                 // ),
//                 title: Text(
//                   'I tuoi appuntamenti',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Ubuntu',
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xffBE1622),
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: appuntamentiList.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     // elevation: 5,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 5,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         appuntamentiList[index].title,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       subtitle: Text(
//                         DateFormat.yMMMd().format(appuntamentiList[index].date),
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 shrinkWrap: true,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }






// @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(flex: 100,
//           child: ListView(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ListTile(
//                 // trailing: Icon(
//                 //   FontAwesomeIcons.pills,
//                 // ),
//                 title: Text(
//                   'I tuoi medicinali',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Ubuntu',
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xffBE1622),
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: medList.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     // elevation: 5,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 5,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         medList[index].title,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       subtitle: Text(
//                         medList[index].id,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 shrinkWrap: true,
//               ),
//             ],
//           ),
//         ),
//         RedSeparator(),
//         Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ListTile(
//                 // trailing: Icon(
//                 //   FontAwesomeIcons.pills,
//                 // ),
//                 title: Text(
//                   'I tuoi appuntamenti',
//                   textAlign: TextAlign.left,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontFamily: 'Ubuntu',
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xffBE1622),
//                   ),
//                 ),
//               ),
//               ListView.builder(
//                 itemCount: appuntamentiList.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     // elevation: 5,
//                     margin: EdgeInsets.symmetric(
//                       horizontal: 5,
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         appuntamentiList[index].title,
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       subtitle: Text(
//                         DateFormat.yMMMd().format(appuntamentiList[index].date),
//                         style: TextStyle(
//                           fontFamily: 'Ubuntu',
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 shrinkWrap: true,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
