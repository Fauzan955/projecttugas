import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String teamName;
  final String captain;
  final String phone;
  final String address;
  final String players;
  final String category;

  const ConfirmationPage({
    super.key,
    required this.teamName,
    required this.captain,
    required this.phone,
    required this.address,
    required this.players,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Pendaftaran'),
        backgroundColor:Color.fromARGB(255, 134, 146, 164),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Icon(Icons.check_circle, color: Color.fromARGB(255, 134, 146, 164), size: 80),
                ),
                const SizedBox(height: 20),
                Text('Nama Tim: $teamName', style: const TextStyle(fontSize: 18)),
                Text('Nama Kapten: $captain', style: const TextStyle(fontSize: 18)),
                Text('Nomor Telepon: $phone', style: const TextStyle(fontSize: 18)),
                Text('Alamat: $address', style: const TextStyle(fontSize: 18)),
                Text('Jumlah Pemain: $players', style: const TextStyle(fontSize: 18)),
                Text('Kategori: $category', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.home),
                    label: const Text('Kembali ke Form'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 134, 146, 164),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}