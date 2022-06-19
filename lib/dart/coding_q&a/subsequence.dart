class Subsequence {
  static Set<String> al = Set();

  static void findSubsequences(String s, String ans) {
    if (s.length == 0) {
      al.add(ans);
      return;
    }
    findSubsequences(s.substring(1), ans + s.substring(0, 1));
    findSubsequences(s.substring(1), ans);
  }
}

void main() {
  String s = "ertf";
  Subsequence.findSubsequences(s, "");
  print(Subsequence
      .al); // {ertf, ert, erf, er, etf, et, ef, e, rtf, rt, rf, r, tf, t, f, }
  Subsequence.al = Set();
  s = "abc";
  Subsequence.findSubsequences(s, "");
  print(Subsequence.al); // {abc, ab, ac, a, bc, b, c, }
}
