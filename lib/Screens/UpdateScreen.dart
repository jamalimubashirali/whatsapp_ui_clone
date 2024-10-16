import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Updates"),
        actions: [
          const Icon(Icons.camera_alt_outlined),
          const SizedBox(
            width: 15,
          ),
          const Icon(Icons.search_rounded),
          PopupMenuButton(
              offset: const Offset(0, 50),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(child: Text("Status privacy")),
                  PopupMenuItem(child: Text("Create channel")),
                  PopupMenuItem(child: Text("Settings"))
                ];
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 10.0, bottom: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Status",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(40, (index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 15),
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.greenAccent, width: 1)),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/MyPhoto.jpeg"),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 0, right: 15),
                              child: Text("Status"),
                            )
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Channels",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "Explore",
                            style: TextStyle(color: Colors.green),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.green,
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(10, (index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage("assets/images/MyPhoto.jpeg"),
                        ),
                        title: Text("Channel $index"),
                        trailing: const Text("12.00 PM"),
                        subtitle: const Text("This is channel update"),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );
  }
}
