import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/nickname.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final List<NickName> NickNames = [];

  final userController = TextEditingController();

  void submitData() {
    final entredUsername = userController.text;

    if (entredUsername.isEmpty) {
      return;
    }

    _addNewNickName(entredUsername);
  }

  void _addNewNickName(String txUser) {
    final AddTx = NickName(
        name: txUser, id: DateTime.now().toString(), date: DateTime.now());
    setState(() {
      NickNames.add(AddTx);
    });
  }

  void _delete(String id) {
    setState(() {
      NickNames.removeWhere((e) {
        return e.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(label: Text('Username')),
            controller: userController,
          ),
          TextButton(
            onPressed: submitData,
            child: const Text('Add transaction',
                style: TextStyle(color: Colors.blue)),
          ),

          //  ===================================================================

          Container(
            height: 300,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: NickNames.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              NickNames[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                                onPressed: () => _delete(NickNames[index].id),
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
