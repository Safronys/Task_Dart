int chooseBestDistance(int t, int k, List<int> ls) {
  if(ls.length >= k) {
    List<int> distances = chooseDistances(k, ls);
    distances.sort();
    for(int i = distances.length-1; i >=0; i--){
      if(distances[i]<=t) return distances[i];
    }
  }
  return -1;
}

List<int> chooseDistances(k, List<int> ls) {
  List<int> list = [];
  List<int> distances = [];
  var sum = 0;

  for (int i = 0; i < k; i++) {
    list.add(i);
    sum = sum + ls[list[i]];
  }

  list.add(ls.length);
  list.add(0);
  distances.add(sum);

  while (true) {
    var j = 0;
    while (list[j] + 1 == list[j + 1]) {
      list[j] = j;
      j = j + 1;
    }
    if (j < k) {
      list[j] = list[j] + 1;
      sum = 0;
      for (int i = 0; i < k; i++) sum = sum + ls[list[i]];
      distances.add(sum);
    } else
      break;
  }
  return distances;
}

void main() {
  print(chooseBestDistance(174, 3, [51, 56, 58, 59, 61])); //173
  print(chooseBestDistance(163, 3, [50])); // -1

}
