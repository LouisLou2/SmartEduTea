class Tuple2<S,T>{
  final S _item1;
  final T _item2;
  Tuple2(this._item1, this._item2);
  S get item1 => _item1;
  T get item2 => _item2;

  @override
  String toString() {
    return 'Tuple2{first: $_item1, second: $_item2}';
  }
}