import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Sampah{
  final String nama;
  final String kategori;
  final double berat;
  Sampah({required this.nama, required this.kategori, required this.berat});
  @override
  String toString() {
    return 'Sampah: {nama: $nama, kategori: $kategori, berat: $berat}';
  }
}

class Mitra {
  final String nama;
  final String lokasi;
  Mitra({ required this.nama, required this.lokasi});
  @override
  String toString() {
    return 'Mitra: {nama: $nama, mitra: $lokasi}';
  }
}

class DataSampah{
  final Sampah sampah;
  final Mitra mitra;
  DataSampah({required this.sampah, required this.mitra});
  @override
  String toString() {
    return 'DataSampah: {sampah: $sampah, mitra: $mitra}';
  }
}

List<DataSampah> convertToDataSampahList(List<dynamic> data) {
  final List<DataSampah> result = [];

  for (final dataSampahList in data) {
    final mitra = dataSampahList["mitra"][0] as Map<String, dynamic>;
    final sampah = dataSampahList["sampah"][0] as Map<String, dynamic>;

    final DataSampah dataSampah = DataSampah(
      sampah: Sampah(
        nama: sampah["nama"] as String,
        kategori: sampah["kategori"] as String,
        berat: sampah["berat"] as double,
      ),
      mitra: Mitra(
        nama: mitra["nama"] as String,
        lokasi: mitra["lokasi"] as String,
      ),
    );
    result.add(dataSampah);
  }
  print(result);

  return result;

}

