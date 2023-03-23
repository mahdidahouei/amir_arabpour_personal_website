part of 'app_localizations.dart';

class AppLocalizationsImpl implements AppLocalizations {
  final Locale _locale;

  AppLocalizationsImpl(this._locale);

  Map<String, String>? _localizedStrings;
  late Completer<Map<String, String>> _richStringsCompleter;
  late Completer<String> _termsAndConditionsCompleter;
  late Completer<String> _privacyPolicyCompleter;

  @override
  Future<void> load() async {
    _richStringsCompleter = Completer<Map<String, String>>();
    _termsAndConditionsCompleter = Completer<String>();
    _privacyPolicyCompleter = Completer<String>();

    String jsonString =
        await rootBundle.loadString('assets/lang/${_locale.languageCode}.json');

    _localizedStrings = json.decode(jsonString).cast<String, String>();

    _loadRichStrings();
    _loadPrivacyPolicy();
    _loadTermsAndConditions();
  }

  void _loadRichStrings() async {
    String jsonString = await rootBundle
        .loadString('assets/lang/${_locale.languageCode}_rich_texts.json');
    final richTexts = json.decode(jsonString).cast<String, String>();
    _richStringsCompleter.complete(richTexts);
  }

  void _loadTermsAndConditions() async {
    String mdString = await rootBundle.loadString(
        'assets/lang/${_locale.languageCode}_terms_and_conditions.md');
    _termsAndConditionsCompleter.complete(mdString);
  }

  void _loadPrivacyPolicy() async {
    String mdString = await rootBundle
        .loadString('assets/lang/${_locale.languageCode}_privacy_policy.md');
    _privacyPolicyCompleter.complete(mdString);
  }

  @override
  Locale get locale => _locale;

  @override
  String translate(String key) {
    return _localizedStrings?[key] ?? "NA";
  }

  @override
  String formatNumber(int number, [bool treeDigitsDivision = true]) {
    if (treeDigitsDivision) {
      return NumberFormat.simpleCurrency(
              locale: _locale.languageCode, decimalDigits: 0, name: "")
          .format(number);
    }
    return NumberFormat("", _locale.languageCode).format(number);
  }

  @override
  Future<Map<String, String>> get richStringsFuture =>
      _richStringsCompleter.future;

  @override
  Future<String> get privacyPolicyFuture => _privacyPolicyCompleter.future;

  @override
  Future<String> get termsAndConditionsFuture =>
      _termsAndConditionsCompleter.future;
}
