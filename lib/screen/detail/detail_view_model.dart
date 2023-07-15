import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:trashbanker/data/model/sampah.dart';

import '../../data/repository/SampahRepository.dart';
import '../../di/get_it.dart';

class DetailViewModel extends ChangeNotifier {
  final SampahRepository _sampahRepository = locator<SampahRepository>();

  List<DataSampah> _dataSampah = [];

  List<DataSampah> get dataSampah => _dataSampah;

  late String username;

  DetailViewModel({required this.username});

  Future<void> updateData(DataSampah oldData, DataSampah newData)async {
    await _sampahRepository.removeSampah(oldData, username);
    await _sampahRepository.addSampah(newData, username);
  }

  Future<void> deleteData(int position) async {
    await _sampahRepository.removeSampah(dataSampah[position], username);
  }

  Future<void> addData(DataSampah data) async {
    await _sampahRepository.addSampah(data, username);
  }

}
