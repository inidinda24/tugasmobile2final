import 'package:flutter/material.dart';
import 'package:tugas_mobile2/halamanutama.dart';

class halamanlogin extends StatelessWidget {
  const halamanlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Main Page",
          style: TextStyle(
              fontFamily: 'Mooli', fontSize: 18.0, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 8),
            Icon(
              Icons.person_2_rounded,
              size: 50,
              color: Colors.teal,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontFamily: 'Mooli',
                fontSize: 30,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextFormField(
                      //controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        floatingLabelStyle:
                        TextStyle(color: Colors.teal, fontFamily: 'Mooli'),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.teal, width: 1),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextFormField(
                      obscureText: true,
                      //controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        floatingLabelStyle:
                        TextStyle(color: Colors.teal, fontFamily: 'Mooli'),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Colors.teal, width: 1),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .teal, // Atur warna latar belakang tombol menjadi hijau
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return halamanutama(); // masuk ke page 1
                          }));
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Mooli',
                          fontSize: 11.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot the password?',
                style: TextStyle(color: Colors.red, fontFamily: 'Mooli'),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
