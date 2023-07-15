import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trashbanker/data/model/sampah.dart';

class SampahRepository {
  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('user');

  Future<void> addSampah(DataSampah dataSampah, String userName) async {
    DocumentReference userData = firestore.doc(userName);

    List<dynamic> sampah = [{
      'nama': dataSampah.sampah.nama,
      'kategori': dataSampah.sampah.kategori,
      'berat': dataSampah.sampah.berat,
    }];

    List<dynamic> mitra = [{
      'nama': dataSampah.mitra.nama,
      'lokasi': dataSampah.mitra.lokasi
    }];

    List<dynamic> data = [{
      'sampah': sampah,
      'mitra': mitra
    }];
    await userData
        .update({"dataSampah": FieldValue.arrayUnion(data)})
        .then((value) => print("AddedData"))
        .catchError((error) => print("FailedtoAddData $error"));
  }
  Future<void> removeSampah(DataSampah dataSampah, String userName) async {
    DocumentReference userData = firestore.doc(userName);

    List<dynamic> sampah = [{
      'nama': dataSampah.sampah.nama,
      'kategori': dataSampah.sampah.kategori,
      'berat': dataSampah.sampah.berat,
    }];

    List<dynamic> mitra = [{
      'nama': dataSampah.mitra.nama,
      'lokasi': dataSampah.mitra.lokasi
    }];

    List<dynamic> data = [{
      'sampah': sampah,
      'mitra': mitra
    }];
    await userData
        .update({"dataSampah": FieldValue.arrayRemove(data)})
        .then((value) => print("RemoveData"))
        .catchError((error) => print("FailedtoAddData $error"));
  }
  Future<void> initializeData(String username) async {
    Map<String, dynamic> data = {
      "dataSampah": []
    };
    firestore.doc(username).set(data)
        .then((value) => print("IntializeData"))
        .catchError((error) => print("FailedtoIntializeData $error"));
  }

  Stream<List<DataSampah>> getStreamData(String username) {
    final data = firestore.doc(username);
    return data.snapshots().map(
          (event) {
            final dataEvent = event.data() as Map<String, dynamic>;
            print(dataEvent["dataSampah"][0]["mitra"][0].runtimeType);
            final List<DataSampah> dataList = convertToDataSampahList(dataEvent["dataSampah"]);
            return dataList;
      },
    ).handleError(
          (error) {
        print("Listen failed: $error");
        return []; // Return an empty list or handle the error as needed
      },
    );
  }
}
