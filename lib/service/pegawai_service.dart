import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/pegawai.dart';

class PegawaiService {
  Future<List<Pegawai>> listData() async {
    final Response response = await ApiClient().get('pegawai');
    final List data = response.data as List;
    return data.map((json) => Pegawai.fromJson(json)).toList();
  }

  Future<Pegawai> simpan(Pegawai pegawai) async {
    final Response response =
        await ApiClient().post('pegawai', pegawai.toJson());
    return Pegawai.fromJson(response.data);
  }

  Future<Pegawai> ubah(Pegawai pegawai, String id) async {
    final Response response =
        await ApiClient().put('pegawai/$id', pegawai.toJson());
    return Pegawai.fromJson(response.data);
  }

  Future<Pegawai> getById(String id) async {
    final Response response = await ApiClient().get('pegawai/$id');
    return Pegawai.fromJson(response.data);
  }

  Future<Pegawai> hapus(Pegawai pegawai) async {
    final Response response =
        await ApiClient().delete('pegawai/${pegawai.id}');
    return Pegawai.fromJson(response.data);
  }
}