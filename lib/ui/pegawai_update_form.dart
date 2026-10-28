import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nipCtrl.text = widget.pegawai.nip;
    _namaCtrl.text = widget.pegawai.nama;
    _tanggalLahirCtrl.text = widget.pegawai.tanggalLahir;
    _nomorTeleponCtrl.text = widget.pegawai.nomorTelepon;
    _emailCtrl.text = widget.pegawai.email;
    _passwordCtrl.text = widget.pegawai.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("NIP", _nipCtrl),
              _field("Nama", _namaCtrl),
              _field("Tanggal Lahir (YYYY-MM-DD)", _tanggalLahirCtrl),
              _field("Nomor Telepon", _nomorTeleponCtrl),
              _field("Email", _emailCtrl),
              _field("Password", _passwordCtrl, obscure: true),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _field(String label, TextEditingController ctrl, {bool obscure = false}) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: ctrl,
      obscureText: obscure,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Pegawai pegawai = Pegawai(
            nip: _nipCtrl.text,
            nama: _namaCtrl.text,
            tanggalLahir: _tanggalLahirCtrl.text,
            nomorTelepon: _nomorTeleponCtrl.text,
            email: _emailCtrl.text,
            password: _passwordCtrl.text,
          );
          String id = widget.pegawai.id.toString();
          final value = await PegawaiService().ubah(pegawai, id);
          if (!mounted) return;
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: value)));
        },
        child: const Text("Simpan Perubahan"));
  }
}