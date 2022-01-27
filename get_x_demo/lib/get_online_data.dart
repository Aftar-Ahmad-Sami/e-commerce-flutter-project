import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modeldistric.dart';

class GetOnlineData extends StatefulWidget {
  const GetOnlineData({Key? key}) : super(key: key);

  @override
  _GetOnlineDataState createState() => _GetOnlineDataState();
}

class _GetOnlineDataState extends State<GetOnlineData> {
  var disList = List<Distric>.empty();
  bool isLoading = true;
  Future<List<Distric>> callApi() async {
    String url =
        "https://raw.githubusercontent.com/nuhil/bangladesh-geocode/master/districts/districts.json";
    Uri uri = Uri.parse(url);

    var responce = await http.get(uri);
    print(responce.statusCode);
    print(responce.body);
    var data = jsonDecode(responce.body);

    var distric = jsonEncode(data[2]['data']);

    return districFromJson(distric);
  }

  fatchApi() async {
    disList = await callApi();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upazilla's Name BD"),
        leading: Icon(Icons.map),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: disList.length,
              itemBuilder: (contex, int) {
                return Card(
                  child: ListTile(
                    title: Text(disList[int].bnName),
                  ),
                );
              }),
    );
  }
}
