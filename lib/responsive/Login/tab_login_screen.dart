import 'package:employee_manager_web/constants.dart';
import 'package:flutter/material.dart';

class TabLoginScreen extends StatelessWidget {
  const TabLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          SizedBox(
            height: height(context),
            width: width(context),
            child: Image.asset(
              "assets/loginbg.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "hey\nwelcome back 🎉",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: width(context) * 0.08,
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.06,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width(context) * 0.55),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width(context) * 0.02,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: width(context) * 0.02,
                      ),
                      fillColor: Colors.black,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width(context) * 0.35),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width(context) * 0.02,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: width(context) * 0.02,
                      ),
                      fillColor: Colors.black,
                      filled: true,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: height(context) * 0.06,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: const LinearBorder(),
                  ),
                  onPressed: () {},
                  onHover: (value) {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width(context) * 0.02,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
