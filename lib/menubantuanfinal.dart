import 'package:flutter/material.dart';
import 'package:tugas_mobile2/halamanlogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class menuBantuanFinal extends StatefulWidget {
  const menuBantuanFinal({super.key});

  @override
  State<menuBantuanFinal> createState() => _menuBantuanFinalState();
}

class _menuBantuanFinalState extends State<menuBantuanFinal> {
  bool tampilanDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "MyStopwatch",
          style:
          TextStyle(fontFamily: "Mooli", color: Colors.white, fontSize: 25),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _logOut(context);
              },
          )
        ],
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("Cara menggunakan MyStopwatch", style: GoogleFonts.lexend(fontSize: 20.0, color: Colors.teal, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Container(
                width: double.infinity, // Lebar container mengisi seluruh lebar layar
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("1. Ketik dan kirimkan username dan password dengan benar untuk bisa masuk ke dalam aplikasi", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                    Text("2. Setelah berhasil masuk, kamu langsung disuguhkan halaman Home yang berisi konten Daftar Anggota dan Stopwatch", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                    Text("3. Kamu bisa menambahkan anggota favorit dengan menekan ikon love", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                    Text("4. Selain itu kamu bisa mengunjungi akun instagram anggota tersebut dengan menekan ikon Instagram", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                    Text("5. Kemudian untuk fitur utamanya yaitu Stopwatch, fitur ini terletak di bawah daftar anggota. Kalian bisa melakukan perhitungan maju menggunakan Stopwatch ini", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                    Text("6. Tekan tombol 'Start' untuk memulai perhitungan, 'Pause' untuk menjeda, 'Reset' untuk memulai ulang, dan 'Lap' untuk mencatat waktu sementara yang nanti akan terekam di bawah tombol-tombol tersebut", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                    Text("7. Terdapat dua menu yang bisa dipilih melalui bilah navigasi, yaitu 'Home' dan 'Bantuan'", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                    Text("8. Jika ingin keluar dari aplikasi, silakan tekan ikon logout yang terletak di bilah aplikasi sebelah kanan", style: GoogleFonts.lexend(fontSize: 14.0, color: Colors.teal)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {}
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Utama',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
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
