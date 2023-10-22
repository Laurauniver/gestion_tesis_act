import 'package:flutter/material.dart';
import 'package:gestion_tesis/src/data/models/tesis.dart';
import 'package:gestion_tesis/src/presentation/pages/tesis/tesis_detail_page.dart';

class TesisPage extends StatefulWidget {
  //static const name = 'tesis-page';
  const TesisPage({super.key});

  @override
  createState() => _TesisPage();
}

class _TesisPage extends State<TesisPage> {
  final List<TesisModel> tesisList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Listado de Tesis"), //centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Scrollbar(
                child: ListView.builder(
                    itemCount: tesisList.length,
                    itemBuilder: (BuildContext context, int index) {
                      //final tesis = tesisList[index];
                      // return Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 16,
                      //vertical: 8),
                      //child: Container(
                      //decoration: BoxDecoration(
                      //color: Colors.blue,
                      //borderRadius: BorderRadius.circular(10),
                      return ListTile(
                        title: Text(tesisList[index].titulo),
                        subtitle: Text(tesisList[index].autor),
                        trailing: IconButton(
                          icon: const Icon(Icons.visibility),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const TesisDetailPage())));
                          },
                        ),
                      );
                    }))));
  }
}
