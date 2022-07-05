void main() {
  // print(fiboEffective(6)) ;
  // print(fiboNaiv(50));
  print(fiboNaivEff(8));
}

// наивный, медленный, очевидный (не больше 40)
int fiboNaiv(int n) {
  if (n <= 1) {
    return n;
  }
  return fiboNaiv(n - 1) + fiboNaiv(n - 2);
}

// эффективный способ
int fiboEffective(int n) {
  List<int> arr = []
    ..add(0)
    ..add(1);
  for (int i = 2; i <= n; i++) {
    arr.add(arr[i - 1] + arr[i - 2]);
  }
  return arr[n];
}

// мемоизация

int fiboNaivEff(int n) {
  if (mem.containsKey(n)) {
    var res = mem[n];
    return res!;
  }

  if (n <= 1) return n;
  var result = fiboNaiv(n - 1) + fiboNaiv(n - 2);
  mem[n] = result;
  return result;
}

Map<int, int> mem = {};
