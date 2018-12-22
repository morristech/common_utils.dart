import 'map_utils.dart';

T first<T>(Iterable<T> list) => listFirst(list);

T listFirst<T>(Iterable<T> list) {
  return listIsEmpty(list) ? null : list.first;
}

T listLast<T>(Iterable<T> list) {
  return listIsEmpty(list) ? null : list.last;
}

int listLength(Iterable list) {
  return list?.length ?? 0;
}

@Deprecated("use listIsEmpty")
bool isEmpty(Iterable list) => listIsEmpty(list);

bool listIsEmpty(Iterable list) => listLength(list) == 0;

@Deprecated("use listTruncate")
List<T> truncate<T>(List<T> list, int maxCount) => listTruncate(list, maxCount);

int _listSafeStartOrEnd(List list, int index) {
  if (index < 0) {
    return 0;
  } else if (index > list.length) {
    return list.length;
  }
  return index;
}

// Safe sub list sub list
List<T> listSubList<T>(List<T> list, int start, [int end]) {
  if (listIsEmpty(list)) {
    return list;
  }
  start = _listSafeStartOrEnd(list, start);
  if (end != null) {
    end = _listSafeStartOrEnd(list, end);
  }
  return list.sublist(start, end);
}

List<T> listTruncate<T>(List<T> list, int end) => listSubList(list, 0, end);

/// Clone list and list of list
List cloneList(List original) {
  if (original == null) {
    return null;
  }
  List clone = List();
  original.forEach((dynamic item) {
    if (item is List) {
      item = cloneList(item as List);
    } else if (item is Map) {
      item = cloneMap(item as Map);
    }
    clone.add(item);
  });
  return clone;
}

/// better to have original1 bigger than original2
/// optimization could handle that
List intersectList(List original1, List original2) {
  List list = List();

  original1.forEach((element) {
    if (original2.contains(element)) {
      list.add(element);
    }
  });

  return list;
}
