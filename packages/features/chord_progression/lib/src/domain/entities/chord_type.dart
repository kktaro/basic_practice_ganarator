enum ChordType {
  major(''),
  minor('m'),
  dominant7('7'),
  major7('M7');

  const ChordType(this.symbol);

  final String symbol;
}
