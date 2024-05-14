part of 'ions.dart';

class TypeTitle {
  static TextStyle xs = _base.copyWith(fontSize: 14, height: 18 / 14);
  static TextStyle s = _base.copyWith(fontSize: 16, height: 20 / 16);
  static TextStyle m = _base.copyWith(fontSize: 18, height: 22 / 18);
  static TextStyle l = _base.copyWith(fontSize: 20, height: 24 / 20);

  static TextStyle get _base => const TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );
}

class TypeBody {
  static TextStyle xs = _base.copyWith(fontSize: 12, height: 16 / 12);
  static TextStyle s = _base.copyWith(
    fontSize: 14,
    height: 22 / 14,
  );
  static TextStyle s1 = _base.copyWith(
    fontSize: 14,
    height: 22 / 14,
  );
  static TextStyle m = _base.copyWith(
    fontSize: 16,
    height: 24 / 16,
  );
  static TextStyle l = _base.copyWith(
    fontSize: 18,
    height: 28 / 18,
  );
  static TextStyle b1 = _base.copyWith(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get _base => const TextStyle(
        fontFamily: 'packages/ui/VisbyRegular',
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );
}