import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbanker/data/model/sampah.dart';
import 'package:trashbanker/screen/detail/detail_view_model.dart';

class DetailPage extends StatefulWidget {
  final DataSampah dataSampah;
  final String userName;

  const DetailPage(
      {super.key, required this.dataSampah, required this.userName});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kategoriController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();

  String? selectedValue; // Set initial value to null for placeholder
  List<DropdownMenuItem<String>> dropdownItems = [
    const DropdownMenuItem(
      value: null, // Set value to null for placeholder
      child: Text(
        'Pilih kategori',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
    const DropdownMenuItem(
      value: 'Organik',
      child: Text('Organik'),
    ),
    const DropdownMenuItem(
      value: 'Anorganik',
      child: Text('Anorganik'),
    ),
  ]; // Added dropdownItems list
  List<DropdownMenuItem<String>> dropDownMitra = [
    const DropdownMenuItem(
      value: null,
      child: Text(
        'Pilih Mitra',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
    const DropdownMenuItem(
      value: 'Sampah Indonesia',
      child: Text('Sampah Indonesia'),
    ),
    const DropdownMenuItem(
      value: 'Sampah Desa',
      child: Text('Sampah Desa'),
    ),
  ];
  List<DropdownMenuItem<String>> dropDownLocation = [
    const DropdownMenuItem(
      value: null,
      child: Text(
        'Pilih Lokasi',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    ),
    const DropdownMenuItem(
      value: 'Jogja',
      child: Text('Jogja'),
    ),
    const DropdownMenuItem(
      value: 'Seturan',
      child: Text('Seturan'),
    ),
  ];

  String? selectedMitra;
  String? selectedLocation;

  @override
  void dispose() {
    _namaController.dispose();
    _kategoriController.dispose();
    _beratController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedValue = widget.dataSampah.sampah.kategori;
    selectedMitra = widget.dataSampah.mitra.nama;
    selectedLocation = widget.dataSampah.mitra.lokasi;
    _namaController.text = widget.dataSampah.sampah.nama;
    _beratController.text = widget.dataSampah.sampah.berat.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailViewModel>(
      create: (context) => DetailViewModel(username: widget.userName),
      child: Consumer<DetailViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 45, 155, 48),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Text(
                      widget.dataSampah.sampah.nama,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Nama Sampah',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 16.0),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Jenis Sampah',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Berat Sampah',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextField(
                      controller: _beratController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 16.0),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Nama Mitra',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: selectedMitra,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedMitra = newValue!;
                        });
                      },
                      items: dropDownMitra,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Nama Mitra',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      value: selectedLocation,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue!;
                        });
                      },
                      items: dropDownLocation,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.updateData(
                            widget.dataSampah,
                            DataSampah(
                                sampah: Sampah(
                                    nama: _namaController.text,
                                    kategori: selectedValue!,
                                    berat: double.tryParse(
                                            _beratController.text) ??
                                        0.0),
                                mitra: Mitra(
                                    nama: selectedMitra!,
                                    lokasi:
                                        selectedLocation!))); // Update the data in the ViewModel

                        Navigator.pop(
                            context); // Navigate back to previous screen with updated data
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 31, 121, 34),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(152, 38),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
