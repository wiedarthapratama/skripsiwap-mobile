import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getToken();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<HomeController>(
        builder: (hController) {
          return Center(
            child: hController.widgetOptions
                .elementAt(hController.selectedIndex.value),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (hController) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Kost Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: hController.selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: hController.onItemTapped,
          );
        },
      ),
    );
  }
}
