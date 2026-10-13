extension CookTimeExtension on int {
  String toCookTime() {
    final hours = this ~/ 60;
    final minutes = this % 60;
    if (hours == 0) return '${minutes}min';
    if (minutes == 0) return '${hours}h';
    return '${hours}h ${minutes}min';
  }
}

extension CompactCountExtension on int {
  String toCompactCount() {
    if (this < 1000) return '$this';
    if (this < 1000000) return _compact(1000, 'k');
    if (this < 1000000000) return _compact(1000000, 'M');
    return _compact(1000000000, 'B');
  }

  // Truncates instead of rounding so 999,950 reads "999k" rather than "1000.0k".
  String _compact(int unit, String suffix) {
    final whole = this ~/ unit;
    if (whole >= 100) return '$whole$suffix';
    final tenth = (this % unit) * 10 ~/ unit;
    return tenth == 0 ? '$whole$suffix' : '$whole.$tenth$suffix';
  }
}
