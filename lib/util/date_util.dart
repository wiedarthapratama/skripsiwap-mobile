part of 'util.dart';

extension DateFormatStringExt on String {
  DateTime get dateFormat {
    try {
      return DateTime.parse(this);
    } catch (_) {
      return DateTime.now();
    }
  }

  DateTime get parse {
    Map<String, String> bulan = {
      'Januari': '01',
      'Febuari': '02',
      'Maret': '03',
      'April': '04',
      'Mei': '05',
      'Juni': '06',
      'Juli': '07',
      'Agustus': '08',
      'September': '09',
      'Oktober': '10',
      'November': '11',
      'Desember': '12',
    };
    List<String> dates = split(' ');
    return '${dates[2]}-${bulan[dates[1]]}-${dates[0]}'.dateFormat;
  }
}

extension DateTimeExt on DateTime {
  String get asStringTime {
    DateFormat format = DateFormat('HH:mm', 'id');

    return format.format(this);
  }

  String get asStringDate {
    DateFormat format = DateFormat('yyyy-MM-dd', 'id');

    return format.format(this);
  }

  String get formatdmY {
    DateFormat format = DateFormat('dd MMMM yyyy', 'id');
    return format.format(this);
  }

  String get formatdmYAbbrMonth {
    DateFormat format = DateFormat('dd MMM yyyy', 'id');
    return format.format(this);
  }

  String get formatdmYHm {
    DateFormat format = DateFormat('dd MMMM yyyy HH:mm', 'id');
    return format.format(this);
  }

  String get formatEdmY {
    DateFormat format = DateFormat('EEEE, dd MMMM yyyy', 'id');
    return format.format(this);
  }

  String get formatWeekday {
    DateFormat format = DateFormat('EEEE', 'id');
    return format.format(this);
  }

  String get chatFormat {
    DateTime from = this;
    DateTime today = DateUtils.dateOnly(DateTime.now());

    if (from.millisecondsSinceEpoch == today.millisecondsSinceEpoch) {
      return 'Hari Ini';
    }

    DateTime tomorrow = DateUtils.addDaysToDate(today, -1);
    if (from.millisecondsSinceEpoch == tomorrow.millisecondsSinceEpoch) {
      return 'Kemarin';
    }

    return formatEdmY;
  }
}
