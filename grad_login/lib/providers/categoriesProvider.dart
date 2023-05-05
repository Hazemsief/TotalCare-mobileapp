import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:grad_login/my_config.dart';

class CatItem with ChangeNotifier {
  final int id;
  final String name;
  final String imgURL;

  CatItem({
    required this.id,
    required this.name,
    required this.imgURL,
  });
}

class Categories with ChangeNotifier {
  List<CatItem> _list = [];
  final loginEndPoint = Uri.parse(Config.categories);

  List<CatItem> get items {
    return [..._list];
  }

  Future<void> fetchCat(int _pageNumber) async {
    // print(_pageNumber);
    final List<CatItem> loadedCat = [];
    final url = Uri.parse(
        'http://192.168.1.5:8000/medicine/categories/?page=$_pageNumber');
    final respone = await http.get(url, headers: {
      'Authorization':
          'JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjgzMjkzMzMxLCJpYXQiOjE2ODMyMDY5MzEsImp0aSI6IjEyNTY1MDM2ZTY2YjRkZjU4NjFjMDU2YWQxNTBhYWZkIiwidXNlcl9pZCI6NSwidXNlcm5hbWUiOiJuZXd1c2VyIiwiZW1haWwiOiJzQGFhYS5jbyIsImZpcnN0X25hbWUiOiJuZXciLCJsYXN0X25hbWUiOiJ1c2VyIiwicHJvZmlsZV90eXBlIjoiUEFUIiwiaXNfc3RhZmYiOmZhbHNlfQ.CBefyDyUOq61DLxUBj-O7HnMoVGVqm1nSzUV6mRu9Vw '
    });
    final extractedData = json.decode(respone.body) as Map<String, dynamic>;
    print(extractedData);

    for (var i = 0; i < 10; i++) {
      if (respone.statusCode == 200) {
        loadedCat.add(
          CatItem(
            id: extractedData['results'][i]['id'],
            name: extractedData['results'][i]['name'],
            imgURL: extractedData['results'][i]['image']['image'],
          ),
        );
      } else {}
    }

    _list.addAll(loadedCat);
    // print(_list[0].id);
    // print(_list[1].name);
    // print(_list[0].imgURL);
    // //  print(_list.length);
    // print(_list[3].imgURL);
    notifyListeners();
  }
  // Future<void> fetchCat() async {
  //   final url =
  //       Uri.parse('http://192.168.1.5:8000/medicine/categories/?page=1');
  //   final respone = await http.get(url);
  //   final extractedData = json.decode(respone.body)['count'];
  //   final pageCount = (extractedData / 10).ceil();
  //   //print(pageCount);
  //   final List<CatItem> loadedCat = [];
  //   for (var z = 1; z <= pageCount; z++) {
  //     final url =
  //         Uri.parse('http://192.168.1.5:8000/medicine/categories/?page=$z');
  //     final respone = await http.get(url);
  //     final extractedData = json.decode(respone.body) as Map<String, dynamic>;
  //     //print(extractedData);

  //     for (var i = 0; i < extractedData['results'].length; i++) {
  //       if (respone.statusCode == 200) {
  //         loadedCat.add(
  //           CatItem(
  //             id: extractedData['results'][i]['id'],
  //             name: extractedData['results'][i]['name'],
  //             imgURL: extractedData['results'][i]['image']['image'],
  //           ),
  //         );
  //       } else {}
  //     }
  //     _list = loadedCat;
  //     //print(_list[0].id);
  //     // print(_list[1].name);
  //     // print(_list[0].imgURL);
  //     // print(_list.length);
  //     // print(_list[3].imgURL);
  //   }
  //   notifyListeners();
  // }
}
