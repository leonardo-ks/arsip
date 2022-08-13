import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/data/model/user_model.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int? id;
  bool obscured = true;
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
    await ApiService().getUserInfo().then((value) => {
          usernameController.text = '${value?.username}',
          emailController.text = '${value?.email}',
          id = value?.id,
        });
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          isLoading = false;
        }));
  }

  Future<void> _updateUserInfo() async {
    isLoading = true;
    String message = "Update Success";
    await ApiService()
        .updateUserInfo(id!, usernameController.text, emailController.text,
            passwordController.text)
        .then(
          (value) => {
            if (value.runtimeType == UserModel) {
              usernameController.text = '${value?.username}',
              emailController.text = '${value?.email}',
            } else {
              message = value.message,
            }
          },
        );
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
          ),
        );
        isLoading = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade900,
          title: Text(usernameController.text),
        ),
        body: isLoading ? Center(
          child: CircularProgressIndicator(
            color: Colors.amber.shade900,
          ),
        ) : SingleChildScrollView(
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
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text('Username'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade900,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade900,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscured,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscured ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            obscured = !obscured;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade900,
                        ),
                      ),
                      filled: true,
                      contentPadding: const EdgeInsets.all(16),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _updateUserInfo();
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
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
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
  }
}
