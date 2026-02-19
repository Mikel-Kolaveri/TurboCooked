// ignore_for_file: prefer_moving_to_variable

extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    Duration diff = DateTime.now().difference(this);
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago';
    }
    if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago';
    }
    if (diff.inDays > 7) {
      return '${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago';
    }
    if (diff.inDays > 0) {
      return '${diff.inDays} days ago';
    }
    if (diff.inHours > 0) {
      return '${diff.inHours} ${diff.inHours == 1 ? 'h ago' : 'h ago'} ';
    }
    if (diff.inMinutes > 0) {
      return '${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago';
    }
    return 'just now';
  }
}
