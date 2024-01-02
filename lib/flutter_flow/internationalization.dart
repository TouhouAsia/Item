import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'zh_Hant', 'ja'];

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
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? zh_HantText = '',
    String? jaText = '',
  }) =>
      [enText, zh_HansText, zh_HantText, jaText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
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
  // SettingPage
  {
    'e7rsy6yw': {
      'en': 'Setting',
      'ja': '設定',
      'zh_Hans': '设置',
      'zh_Hant': '設定',
    },
    'alra7fge': {
      'en': 'Settng',
      'ja': '設定',
      'zh_Hans': '设置',
      'zh_Hant': '設定',
    },
  },
  // HomePage
  {
    'xo8r5mvf': {
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '主页',
      'zh_Hant': '首頁',
    },
    'v6hmkhl1': {
      'en': 'Search all items...',
      'ja': 'すべて品物を検索する...',
      'zh_Hans': '搜索所有项目...',
      'zh_Hant': '搜尋所有項目...',
    },
    'ar8klsik': {
      'en': '2023',
      'ja': '2023年',
      'zh_Hans': '2023年',
      'zh_Hant': '2023年',
    },
    'xx393j78': {
      'en': '2022',
      'ja': '2022年',
      'zh_Hans': '2022年',
      'zh_Hant': '2022年',
    },
    'a9kfn9u3': {
      'en': '2021',
      'ja': '2021年',
      'zh_Hans': '2021年',
      'zh_Hant': '2021年',
    },
    '6af8osif': {
      'en': '2020',
      'ja': '2020年',
      'zh_Hans': '2020年',
      'zh_Hant': '2020年',
    },
    'gvf7ej1t': {
      'en': '2019',
      'ja': '2019年',
      'zh_Hans': '2019年',
      'zh_Hant': '2019年',
    },
    'dx4oee29': {
      'en': '2018',
      'ja': '2018年',
      'zh_Hans': '2018年',
      'zh_Hant': '2018年',
    },
    'g8kgt2wo': {
      'en': '2023',
      'ja': '2023年',
      'zh_Hans': '2023年',
      'zh_Hant': '2023年',
    },
    'nagky2ee': {
      'en': 'Home',
      'ja': 'ホーム',
      'zh_Hans': '主页',
      'zh_Hant': '首頁',
    },
  },
  // UploadPage
  {
    'sh6fjc49': {
      'en': 'Upload',
      'ja': 'アップロード',
      'zh_Hans': '上传',
      'zh_Hant': '上傳',
    },
    'etie5zss': {
      'en': 'Create Usage Report',
      'ja': '利用レポート作成する',
      'zh_Hans': '创建使用报告',
      'zh_Hant': '建立使用報告',
    },
    'lvef7veg': {
      'en': 'Fill out the form below to submit.',
      'ja': '以下のフォームにご記入の上、送信してください。',
      'zh_Hans': '填写下面的表单并提交。',
      'zh_Hant': '填寫下面的表單並提交。',
    },
    '1b80i1s2': {
      'en': 'Name...',
      'ja': 'ネーム',
      'zh_Hans': '名字...',
      'zh_Hant': '名字...',
    },
    '6e4asao7': {
      'en': 'Short Description of how well it was used...',
      'ja': 'どのように使用されたかを簡単に説明すると...',
      'zh_Hans': '简短描述它的使用情况...',
      'zh_Hant': '簡短描述它的使用情況...',
    },
    'aasoc1sv': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6f72xx8p': {
      'en': 'Upload Photo',
      'ja': '写真をアップロードする',
      'zh_Hans': '上传图片',
      'zh_Hant': '上傳圖片',
    },
    'dufxg8h9': {
      'en': 'Upload Date',
      'ja': 'アップロード日時',
      'zh_Hans': '上传日期',
      'zh_Hant': '上傳日期',
    },
    'ov2lky4h': {
      'en': 'Submit',
      'ja': '投稿する',
      'zh_Hans': '提交',
      'zh_Hant': '提交',
    },
    'mx9jp0ta': {
      'en': 'Upload',
      'ja': 'アップロード',
      'zh_Hans': '上传',
      'zh_Hant': '上傳',
    },
  },
  // ArchivePage
  {
    'zz3s5ksy': {
      'en': 'Archive',
      'ja': 'アーカイブ',
      'zh_Hans': '归档',
      'zh_Hant': '歸檔',
    },
    'a2v17m5p': {
      'en': 'Archive',
      'ja': 'アーカイブ',
      'zh_Hans': '归档',
      'zh_Hant': '歸檔',
    },
  },
  // PermissionPage
  {
    'mlh0ts9q': {
      'en': 'Permission',
      'ja': '許可',
      'zh_Hans': '权限',
      'zh_Hant': '權限',
    },
    '4gb90rkg': {
      'en': 'Camera Permission',
      'ja': 'カメラ使用許可',
      'zh_Hans': '相机权限',
      'zh_Hant': '相機權限',
    },
    'allzptru': {
      'en': 'Photos Permission',
      'ja': '写真使用許可',
      'zh_Hans': '照片权限',
      'zh_Hant': '照片權限',
    },
    '7k1fk1z8': {
      'en': 'Proceed to Home',
      'ja': 'ホームへ',
      'zh_Hans': '前往首页',
      'zh_Hant': '前往首頁',
    },
    '9rmprr7y': {
      'en': 'Permission',
      'ja': '許可',
      'zh_Hans': '权限',
      'zh_Hant': '權限',
    },
  },
  // ArchiveCard
  {
    '16bc16sh': {
      'en': 'Read Now',
      'ja': '今すぐ読む',
      'zh_Hans': '现在读',
      'zh_Hant': '現在讀',
    },
  },
  // DarkLightSwitch
  {
    'l6lvqlq2': {
      'en': 'Light Mode',
      'ja': 'ライトモード',
      'zh_Hans': '浅色模式',
      'zh_Hant': '淺色模式',
    },
    'cuvynq8q': {
      'en': 'Dark Mode',
      'ja': 'ダークモード',
      'zh_Hans': '深色模式',
      'zh_Hant': '深色模式',
    },
  },
  // Miscellaneous
  {
    '9pmi8eh7': {
      'en': 'Request access to the camera',
      'ja': 'カメラへのアクセスをリクエストする',
      'zh_Hans': '请求访问相机',
      'zh_Hant': '請求訪問相機',
    },
    'acn6ap1q': {
      'en': 'Request access to albums',
      'ja': 'アルバムへのアクセスをリクエストする',
      'zh_Hans': '请求访问相册',
      'zh_Hant': '請求訪問相冊',
    },
    'd7y18xy4': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ghsp2jd1': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'mo35jnf7': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xr0om3ql': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5sq48osl': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qja7460h': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i9p49lhz': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jqs0scar': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '04ffl31d': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '4j9k9bn9': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5o644e0x': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'g9wscny1': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xngv7je3': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3y3tygez': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'y5vb29mk': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jctc9oas': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ywgfzs9u': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9nrtfjd8': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6tl3k47p': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'etvusfun': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qh81x2xg': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gadk4tmz': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '231zp6sc': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tvvbnt0u': {
      'en': '',
      'ja': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
