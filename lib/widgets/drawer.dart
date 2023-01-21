import 'package:flutter/material.dart';
import 'package:movieapp/providers/auth.dart';
import 'dart:math';

import 'package:movieapp/screens/auth.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  final List<List<String>> quotes = const [
    ["May the Force be with you.", "Star Wars, 1977"],
    ["I'm the king of the world!", "Titanic, 1977"],
    ["Elementary, my dear Watson.", "The Adventures of Sherlock Holmes, 1939"]
  ];

  @override
  Widget build(BuildContext context) {
    final int quotesNumber = Random().nextInt(3);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quotes[quotesNumber][0],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        quotes[quotesNumber][1],
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                )),
          ),
          // ListTile(
          InkWell(
            onTap: () {
              Provider.of<Authentication>(context, listen: false).logOut();
              Navigator.pop(context);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Log Out?'),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(Icons.logout)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
