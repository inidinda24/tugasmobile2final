import 'package:flutter/material.dart';
import 'package:tugas_mobile2/halamanlogin.dart';
import 'package:tugas_mobile2/menuutama.dart';
import 'menubantuan.dart';

class halamanutama extends StatefulWidget {
  const halamanutama({super.key});

  @override
  State<halamanutama> createState() => _halamanutamaState();
}

class _halamanutamaState extends State<halamanutama> {
  bool tampilanDefault = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MyStopwatch",
          style:
              TextStyle(fontFamily: "Mooli", color: Colors.white, fontSize: 25),
        ),
        actions: [
          Visibility(
            visible: (tampilanDefault)? false:true,
              child: IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                _logOut(context);
            },
          ))
        ],
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Visibility(
                visible: (tampilanDefault) ? true : false, child: menuUtama()),
            Visibility(
                visible: (tampilanDefault) ? false : true,
                child: menuBantuan()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: (tampilanDefault) ? 0 : 1,
        onTap: (int index) {
          if (index == 0) {
            setState(() {
              tampilanDefault = true;
            });
          } else if (index == 1) {
            setState(() {
              tampilanDefault = false;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Bantuan',
          ),
        ],
      ),
    );
  }
}

void _logOut(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (BuildContext context) => halamanlogin()));
}
