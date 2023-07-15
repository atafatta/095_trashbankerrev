import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashbanker/finish.dart';
import 'package:trashbanker/screen/detail/detail_screen.dart';
import 'package:trashbanker/screen/list/list_view_model.dart';

import '../../data/model/sampah.dart';

class ListScreen extends StatelessWidget {
  final String username;
  const ListScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<ListViewModel>(
      create: (context) => ListViewModel(username: username),
      child: Consumer<ListViewModel>(
        builder: (context, viewModel, _){
          return Scaffold(
            body: Container (
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 45, 155, 48),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 26, right: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text("Data Sampahmu",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(child:
                    ListView.builder(
                      itemCount: viewModel.dataSampah.length,
                      itemBuilder: (context, index) {
                        final DataSampah data = viewModel.dataSampah[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(dataSampah: data, userName: username),
                              ),
                            );
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      data.sampah.nama,
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      var price = 0.0;
                                      if (viewModel.dataSampah[index].sampah.kategori == "Organik"){
                                        price = 3000;
                                      } else {
                                        price = 6000;
                                      }
                                      final total = viewModel.dataSampah[index].sampah.berat * price;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FinishPage(jumlah: total, username: username),
                                        ),
                                      );
                                      // Handle checkout button tap
                                    },
                                    child: const Text('Checkout'),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      viewModel.deleteData(index);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    )
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
