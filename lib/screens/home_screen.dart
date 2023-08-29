import 'package:blackcoffer/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: const Text("Blackcoffer"),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple,
            backgroundImage: NetworkImage(ap.userModel.profilePicture),
            radius: 100,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Name : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.name, style: const TextStyle(fontSize: 17)),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Email : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.email, style: const TextStyle(fontSize: 17)),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Phone No : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.phoneNumber,
                  style: const TextStyle(fontSize: 17)),
            ],
          ),
          const Divider(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bio : ", style: TextStyle(fontSize: 17)),
              Text(ap.userModel.bio, style: const TextStyle(fontSize: 17)),
            ],
          ),
          // Text(ap.userModel.name),
          // Text(ap.userModel.phoneNumber),
          // Text(ap.userModel.email),
          // Text(ap.userModel.bio),
        ],
      )),
    );
  }
}
