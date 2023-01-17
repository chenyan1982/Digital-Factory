import 'package:upgrader/upgrader.dart';

AppcastConfiguration appcastConfiguration() {
  final appcastURL =
      'https://raw.githubusercontent.com/chenyan1982/Digital-Factory/upgrader/appcast.xml';
  final cfg = AppcastConfiguration(url: appcastURL, supportedOS: ['android']);
  return cfg;
}
