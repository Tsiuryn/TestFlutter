void main(){
  print(myMap['111']); // null
  print(myMap['125']); // Good
  var mindMap = <String, String>{};
  mindMap['111'] = 'Yes';
  print(mindMap.containsKey('111'));

  mindMap.remove('111');
  print(mindMap);

}

const myMap = {'123': 'Hello','124': 'Bue','125': 'Good','126': 'Bad',};