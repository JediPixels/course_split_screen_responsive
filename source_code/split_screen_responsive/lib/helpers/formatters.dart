/// Format Numbers or Dates
class Format {
  /// Formats Integer with Commas i.e. $1,450
  static String toCurrency(int numberToFormat) {
    final String numberFormatted = numberToFormat
        .toString()
        .replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return '\$$numberFormatted';
  }

  /// Formats Date to a readable format i.e. January 1, 2024
  static String toReadableDate(DateTime dateTime) {
    String month = getMonthName(dateTime.month);
    int day = dateTime.day;
    int year = dateTime.year;

    return '$month, $day $year';
  }

  static String getMonthName(int month) {
    return switch (month) {
      1 => 'January',
      2 => 'February',
      3 => 'March',
      4 => 'April',
      5 => 'May',
      6 => 'June',
      7 => 'July',
      8 => 'August',
      9 => 'September',
      10 => 'October',
      11 => 'November',
      12 => 'December',
      _ => 'Unknown'
    };
  }
}
