import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<String> contacts = List.generate(50, (index) => "Contact $index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          const Icon(Icons.camera_alt_outlined),
          PopupMenuButton(
            offset: const Offset(0, 50),
            color: Colors.white,
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text("New group"),
                ),
                const PopupMenuItem(child: Text("New broadcast")),
                const PopupMenuItem(child: Text("Linked devices")),
                const PopupMenuItem(child: Text("Starred messages")),
                const PopupMenuItem(child: Text("Settings"))
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
              child: TextField(
                minLines: 1,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: contacts.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/MyPhoto.jpeg"),
                  ),
                  title: Text(contacts[index]),
                  subtitle: const Row(
                    children: [
                      Icon(Icons.check_outlined, size: 18),
                      SizedBox(width: 2),
                      Text("Hi, How are you"),
                    ],
                  ),
                  trailing: const Text("13/10/24"),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add_comment,
          color: Colors.white,
        ),
      ),
    );
  }
}
