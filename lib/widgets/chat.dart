import 'package:flutter/material.dart';

import '../models/nickname.dart';

class chatPage extends StatefulWidget {
  const chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
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
    final AddTx = NickName(name: txUser, id: DateTime.now().toString());
    setState(() {
      NickNames.add(AddTx);
    });
  }

  // void _delete(String id) {
  //   setState(() {
  //     NickNames.removeWhere((e) {
  //       return e.id == id;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      appBar: AppBar(
        title: const Text('imam university'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //  ===================================================================
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: NickNames.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.teal),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150,
                                child: Text(
                                  NickNames[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: submitData,
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
                filled: true,
                fillColor: const Color(0xFF25253A),
                border: InputBorder.none,
                focusColor: Colors.amber,
              ),
              controller: userController,
            ),
          ),
        ],
      ),
    );
  }
}
