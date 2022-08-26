import 'package:intl/intl.dart';

final _EEEEMMMMddyyyy = DateFormat('EEEE, MMMM dd, yyyy');
final _EMMMddyyyy = DateFormat('E, MMM dd, yyyy');

extension DateTimeFormatUtils on DateTime {
  /// Return a Formatted [String] date in [EEEE, MMMM dd, yyyy] format.
  String get EEEEMMMMddyyyy => _EEEEMMMMddyyyy.format(this);

  /// Return a Formatted [String] date in [E, MMM dd, yyyy] format.
  String get EMMMddyyyy => _EMMMddyyyy.format(this);

  /// Return a Formatted [String] date in am/pm format.
  String get jm => DateFormat.jm().format(this);
}