void main() {
  print(listFilesWithSubFolders(getChildren(2)).length);
}

final List<Directory> myDir = [
  Directory(id: 1, parentId: 0),
  Directory(id: 11, parentId: 1),


  Directory(id: 2, parentId: 0),
  Directory(id: 4, parentId: 2),
  Directory(id: 7, parentId: 4),
  Directory(id: 8, parentId: 4),
  Directory(id: 5, parentId: 2),
  Directory(id: 9, parentId: 5),
  Directory(id: 13, parentId: 9),
  Directory(id: 14, parentId: 9),


  Directory(id: 6, parentId: 2),
  Directory(id: 10, parentId: 6),

  Directory(id: 3, parentId: 0),
  Directory(id: 12, parentId: 3),

];

List<Directory> listFilesWithSubFolders (List<Directory> input){
  final List<Directory> returnList = [];
  input.forEach((element) {
    final listChildren = getChildren(element.id);
    if(listChildren.isEmpty){
      returnList.add(element);
    }else{
      returnList.add(element);
      returnList.addAll(listFilesWithSubFolders(listChildren));
    }
  });

  return returnList;
}

List<Directory> getChildren(int parentId) {
  return myDir.where((element) => element.parentId == parentId).toList();
}

class Directory {
  final int id;
  final int parentId;

  Directory({
    required this.id,
    required this.parentId,
  });

  @override
  String toString() => 'Directory(id: $id, parentId: $parentId)';
}
