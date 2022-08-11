import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/shared_preferences/shared_preferences_services.dart';
import 'package:arsip/views/login/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    await ApiService().getUserInfo().then(
          (value) => {
            usernameController.text = '${value?.username}',
            emailController.text = '${value?.email}',
          },
        );
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {isLoading = false;}));
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade900,
          title: Text(usernameController.text),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 116,
                  height: 116,
                  child: CircleAvatar(
                    backgroundColor: Colors.amber.shade900,
                    maxRadius: 116,
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 90,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    usernameController.text,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.amber.shade900,
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      'Edit Profiles',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Username'),
                      border: OutlineInputBorder(),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      border: OutlineInputBorder(),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                ElevatedButton(
                  onPressed: () {
                    SharedPreferencesService().deleteData('jwt');
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.amber.shade900,
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade900,
          title: Text(usernameController.text),
        ),
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.amber.shade900,
          ),
        ),
      );
    }
  }
}
