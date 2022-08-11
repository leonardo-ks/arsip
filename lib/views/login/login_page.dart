import 'package:arsip/data/api/api_service.dart';
import 'package:arsip/views/main/home_page.dart';
import 'package:arsip/views/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = false;
  bool obscured = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> checkToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLogin = pref.containsKey('jwt');
  }

  @override
  void initState() {
    super.initState();
    checkToken();
    if (isLogin) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  void login(String identifier, String password) async {
    var response = (await ApiService().login(identifier, password));
    if (response?.username != null) {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) => setState(
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      );
    } else {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) => setState(
          () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Login Failed",
                ),
              ),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[900],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.string(
                '<svg xmlns="http://www.w3.org/2000/svg" width="213.324" height="213.324" viewBox="0 0 213.324 213.324"><g id="_9012561672fa6e03863e81fd57221698" data-name="9012561672fa6e03863e81fd57221698" transform="translate(-2 -2)"><path id="Path_1" data-name="Path 1" d="M193.1,2H24.221A22.221,22.221,0,0,0,2,24.221V193.1a22.221,22.221,0,0,0,22.221,22.221H193.1A22.221,22.221,0,0,0,215.324,193.1V24.221A22.221,22.221,0,0,0,193.1,2Z" transform="translate(0 0)" fill="#ff6f00"/><path id="Path_2" data-name="Path 2" d="M122.938,58.893h-3.444l-4.911-4.911-.044-.044A11.813,11.813,0,0,0,105.761,50h-33l-15.51-15.51.4.533a11.831,11.831,0,0,0-9.666-5.022H38.3A11.831,11.831,0,0,0,26.475,41.827v65.242a11.736,11.736,0,0,0,1.844,6.311,12.271,12.271,0,0,0,2.555,2.867L95.728,181.1h67.464a22.221,22.221,0,0,0,22.221-22.221V118.146L129.471,62.2a8.034,8.034,0,0,0-6.533-3.311Z" transform="translate(29.912 34.226)" fill="#c05600"/><path id="Path_3" data-name="Path 3" d="M129.466,62.2a8.034,8.034,0,0,0-6.533-3.311H117.2A11.9,11.9,0,0,0,105.756,50H67.179A7.388,7.388,0,0,1,59.8,42.622v-.8A11.844,11.844,0,0,0,47.98,30H38.292A11.831,11.831,0,0,0,26.47,41.822v65.242a11.864,11.864,0,0,0,11.822,11.822h67.464a11.839,11.839,0,0,0,11.355-8.489l13.555-41a8.012,8.012,0,0,0-1.2-7.2ZM30.914,41.822a7.388,7.388,0,0,1,7.377-7.377H47.98a7.388,7.388,0,0,1,7.377,7.377v.8A11.816,11.816,0,0,0,67.179,54.443h38.576a7.431,7.431,0,0,1,6.733,4.444H50.536A8.053,8.053,0,0,0,42.8,64.6L30.914,102.952V41.822Z" transform="translate(29.905 34.22)" fill="#fff"/><path id="Path_4" data-name="Path 4" d="M51.2,70.212A2.222,2.222,0,0,1,49.1,67.245l.111-.311A2.222,2.222,0,1,1,53.4,68.423l-.112.311A2.222,2.222,0,0,1,51.2,70.212Z" transform="translate(57.41 77.551)" fill="#fff"/></g></svg>'),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'ARSIP\nDIGITAL',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: TextField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  hintText: 'Username',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscured,
                decoration: InputDecoration(
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
                  prefixIcon: Transform.rotate(
                    angle: 12,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(3.14),
                      child: const Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'No have account?',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Click Here!',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      login(usernameController.text, passwordController.text);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.black12,
                      ),
                    ),
                    child: const SizedBox(
                      width: 50,
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
