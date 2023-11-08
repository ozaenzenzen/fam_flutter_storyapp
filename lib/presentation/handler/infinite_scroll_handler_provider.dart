import 'package:flutter/material.dart';

class InfiniteScrollHandlerProvider extends ChangeNotifier {
  int? pageItems = 1;
  int sizeItems = 10;

//   Future<void> getQuotes() async {
//   try {
//     if (result.list.length < sizeItems) {
//       pageItems = null;
//     } else {
//       pageItems = pageItems! + 1;
//     }

//     notifyListeners();
//   } catch (e) {
//     e;
//   }
// }
}
