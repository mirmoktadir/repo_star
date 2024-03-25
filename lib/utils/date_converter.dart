import 'package:intl/intl.dart';

String dateConverter(
    {required String? inputTime, required String outputFormat}) {
  final dateTimeString = inputTime;
  final dateTime = DateTime.parse(dateTimeString!);

  final format = DateFormat(outputFormat);
  final customTime = format.format(dateTime);

  return customTime;
}

String timeDifference({required String? inputTime}) {
  DateTime providedDate = DateTime.parse(inputTime.toString());
  DateTime now = DateTime.now();
  Duration difference = now.difference(providedDate);
  if (difference.inDays > 0) {
    return "${difference.inDays} days ago";
  } else if (difference.inHours > 0) {
    return "${difference.inHours} hours ago";
  } else if (difference.inMinutes > 0) {
    return "${difference.inMinutes} minutes ago";
  } else {
    return "just now";
  }
}
