import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/nickname.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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

  void _delete(NickName nickNames) {
    final valueIndex = NickNames.indexOf(nickNames);
    setState(() {
      NickNames.remove(nickNames);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Value deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                NickNames.insert(valueIndex, nickNames);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No value found. Start adding some!'),
    );

    if (NickNames.isNotEmpty) {
      mainContent = ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: NickNames.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(NickNames[index]),
            onDismissed: (direction) {
              _delete(NickNames[index]);
            },
            background: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.teal,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NickNames[index].name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat.Hm().format(NickNames[index].date),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          // IconButton(
                          //     onPressed: () => _delete(NickNames[index].id),
                          //     icon: const Icon(
                          //       Icons.delete,
                          //       color: Colors.red,
                          //     ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: ('Username'),
              ),
              controller: userController,
            ),
          ),
          TextButton(
            onPressed: submitData,
            child: const Text(
              'Add transaction',
              style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),

          //  ===================================================================

          Container(height: 300, child: mainContent),
        ],
      ),
    );
  }
}
