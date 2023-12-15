import 'package:intl/intl.dart';

String setDifferentTime(String dateTime) {
  final DateTime postTime = DateTime.parse(dateTime);
  final DateTime now = DateTime.now();
  Duration difference = now.difference(postTime);
  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);
  int seconds = difference.inSeconds.remainder(60);

  if (hours > 24) {
    return DateFormat('dd MMM yyyy').format(postTime);
  }
  if (hours > 0) {
    return '$hours hr${hours > 1 ? 's' : ''} ago';
  }
  if (minutes > 0) {
    return '$minutes min${minutes > 1 ? 's' : ''} ago';
  }
  if (seconds > 0) {
    return '$seconds sec${seconds > 1 ? 's' : ''} ago';
  }

  return 'Just now';
}
