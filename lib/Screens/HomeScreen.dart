import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<String> contacts = List.generate(50, (index) => "Contact $index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp" , style: TextStyle(
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
          },),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update_rounded),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_outlined),
            label: "Calls",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0 , horizontal: 8.0),
              child: TextField(
                minLines: 1,
                maxLines: 1, // Ensures the text field doesn't grow vertically
                decoration: InputDecoration(
                  hintText: "Search",
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0), // Adjust vertical padding
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            // Wrap ListView with a constrained height using shrinkWrap
            ListView.builder(
              itemCount: contacts.length,
              shrinkWrap: true, // Important to make ListView inside SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
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
      )
    );
  }
}
