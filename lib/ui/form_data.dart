import 'package:flutter/material.dart';
import 'package:h1d023002_tugas6/ui/tampil_data.dart';

class FormData extends StatefulWidget {
  const FormData({super.key});

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _tahunLahirController = TextEditingController();

  // Fungsi untuk menghitung umur
  int _hitungUmur(int tahunLahir) {
    int tahunSekarang = DateTime.now().year;
    return tahunSekarang - tahunLahir;
  }

  void _simpanData() {
    String nama = _namaController.text;
    String nim = _nimController.text;
    int? tahunLahir = int.tryParse(_tahunLahirController.text);

    // Validasi sederhana
    if (nama.isEmpty || nim.isEmpty || tahunLahir == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi dengan benar!')),
      );
      return;
    }

    int umur = _hitungUmur(tahunLahir);

    // Navigasi ke halaman TampilData dan kirim data melalui Constructor
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TampilData(
          nama: nama,
          nim: nim,
          umur: umur,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📝 Input Data', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Contoh :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            
            // Input Nama
            _buildTextField(
              controller: _namaController,
              labelText: 'Nama',
              hintText: '',
            ),
            const SizedBox(height: 15.0),

            // Input NIM
            _buildTextField(
              controller: _nimController,
              labelText: 'NIM',
              hintText: '',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 15.0),

            // Input Tahun Lahir
            _buildTextField(
              controller: _tahunLahirController,
              labelText: 'Tahun Lahir',
              hintText: '',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30.0),

            // Tombol Simpan
            ElevatedButton(
              onPressed: _simpanData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 5,
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk TextField
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.blue.shade50,
      ),
    );
  }
}