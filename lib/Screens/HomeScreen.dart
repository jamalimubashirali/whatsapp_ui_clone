import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <String> contacts = ["Contact 1" , "Contact 2" , "Contact 3"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Whatsapp",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.teal,
            bottom: const TabBar(tabs: [
              Tab(
                child: Text(
                  "Chat",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Status",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  "Calls",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ]),
            actions: [
              const Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
              PopupMenuButton(
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  color: Colors.white,
                ),
                offset: const Offset(0 , 40),
                itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(
                      child: Text("New Group"),
                    ),
                    PopupMenuItem(
                      child: Text("Settings"),
                    ),
                    PopupMenuItem(
                        child: Text("Logout")
                    ),
                  ];
                },
              ),
            ],
          ),
          body: TabBarView(children: [
            ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/MyPhoto.jpeg"
                    ),
                  ),
                  title: Text(contacts[index]),
                  subtitle: const Text("This my msg"),
                  trailing: const Icon(
                    Icons.access_time
                  ),
                );
              },),
            const Center(child: Text("This Status tab"),),
            const Center(child: Text("This Calls tab"),),
          ]),
        ));
  }
}
