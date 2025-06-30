class BPM {
  const BPM._(this._value);

  final int _value;

  factory BPM.create(int value) {
    if (value < 30 || value > 300) {
      throw ArgumentError('BPM must be between 30 and 300');
    }
    return BPM._(value);
  }

  int get value => _value;

  BPM increment() => BPM.create((_value + 1).clamp(30, 300));
  BPM decrement() => BPM.create((_value - 1).clamp(30, 300));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BPM &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => 'BPM($_value)';
}
