extension MyFunction on String {
  String reverse() {
    var reversedString = '';
    for (int i = this.length - 1; i >= 0; i--) {
      reversedString += this[i];
    }
    return reversedString;
  }
}
