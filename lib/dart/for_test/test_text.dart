import 'dart:convert';

void main(){
  // print(changeText(text));
  var dksjfl = text1.replaceAll('\\', '');
  Map <String, dynamic>  myMap = json.decode(dksjfl);
  print(myMap);
}

String changeText (String text){
  String tes = text.toLowerCase();
  var newText = '';
  for(int i = 0; i < tes.length; i++){
    if(i != 0 && tes[i-1] == '_'){
      var str = tes[i].toUpperCase();
      newText += str;
    }else{
      newText += tes[i];
    }
  }
  newText = newText.replaceAll('_', '');
  return newText;
}

var text = '''  ATM,
  BRANCH,
  HEAD_OFFICE,
  KIOSK,
  POS_TERMINAL,''';

var text1 = '{\"action\":\"logout\",\"data\":{\"lockedObject\":\"userChannel\",\"message\":\"Access to {0} is temporary blocked. Please make payment to restore full access.\",\"reason\":\"dir.USER_CHANNEL_STATE_UPDATE_MESSAGE.i.ACCESS_TEMPORARY_BLOCKED_MAKE_PAYMENT\"}}';