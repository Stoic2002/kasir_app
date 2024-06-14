part of '../app_router.dart';

enum RootTab {
  home('0'),
  income('1'),
  transcation('2'),
  history('3'),
  profile('4'),
  ;

  final String value;
  const RootTab(this.value);

  factory RootTab.fromIndex(int index) {
    return values.firstWhere(
      (value) => value.value == '$index',
      orElse: () => RootTab.home,
    );
  }
}
