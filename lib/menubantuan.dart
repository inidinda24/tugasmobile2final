import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class menuBantuan extends StatelessWidget {
  const menuBantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}