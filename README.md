# NIM_Tugas6 - Passing Data Antar Halaman di Flutter
## Proses Passing Data dari FormData ke TampilData

Data yang diinput dari `form_data.dart` (Nama, NIM, Tahun Lahir) diproses, dan Umur dihitung. Data ini kemudian dikirim ke `tampil_data.dart` menggunakan mekanisme **Constructor**.

### 1. Di Halaman Pengirim (`form_data.dart`)

Data dikirim saat navigasi menggunakan `Navigator.push()`:

dart<br>
`// Hitung umur`<br>
int umur = _hitungUmur(tahunLahir);<br><br>

`// Navigasi ke halaman TampilData dan kirim data melalui constructor`<br>
Navigator.push(<br>
  context,<br>
  MaterialPageRoute(<br>
    builder: (context) => TampilData(<br>
     ` // Data yang di-pass`<br>
      nama: nama, <br>
      nim: nim,<br>
      umur: umur,<br>
    ),<br>
  ),<br>
);<br>

### 2. Di Halaman Penerima (tampil_data.dart)
Halaman tujuan (TampilData) harus memiliki Constructor yang menerima parameter yang dikirim, dan variabel internal untuk menyimpannya, yang kemudian dapat digunakan di dalam build() method untuk menampilkan hasil:

Dart<br>

class TampilData extends StatelessWidget {<br>
 ` // 1. Deklarasikan variabel untuk menampung data`<br>
  final String nama;<br>
  final String nim;<br>
  final int umur;<br><br>

` // 2. Definisikan Constructor untuk menerima data`<br>
  const TampilData({<br>
    super.key,<br>
    required this.nama,<br>
    required this.nim,<br>
    required this.umur,<br>
  });<br><br>

 ` // 3. Gunakan data di dalam method build`<br>
  @override<br>
  Widget build(BuildContext context) {<br>
   ` // Data (nama, nim, umur) dapat langsung diakses dan ditampilkan di sini.`<br>
  }<br>
}<br>
