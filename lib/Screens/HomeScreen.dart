import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> contacts = List.generate(50, (index) => "Contact $index");
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
            bottom: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                tabs: [
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
                offset: const Offset(0, 40),
                itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(
                      child: Text("New Group"),
                    ),
                    PopupMenuItem(
                      child: Text("Settings"),
                    ),
                    PopupMenuItem(child: Text("Logout")),
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
                    backgroundImage: AssetImage("assets/images/MyPhoto.jpeg"),
                  ),
                  title: Text(contacts[index]),
                  subtitle: const Text("This my msg"),
                  trailing: Text(DateTime.now().toString()),
                );
              },
            ),
            const Center(
              child: Text("This Status tab"),
            ),
            const Center(
              child: Text("This Calls tab"),
            ),
          ]),
        ));
  }
}
