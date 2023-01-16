import 'package:skripsi_wap/common/constant/constant.dart';
import 'package:skripsi_wap/data/data_source/remote_data_source.dart';
import 'package:skripsi_wap/data/model/master/bank_model.dart';
import 'package:skripsi_wap/data/response/base_response.dart';

abstract class BankRemoteDataSource {
  Future<List<BankModel>> getListBankPenyedia();
  Future<List<BankModel>> getListBankPemilik({required int idPemilik});
  Future<BankModel> getDetailBankPenyedia({required int id});
  Future<BaseResponse> saveBankPenyedia(
      {required String namaBank,
      required String namaRekening,
      required String noRekening});
  Future<BaseResponse> updateBankPenyedia(
      {required int id,
      required String namaBank,
      required String namaRekening,
      required String noRekening});
  Future<BaseResponse> deleteBankPenyedia({
    required int id,
  });
}

class BankRemoteDataSourceImpl extends RemoteDataSource
    implements BankRemoteDataSource {
  @override
  Future<List<BankModel>> getListBankPenyedia() async {
    final response = await dio.get(ApiConstant.bank, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return (result.data as List).map((e) => BankModel.fromJson(e)).toList();
  }

  @override
  Future<List<BankModel>> getListBankPemilik({required int idPemilik}) async {
    final response = await dio.get('${ApiConstant.bankPemilik}/$idPemilik',
        options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return (result.data as List).map((e) => BankModel.fromJson(e)).toList();
  }

  @override
  Future<BankModel> getDetailBankPenyedia({required int id}) async {
    final response =
        await dio.get('${ApiConstant.bank}/$id', options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return BankModel.fromJson(result.data);
  }

  @override
  Future<BaseResponse> saveBankPenyedia(
      {required String namaBank,
      required String namaRekening,
      required String noRekening}) async {
    final data = <String, dynamic>{
      'nama_bank': namaBank,
      'nama_rekening': namaRekening,
      'nomor_rekening': noRekening,
    };

    final response =
        await dio.post(ApiConstant.bank, data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<BaseResponse> updateBankPenyedia(
      {required int id,
      required String namaBank,
      required String namaRekening,
      required String noRekening}) async {
    final data = <String, dynamic>{
      'nama_bank': namaBank,
      'nama_rekening': namaRekening,
      'nomor_rekening': noRekening,
    };

    final response = await dio.post('${ApiConstant.bank}/$id',
        data: data, options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }

  @override
  Future<BaseResponse> deleteBankPenyedia({required int id}) async {
    final response =
        await dio.delete('${ApiConstant.bank}/$id', options: await baseOption);
    final result = BaseResponse.fromJson(response.data);

    return result;
  }
}
