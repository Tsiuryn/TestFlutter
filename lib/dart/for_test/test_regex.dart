RegExp ibanPattern = RegExp(r'^[A-Z]{2}[0-9]{4}');

void main(){
  // print(ibanPattern.hasMatch('AA12345'));
  // print(ibanPattern.stringMatch('AA12345'));
  // print(ibanPattern.allMatches('AA12345'));
  print(ibanPattern.hasAllMatch('AB1235'));
}

extension RegExpExt on RegExp{
  bool hasAllMatch(String value){
    if(!hasMatch(value)) {
      return false;
    }
    var matchText = stringMatch(value);
    if(hasMatch(value) && value.length == matchText?.length){
      return true;
    }else{
      return false;
    }
  }
}