import 'package:flutter/material.dart';
import 'confirmation_page.dart';
import 'team_list_page.dart';


void main() {
  runApp(const FutsalRegistrationApp());
}

class FutsalRegistrationApp extends StatelessWidget {
  const FutsalRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Pendaftaran Turnamen Futsal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: const RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk input
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _captainController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _playersController = TextEditingController();

  String _category = 'Umum'; // default

void _submitForm() {
  if (_formKey.currentState!.validate()) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(
          teamName: _teamNameController.text,
          captain: _captainController.text,
          phone: _phoneController.text,
          address: _alamatController.text,
          players: _playersController.text,
          category: _category,
        ),
      ),
    );
  }
}


  @override
  void dispose() {
    _teamNameController.dispose();
    _captainController.dispose();
    _phoneController.dispose();
    _alamatController.dispose();
    _playersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text('Form Pendaftaran'),
  backgroundColor: const Color.fromARGB(255, 134, 146, 164),
  actions: [
    IconButton(
      icon: const Icon(Icons.list),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TeamListPage()),
        );
      },
    ),
  ],
),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _teamNameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Tim',
                  prefixIcon: Icon(Icons.sports_soccer),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Nama tim tidak boleh kosong' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _captainController,
                decoration: const InputDecoration(
                  labelText: 'Nama Kapten',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Nama kapten tidak boleh kosong' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nomor telepon tidak boleh kosong';
                  }
                  if (value.length < 11) {
                    return 'Nomor telepon tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Alamat tidak boleh kosong' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _playersController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Pemain',
                  prefixIcon: Icon(Icons.group),
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Jumlah pemain wajib diisi' : null,
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Kategori Turnamen',
                  prefixIcon: Icon(Icons.category),
                ),
                items: const [
                  DropdownMenuItem(value: 'Umum', child: Text('Umum')),
                  DropdownMenuItem(value: 'Pelajar', child: Text('Pelajar')),
                  DropdownMenuItem(value: 'Mahasiswa', child: Text('Mahasiswa')),
                ],
                onChanged: (value) => setState(() {
                  _category = value!;
                }),
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text('Daftar'),
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 134, 146, 164),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
