part of 'constant.dart';

class ApiConstant {
  static String get login => 'api/login';
  static String get register => 'api/register';
  static String get refreshToken => 'api/refresh';
  static String get profile => 'api/profile';

  //! PENGONTRAK
  static String get pengontrakHome => 'api/pengontrak/home';
  static String get pengontrakKosDetail => 'api/pengontrak/kost-detail';

  //! REGION
  static String get province => 'api/alamat/provinsi';
  static String city(int id) => 'api/alamat/kabupaten/$id';
  static String subdistrict(int id) => 'api/alamat/kecamatan/$id';
  static String village(int id) => 'api/alamat/desa/$id';

  //! PEMILIK
  static String get pemilik => '/api/pemilik';
  static String get kos => 'api/kost';
}
