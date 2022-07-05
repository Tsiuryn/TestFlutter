import 'package:uuid_type/uuid_type.dart';

final List<int> example = [1, 2, 3, 4, 5, 6];

const myId = 'ec949438-a1c0-4555-aacb-284a1e0c4df0';
const myId1 =
    'ec949438-a1c0-4555-aacb-284a1e0c4df1'; // // TODO: last symbol changed

void main() {
  var myUuid = Uuid.tryParse(myId);
  var myUuid1 = Uuid.tryParse(myId1);

  print(myUuid == myUuid1);
}
