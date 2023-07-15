import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:trashbanker/data/model/sampah.dart';

import '../../data/repository/SampahRepository.dart';
import '../../di/get_it.dart';

class ListViewModel extends ChangeNotifier {
  final SampahRepository _sampahRepository = locator<SampahRepository>();
  StreamSubscription<List<DataSampah>>? _dataStreamSubscription;

  List<DataSampah> _dataSampah = [];

  List<DataSampah> get dataSampah => _dataSampah;

  late String username;

  ListViewModel({required this.username}) {
    startListening();
  }

  void startListening() {
    _dataStreamSubscription =
        _sampahRepository.getStreamData("atafatta").listen(
      (List<DataSampah> dataList) {
        _dataSampah = dataList;
        print(dataSampah);
        notifyListeners(); // Notify listeners of the data change
      },
      onError: (error) {
        print("Error ListViewModel $error");
      },
    );
  }

  Future<void> deleteData(int position) async {
    await _sampahRepository.removeSampah(dataSampah[position], username);
  }

  void stopListening() {
    _dataStreamSubscription?.cancel();
    _dataStreamSubscription = null;
  }
}
