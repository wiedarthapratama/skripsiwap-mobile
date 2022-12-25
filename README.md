# Dokumentasi
## Yang harus dilakukkan setelah pull
Sebelum run debug apps, berikan command dibawah ini di terminal (Home Project) :
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```
dan
```sh
flutter gen-l10n 
```

## Cara build apps untuk ios dan android
sebelum build aplikasi pastikan naikkan version pada **`pubspec.yaml`** lalu menjalankan perintah dibawah ini terlebih dahulu :
```sh
flutter clean && flutter pub get && cd ios && pod install
```
### IOS
1. Buka terminal dan cd ke Home Project
2. masukkan command di bawah ini :
```sh
flutter build ipa --release --obfuscate --split-debug-info=build/app/outputs/obfuscating --export-options-plist=ios/ExportOption.plist
```
### Android
1. Buka terminal dan cd ke Home Project
2. masukkan command di bawah ini :
```sh
flutter build appbundle --release --obfuscate --split-debug-info=build/app/outputs/obfuscating
```

## Cara menambahkan/mengupdate image, color, bahasa
### Asset Image
1. buka folder **`Asset/(image,navigation,outline,solid)`**
2. simpan, hapus dan update image di dalam folder tersebut
3. setelah update jalankan perintah dibawah ini pada terminal :
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### Asset Color
1. buka folder **`Asset/color/color.xml`**
2. tambahkan code dibawah ini di dalam tag **`<recources>...</recources>`**
```xml
<color name="{nama_warna}">{kode_hex}</color>
```
3. setelah update jalankan perintah dibawah ini pada terminal :
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```
tambahkan attribute **`type="material"`** jika warna tersebut adalah material color.

### Bahasa
1. buka folder **`lib/l10n/app_{country_code}.arb`**
2. simpan, hapus dan update text di dalam file tersebut
3. setelah update jalankan perintah dibawah ini pada terminal :
```sh
flutter gen-l10n 
```

## Notes
Jika ada update pada **`Images`**, **`Color`**, dan **`Flavor/Environment`** lakukan perintah dibawah ini :
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```
Jika sudah melakukan perintah diatas, masih belum ada perubahan, maka jalankan perintah dibawah ini terlebih dahulu :
```sh
flutter pub run build_runner clean
```
lalu jalankan kembali perintah diatas.