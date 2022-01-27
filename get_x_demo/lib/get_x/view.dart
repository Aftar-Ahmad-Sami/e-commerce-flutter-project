import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ControllerClass _controller = Get.put(ControllerClass());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fatchDivsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upazilla's Name BD"),
        leading: Icon(Icons.my_location),
      ),
      body: Obx(() {
        if (_controller.isLoadingDivs.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: _controller.divListvar.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Card(
                  child: ListTile(
                    title: Text(_controller.divListvar[index].name),
                    subtitle: Text(_controller.divListvar[index].bnName),
                    trailing: Text(_controller.divListvar[index].url),
                    leading: Icon(Icons.place),
                  ),
                );
              });
        }
      }),
    );
  }
}
