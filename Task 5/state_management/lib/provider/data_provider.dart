import 'package:flutter/cupertino.dart';
import 'package:state_management/model/data.dart';

class DataProvider extends ChangeNotifier {
  List<Data> listData = [];

  void addData(Data data) {
    listData.add(data);
    notifyListeners();
  }

  void updateData(Data data, String name, String description, int stok) {
    data.name = name;
    data.description = description;
    data.stok = stok;
    notifyListeners();
  }

  void deleteData(Data data) {
    listData.remove(data);
    notifyListeners();
  }
}
