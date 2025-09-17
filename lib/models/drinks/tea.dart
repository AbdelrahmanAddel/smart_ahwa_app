import 'drinks.dart';

class Tea extends Drinks {
  @override
  String make() {
    return 'Making Tea';
  }

  @override
  String get name => 'Tea';

  @override
  double get price => 7.5;
}
