import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/133774622?v=4"),
              ),
              accountName: Text("MAYUR AMBALIYA"),
              accountEmail: Text("mayurambaliya56@gmail.com"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
    );
  }
}
