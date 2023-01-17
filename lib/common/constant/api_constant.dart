part of 'constant.dart';

class ApiConstant {
  static String get login => 'api/login';
  static String get logout => 'api/logout';
  static String get register => 'api/register';
  static String get refreshToken => 'api/refresh';
  static String get profile => 'api/profile';
  static String get ubahProfile => 'api/profile/update';
  static String get ubahPassword => 'api/profile/password';
  static String get saveOrUpdateToken => 'api/firebase/create-or-update-token';

  //! PENGONTRAK
  static String get pengontrakHome => 'api/pengontrak/home';
  static String get pengontrakKosDetail => 'api/pengontrak/kost-detail';
  static String get pengontrakKosSaya => 'api/pengontrak/kost-saya';
  static String get pembayaranSubmit => 'api/pengontrak/submit-pembayaran';
  static String get pembayaranDetail => 'api/pengontrak/pembayaran/detail';
  static String get pengontrakPengaduanDetail =>
      'api/pengontrak/pengaduan/detail';
  static String get pengaduanSubmit => 'api/pengontrak/submit-pengaduan';

  //! REGION
  static String get province => 'api/alamat/provinsi';
  static String city(int id) => 'api/alamat/kabupaten/$id';
  static String subdistrict(int id) => 'api/alamat/kecamatan/$id';
  static String village(int id) => 'api/alamat/desa/$id';

  //! PEMILIK
  static String get pemilik => '/api/pemilik';
  static String get kos => 'api/kost';
  static String get kosTipe => 'api/kost-tipe';
  static String get kosFoto => 'api/kost-foto';

  //! PEKERJA
  static String get pekerja => 'api/pekerja';
  static String get pengontrak => 'api/pengontrak';
  static String get pengaduan => 'api/pengaduan';
  static String get pengaduanKirimPekerja => 'api/pengaduan/kirim-pekerja';

  //! PEMBAYARAN
  static String get pembayaran => 'api/pembayaran';
  static String get pembayaranTerima => 'api/pembayaran/terima';
  static String get pembayaranTolak => 'api/pembayaran/tolak';

  //! PEMBAYARAN
  static String get pendaftaran => 'api/pendaftaran';
  static String get pendaftaranTerima => 'api/pendaftaran/terima';

  //! BANK PENYEDIA
  static String get bank => 'api/bank';
  static String get bankPemilik => 'api/bank/id-pemilik';

  //! NOTIFIKASI
  static String get notifikasi => 'api/notifikasi';

  // PENDAFTARAN
  static String get pendaftaranSubmit => 'api/pengontrak/pendaftaran';
}
