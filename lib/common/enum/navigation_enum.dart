part of 'enum.dart';

enum NavigationEnum { search, myFlat, profile }

extension NavigationEnumExt on NavigationEnum {
  int get key {
    switch (this) {
      case NavigationEnum.search:
        return 0;
      case NavigationEnum.myFlat:
        return 1;
      case NavigationEnum.profile:
        return 2;
    }
  }

  String get name {
    switch (this) {
      case NavigationEnum.search:
        return 'Cari';
      case NavigationEnum.myFlat:
        return 'Kost Saya';
      case NavigationEnum.profile:
        return 'Profil';
    }
  }

  Widget get page {
    switch (this) {
      case NavigationEnum.search:
        return const SearchPage();
      case NavigationEnum.myFlat:
        return const MyFlatPage();
      case NavigationEnum.profile:
        return const ProfilePage();
    }
  }

  IconData get icon {
    switch (this) {
      case NavigationEnum.search:
        return Icons.search;
      case NavigationEnum.myFlat:
        return Icons.home;
      case NavigationEnum.profile:
        return Icons.person;
    }
  }
}

extension IntExt on int {
  NavigationEnum get asNavigation {
    switch (this) {
      case 0:
        return NavigationEnum.search;
      case 1:
        return NavigationEnum.myFlat;
      case 2:
        return NavigationEnum.profile;
      default:
        return NavigationEnum.search;
    }
  }
}
