RegExp ibanPattern = RegExp(r'^[A-Z]{2}[0-9]{4}');
RegExp tinPattern = RegExp(r'^(9{5}|0{9}|0{10})|(\d{8}(?<!0{8})|\d{9}|\d{10})$');
RegExp namePattern = RegExp(r'^\S[^\x00-\x1F]{0,38}$');

void main(){
  // print(ibanPattern.hasMatch('AA12345'));
  // print(ibanPattern.stringMatch('AA12345'));
  // print(ibanPattern.allMatches('AA12345'));
  // print(ibanPattern.hasAllMatch('AB1235'));
  print(namePattern.hasAllMatch('1'));
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