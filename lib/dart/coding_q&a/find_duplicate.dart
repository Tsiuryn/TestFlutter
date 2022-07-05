class DupNumbers {
  static int findDuplicate(List<int> nums) {
    Set<int> seen = Set();
    for (int i = 0; i < nums.length; i++) {
      if (seen.contains(nums[i])) {
        print("Duplicate number is: ${nums[i]}");
      } else {
        seen.add(nums[i]);
      }
    }
    return -1;
  }
}

void main() {
  print(DupNumbers.findDuplicate([1, 2, 1, 3, 4, 4]));
}
