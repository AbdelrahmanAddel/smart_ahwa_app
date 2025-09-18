import 'drinks.dart';

class Coffee extends Drinks {


  @override
  String make() {
    return 'Making Coffee';
  }

  @override
  String get name => 'Coffee';

  @override
  double get price => 15;
}
