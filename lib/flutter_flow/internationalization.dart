import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'ja', 'fr', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? jaText = '',
    String? frText = '',
    String? deText = '',
  }) =>
      [enText, zh_HansText, jaText, frText, deText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'byoctihc': {
      'en': 'Welcome to DigitalFactory',
      'de': 'Willkommen bei DigitalFactory',
      'fr': 'Bienvenue sur DigitalFactory',
      'ja': 'デジタルファクトリーへようこそ',
      'zh_Hans': '欢迎来到数字工厂',
    },
    '7m5o70u8': {
      'en': 'Hello Guest! Welcome back.',
      'de': 'Hallo Gast! Willkommen zurück.',
      'fr': 'Bonjour Invité ! Content de te revoir.',
      'ja': 'こんにちはゲスト！おかえり。',
      'zh_Hans': '客人您好！欢迎回来。',
    },
    'qbhcr7z8': {
      'en': 'Create',
      'de': 'Schaffen',
      'fr': 'Créer',
      'ja': '作成',
      'zh_Hans': '创造',
    },
    '8dok0sfa': {
      'en': '1',
      'de': '1',
      'fr': '1',
      'ja': '1',
      'zh_Hans': '1个',
    },
    'hmzlh35e': {
      'en': 'OVERVIEW',
      'de': 'ÜBERBLICK',
      'fr': 'APERÇU',
      'ja': '概要',
      'zh_Hans': '概述',
    },
    'gh6q6yoe': {
      'en': 'TOTAL OUTPUT',
      'de': 'GESAMTLEISTUNG',
      'fr': 'SORTIE TOTALE',
      'ja': '総生産高',
      'zh_Hans': '总产出',
    },
    'saf5ng86': {
      'en': '500.20B',
      'de': '500.20B',
      'fr': '500.20B',
      'ja': '500.20B',
      'zh_Hans': '500.20B',
    },
    '21x8wjwg': {
      'en': 'AVG EFFICENCY ',
      'de': 'DURCHSCHNITTLICHE EFFIZIENZ',
      'fr': 'EFFICACITÉ MOYENNE',
      'ja': '平均効率',
      'zh_Hans': '平均效率',
    },
    'nilobwjj': {
      'en': '95.76%',
      'de': '95,76 %',
      'fr': '95,76 %',
      'ja': '95.76%',
      'zh_Hans': '95.76%',
    },
    '10re4v7b': {
      'en': 'OUTPUT TODAY',
      'de': 'AUSGABE HEUTE',
      'fr': 'SORTIE AUJOURD\'HUI',
      'ja': '今日のアウトプット',
      'zh_Hans': '今天的产量',
    },
    'arnt20hm': {
      'en': '0.25M',
      'de': '0,25 M',
      'fr': '0.25M',
      'ja': '0.25M',
      'zh_Hans': '0.25M',
    },
    'sgyjfrph': {
      'en': 'Timeline',
      'de': 'Zeitleiste',
      'fr': 'Chronologie',
      'ja': 'タイムライン',
      'zh_Hans': '时间线',
    },
    '4vnhjwga': {
      'en': 'Spend',
      'de': 'Ausgeben',
      'fr': 'Passer',
      'ja': '払う',
      'zh_Hans': '花费',
    },
    'i3pymgyw': {
      'en': 'Timeline',
      'de': 'Zeitleiste',
      'fr': 'Chronologie',
      'ja': 'タイムライン',
      'zh_Hans': '时间线',
    },
    'ven1qpwz': {
      'en': 'Spend',
      'de': 'Ausgeben',
      'fr': 'Passer',
      'ja': '払う',
      'zh_Hans': '花费',
    },
    'zgvfsj1c': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'fr': 'Avis',
      'ja': '通知',
      'zh_Hans': '通知',
    },
    'vi2nyjjh': {
      'en': 'Below are you new notifications.',
      'de': 'Unten sind Ihre neuen Benachrichtigungen.',
      'fr': 'Vous trouverez ci-dessous de nouvelles notifications.',
      'ja': '以下は新しい通知です。',
      'zh_Hans': '以下是您的新通知。',
    },
    'w20qzy9r': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    'cunsd5z0': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'e2vfwyui': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'gw7j3ise': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    'j1uzjil0': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    'vww8fm3v': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'vrl92nk0': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'ypwg6dnl': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    '3gcwkub9': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    'qjifeynz': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'qo1r6531': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'gxsnut94': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    'y3jglg7t': {
      'en': 'Home',
      'de': 'Zuhause',
      'fr': 'Domicile',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // devices
  {
    'vibf8vqe': {
      'en': 'Your Device',
      'de': 'Ihr Gerät',
      'fr': 'Votre appareil',
      'ja': 'あなたのデバイス',
      'zh_Hans': '你的设备',
    },
    'wqd27t6p': {
      'en': 'Your projects are below',
      'de': 'Ihre Projekte sind unten',
      'fr': 'Vos projets ci-dessous',
      'ja': 'あなたのプロジェクトは以下のとおりです',
      'zh_Hans': '您的项目如下',
    },
    'cthhf2m6': {
      'en': '1',
      'de': '1',
      'fr': '1',
      'ja': '1',
      'zh_Hans': '1个',
    },
    'p8zcj8s7': {
      'en': 'Device No.',
      'de': '成员姓名',
      'fr': '成员姓名',
      'ja': '成员姓',
      'zh_Hans': '成员姓名',
    },
    'kxq9nzn0': {
      'en': 'Email',
      'de': 'Email',
      'fr': 'E-mail',
      'ja': 'Eメール',
      'zh_Hans': '电子邮件',
    },
    'u3zsmcvt': {
      'en': 'Last Active',
      'de': 'letzte Aktivität',
      'fr': 'Dernier actif',
      'ja': '最後にログインした時',
      'zh_Hans': '最后登录',
    },
    '7wx91i56': {
      'en': 'Date Created',
      'de': 'Datum erstellt',
      'fr': 'date créée',
      'ja': '作成日',
      'zh_Hans': '创建日期',
    },
    'mhut7q6w': {
      'en': 'status',
      'de': '状态',
      'fr': '状态',
      'ja': '状態态',
      'zh_Hans': '状态',
    },
    '42w73yhk': {
      'en': 'Custom Name',
      'de': 'Benutzerdefinierter Name',
      'fr': 'Nom d\'usage',
      'ja': 'カスタム名',
      'zh_Hans': '自定义名称',
    },
    'jn9amr59': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    'pqrhzfjd': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    'x41mrf4h': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    '3kb8kdfk': {
      'en': 'Custom Name',
      'de': 'Benutzerdefinierter Name',
      'fr': 'Nom d\'usage',
      'ja': 'カスタム名',
      'zh_Hans': '自定义名称',
    },
    'ahg489ol': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    '77bqjdlt': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    'nbwyyiiy': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'ludtovuj': {
      'en': 'Custom Name',
      'de': 'Benutzerdefinierter Name',
      'fr': 'Nom d\'usage',
      'ja': 'カスタム名',
      'zh_Hans': '自定义名称',
    },
    'pu1saa1e': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    'd6d5d5q7': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    'n8euz6n2': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'y6tunj1a': {
      'en': 'Custom Name',
      'de': 'Benutzerdefinierter Name',
      'fr': 'Nom d\'usage',
      'ja': 'カスタム名',
      'zh_Hans': '自定义名称',
    },
    'qjhtccfc': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    'm57qwksq': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    '2735kfbp': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'pz3mvdm1': {
      'en': 'Custom Name',
      'de': 'Benutzerdefinierter Name',
      'fr': 'Nom d\'usage',
      'ja': 'カスタム名',
      'zh_Hans': '自定义名称',
    },
    '1sa75m4v': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    '6rgdxgvl': {
      'en': 'user@domainname.com',
      'de': 'benutzer@domainname.com',
      'fr': 'utilisateur@nomdomaine.com',
      'ja': 'user@domainname.com',
      'zh_Hans': '用户@域名.com',
    },
    'm2eonjb2': {
      'en': 'Active',
      'de': 'Aktiv',
      'fr': 'Actif',
      'ja': 'アクティブ',
      'zh_Hans': '积极的',
    },
    'wl92yxg8': {
      'en': 'Notifications',
      'de': 'Benachrichtigungen',
      'fr': 'Avis',
      'ja': '通知',
      'zh_Hans': '通知',
    },
    '88ighwvg': {
      'en': 'Below are you new notifications.',
      'de': 'Unten sind Ihre neuen Benachrichtigungen.',
      'fr': 'Vous trouverez ci-dessous de nouvelles notifications.',
      'ja': '以下は新しい通知です。',
      'zh_Hans': '以下是您的新通知。',
    },
    'dow75c37': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    'imvp4zoh': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'yg0bk3bt': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'x42j95vy': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    'zp6iay4z': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    'ydsh35x3': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'pgfbshj3': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'x3mgsj5a': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    'qu81rf0d': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    '6yl6afsi': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'ohgm7pn6': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'yvgap105': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    'ryjm6uw3': {
      'en': 'Home',
      'de': 'Zuhause',
      'fr': 'Domicile',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // responsiveTest
  {
    'cbhgiwm8': {
      'en': 'Your Projects',
      'de': 'Ihre Projekte',
      'fr': 'Tes projets',
      'ja': 'あなたのプロジェクト',
      'zh_Hans': '您的项目',
    },
    '0sls6kw7': {
      'en': 'Your projects are below, check it out.',
      'de': 'Ihre Projekte sind unten, sehen Sie es sich an.',
      'fr': 'Vos projets sont ci-dessous, consultez-les.',
      'ja': 'あなたのプロジェクトは以下にあります。チェックしてください。',
      'zh_Hans': '你的项目在下面，检查一下。',
    },
    '53zys4hr': {
      'en': '1',
      'de': '1',
      'fr': '1',
      'ja': '1',
      'zh_Hans': '1个',
    },
    'tvwlt2ke': {
      'en': 'Credit Card',
      'de': 'Kreditkarte',
      'fr': 'Carte de crédit',
      'ja': 'クレジットカード',
      'zh_Hans': '信用卡',
    },
    '2w8mpf1g': {
      'en': 'Budget',
      'de': 'Budget',
      'fr': 'Budget',
      'ja': 'バジェット',
      'zh_Hans': '预算',
    },
    '1m15wkzq': {
      'en': 'Balance',
      'de': 'Balance',
      'fr': 'Solde',
      'ja': 'バランス',
      'zh_Hans': '平衡',
    },
    'c871wtzn': {
      'en': '\$7,630',
      'de': '\$7.630',
      'fr': '7 630 \$',
      'ja': '\$7,630',
      'zh_Hans': '\$7,630',
    },
    'dasfz3nr': {
      'en': '**** 0149',
      'de': '**** 0149',
      'fr': '**** 0149',
      'ja': '**** 0149',
      'zh_Hans': '**** 0149',
    },
    'zdy0xzhd': {
      'en': '05/25',
      'de': '25.05',
      'fr': '25/05',
      'ja': '05/25',
      'zh_Hans': '05/25',
    },
    'o0491zf3': {
      'en': 'Spending',
      'de': 'Ausgaben',
      'fr': 'Dépenses',
      'ja': '支出',
      'zh_Hans': '开支',
    },
    'l7olqxp3': {
      'en': 'Tab View 2',
      'de': 'Registerkartenansicht 2',
      'fr': 'Onglet Affichage 2',
      'ja': 'タブ ビュー 2',
      'zh_Hans': '选项卡视图 2',
    },
    'v68aozff': {
      'en': 'Balance',
      'de': 'Balance',
      'fr': 'Solde',
      'ja': 'バランス',
      'zh_Hans': '平衡',
    },
    'thih5h3p': {
      'en': 'Avg. Spend',
      'de': 'Durchschn. Ausgeben',
      'fr': 'Moy. Passer',
      'ja': '平均払う',
      'zh_Hans': '平均。花费',
    },
    't4di97cf': {
      'en': '\$25,205',
      'de': '25.205 \$',
      'fr': '25 205 \$',
      'ja': '\$25,205',
      'zh_Hans': '25,205 美元',
    },
    'gk4ap4gt': {
      'en': 'Timeline',
      'de': 'Zeitleiste',
      'fr': 'Chronologie',
      'ja': 'タイムライン',
      'zh_Hans': '时间线',
    },
    '2msyutna': {
      'en': 'Spend',
      'de': 'Ausgeben',
      'fr': 'Passer',
      'ja': '払う',
      'zh_Hans': '花费',
    },
    'pmfnbk4l': {
      'en': 'Timeline',
      'de': 'Zeitleiste',
      'fr': 'Chronologie',
      'ja': 'タイムライン',
      'zh_Hans': '时间线',
    },
    'zzw80byt': {
      'en': 'Spend',
      'de': 'Ausgeben',
      'fr': 'Passer',
      'ja': '払う',
      'zh_Hans': '花费',
    },
    '51d9zxo7': {
      'en': 'Recent Transactions',
      'de': 'kürzliche Transaktionen',
      'fr': 'transactions récentes',
      'ja': '最近の取引',
      'zh_Hans': '最近的交易',
    },
    'qqt7nhgo': {
      'en': 'A list of all your transactions this week.',
      'de': 'Eine Liste all Ihrer Transaktionen in dieser Woche.',
      'fr': 'Une liste de toutes vos transactions cette semaine.',
      'ja': '今週のすべての取引のリスト。',
      'zh_Hans': '本周所有交易的清单。',
    },
    'zget5n63': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    '1p9sfg9v': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    'aznzw4f3': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    '4ez6kftz': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    'uht4kun8': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    'z30jzbsw': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    '7ztbb7zd': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    '5k3maxgv': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    'hilwrd84': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    '8wa8dc97': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    'hlkotqx2': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    '5wkzee24': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    '31lfef1e': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    'qcmezt7g': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    'o2zwpyto': {
      'en': 'Insurance',
      'de': 'Versicherung',
      'fr': 'Assurance',
      'ja': '保険',
      'zh_Hans': '保险',
    },
    '4f0sx62l': {
      'en': 'Property Coverage',
      'de': 'Eigentumsabdeckung',
      'fr': 'Couverture des biens',
      'ja': 'プロパティカバレッジ',
      'zh_Hans': '财产保险',
    },
    'pdo5ovag': {
      'en': 'Home',
      'de': 'Zuhause',
      'fr': 'Domicile',
      'ja': '家',
      'zh_Hans': '家',
    },
  },
  // Language
  {
    'cepltokh': {
      'en': 'Hello World',
      'de': 'Hallo Welt',
      'fr': 'Bonjour le monde',
      'ja': 'こんにちは世界',
      'zh_Hans': '你好世界',
    },
    '1ujk81ko': {
      'en': 'English',
      'de': 'Englisch',
      'fr': 'Anglais',
      'ja': '英語',
      'zh_Hans': '英语',
    },
    'qhhqh5l4': {
      'en': 'chinese',
      'de': 'Chinesisch',
      'fr': 'chinois',
      'ja': '中文',
      'zh_Hans': '中文',
    },
    'pa61qrgm': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // profile
  {
    '1juqbkug': {
      'en': 'Your Profile',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '0l24w0fe': {
      'en': 'Below are your settings',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'o023h5n6': {
      'en': 'Edit Profile',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'z0onjgob': {
      'en': 'Account',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'o2u87fma': {
      'en': 'Switch to Dark Mode',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '39zo51wo': {
      'en': 'Switch to Light Mode',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'd58xskv5': {
      'en': 'Country',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'iybdhbjh': {
      'en': 'Edit Profile',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    '7k81dngw': {
      'en': 'General',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'wx0qyk8c': {
      'en': 'Support',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'r0ucejq0': {
      'en': 'Terms of Service',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'zzevf95m': {
      'en': 'Invite Friends',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
    'ww49jgbl': {
      'en': 'Home',
      'de': '',
      'fr': '',
      'ja': '',
      'zh_Hans': '',
    },
  },
  // mainWebNav
  {
    '21i2vb5f': {
      'en': 'DigitalFactory',
      'de': 'Platin',
      'fr': 'Platine',
      'ja': '白金',
      'zh_Hans': '铂',
    },
    'vc28a6wh': {
      'en': 'MENU',
      'de': 'SPEISEKARTE',
      'fr': 'MENU',
      'ja': 'メニュー',
      'zh_Hans': '菜单',
    },
    'sgj7ppzr': {
      'en': 'Home',
      'de': 'Zuhause',
      'fr': 'Domicile',
      'ja': '家',
      'zh_Hans': '家',
    },
    '6h03nko5': {
      'en': 'Devices',
      'de': 'Projekte',
      'fr': 'Projets',
      'ja': 'プロジェクト',
      'zh_Hans': '项目',
    },
    'sw33tlrx': {
      'en': 'ORGANIZATION',
      'de': 'ORGANISATION',
      'fr': 'ORGANISME',
      'ja': '組織',
      'zh_Hans': '组织',
    },
    'rn0xcho7': {
      'en': 'Profile',
      'de': 'Einstellungen',
      'fr': 'Réglages',
      'ja': '設定',
      'zh_Hans': '设置',
    },
    '76f2nva8': {
      'en': 'Help Center',
      'de': 'Hilfezentrum',
      'fr': 'Centre d\'aide',
      'ja': 'ヘルプセンター',
      'zh_Hans': '帮助中心',
    },
    'jn3sy1cs': {
      'en': 'Having trouble with Platinum? Contact us below.',
      'de': 'Haben Sie Probleme mit Platinum? Kontaktieren Sie uns unten.',
      'fr': 'Un problème avec Platinum ? Contactez-nous ci-dessous.',
      'ja': 'プラチナでお困りですか？下記までお問い合わせください。',
      'zh_Hans': '铂金有问题吗？请在下方联系我们。',
    },
    'pvwevd9h': {
      'en': 'Go To Help Center',
      'de': 'Gehen Sie zum Hilfecenter',
      'fr': 'Aller au centre d\'aide',
      'ja': 'ヘルプセンターに移動',
      'zh_Hans': '前往帮助中心',
    },
  },
  // mobileNav
  {
    'e3ap1bhd': {
      'en': 'Home',
      'de': 'ZUHAUSE',
      'fr': 'DOMICILE',
      'ja': '家',
      'zh_Hans': '家',
    },
    'zu0rlxg9': {
      'en': 'Devices',
      'de': 'GERÄT',
      'fr': 'APPAREIL',
      'ja': 'デバイス',
      'zh_Hans': '设备',
    },
    'anet0juh': {
      'en': 'Profile',
      'de': 'GERÄT',
      'fr': 'APPAREIL',
      'ja': 'デバイス',
      'zh_Hans': '设备',
    },
  },
  // messageBottomSheet
  {
    'ktdkqgbm': {
      'en': 'Your Messages',
      'de': 'Deine Nachrichten',
      'fr': 'Tes messages',
      'ja': 'あなたのメッセージ',
      'zh_Hans': '您的讯息',
    },
    '2il0e6ew': {
      'en': 'Below are your new messages',
      'de': 'Unten sind Ihre neuen Nachrichten',
      'fr': 'Ci-dessous vos nouveaux messages',
      'ja': '以下はあなたの新しいメッセージです',
      'zh_Hans': '以下是您的新消息',
    },
    'hlk121nf': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    '23b20gjc': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'xacpnb09': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'modh842x': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    '1j0k11dd': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    'c3e4q9x4': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'l62ds5ok': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    'pqs5d09o': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
    'qidychpf': {
      'en': 'Username here',
      'de': 'Benutzername hier',
      'fr': 'Nom d\'utilisateur ici',
      'ja': 'ユーザー名はこちら',
      'zh_Hans': '用户名在这里',
    },
    '1ijny0po': {
      'en': 'okay wow, you could definitely catch meat the restaurant in Ibiza',
      'de':
          'Okay, wow, Fleisch kann man definitiv im Restaurant auf Ibiza fangen',
      'fr':
          'ok wow, vous pourriez certainement attraper de la viande au restaurant à Ibiza',
      'ja': 'わかりました、イビサ島のレストランで間違いなく肉を釣ることができました',
      'zh_Hans': '好的哇，你绝对可以在伊维萨岛的餐厅吃肉',
    },
    'c5x0vktf': {
      'en': 'Posted',
      'de': 'Gesendet',
      'fr': 'Posté',
      'ja': '投稿しました',
      'zh_Hans': '发表',
    },
    '686d70vz': {
      'en': 'A few moments ago',
      'de': 'Vor ein paar Augenblicken',
      'fr': 'Il y a quelques instants',
      'ja': '少し前',
      'zh_Hans': '几分钟前',
    },
  },
  // altNav
  {
    'h834rd3x': {
      'en': 'MENU',
      'de': 'SPEISEKARTE',
      'fr': 'MENU',
      'ja': 'メニュー',
      'zh_Hans': '菜单',
    },
    'i0qrdyp0': {
      'en': 'DigitalFacotry',
      'de': 'Platin',
      'fr': 'Platine',
      'ja': '白金',
      'zh_Hans': '铂',
    },
    'mg2878en': {
      'en': 'MENU',
      'de': 'SPEISEKARTE',
      'fr': 'MENU',
      'ja': 'メニュー',
      'zh_Hans': '菜单',
    },
    'fwr96f9a': {
      'en': 'Home',
      'de': 'Zuhause',
      'fr': 'Domicile',
      'ja': '家',
      'zh_Hans': '家',
    },
    'b86hxizm': {
      'en': 'Devices',
      'de': 'Projekte',
      'fr': 'Projets',
      'ja': 'プロジェクト',
      'zh_Hans': '项目',
    },
    '55h9ooma': {
      'en': 'ORGANIZATION',
      'de': 'ORGANISATION',
      'fr': 'ORGANISME',
      'ja': '組織',
      'zh_Hans': '组织',
    },
    'vi5wq5d3': {
      'en': 'Profile',
      'de': 'Abrechnung',
      'fr': 'Facturation',
      'ja': '請求する',
      'zh_Hans': '计费',
    },
  },
  // altNav_2
  {
    'bpjevkz3': {
      'en': 'MENU',
      'de': 'SPEISEKARTE',
      'fr': 'MENU',
      'ja': 'メニュー',
      'zh_Hans': '菜单',
    },
  },
  // Miscellaneous
  {
    'npbs0pmg': {
      'en': 'Need allow access your contacts',
      'de': 'Sie müssen den Zugriff auf Ihre Kontakte zulassen',
      'fr': 'Besoin d\'autoriser l\'accès à vos contacts',
      'ja': '連絡先へのアクセスを許可する必要があります',
      'zh_Hans': '需要允许访问您的联系人',
    },
    'efnuksla': {
      'en': 'Need allow access your camera',
      'de': 'Sie müssen den Zugriff auf Ihre Kamera zulassen',
      'fr': 'Besoin d\'autoriser l\'accès à votre caméra',
      'ja': 'カメラへのアクセスを許可する必要があります',
      'zh_Hans': '需要允许访问您的相机',
    },
    'mzj4qkwt': {
      'en': 'Need allow receive notifications',
      'de': 'Sie müssen Benachrichtigungen zulassen',
      'fr': 'Besoin d\'autoriser la réception de notifications',
      'ja': '通知の受信を許可する必要があります',
      'zh_Hans': '需要允许接收通知',
    },
  },
].reduce((a, b) => a..addAll(b));
