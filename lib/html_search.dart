import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

dom.Element htmlSearchByPredicate(
  List<dom.Element> rootNode,
  bool Function(dom.Element) predicate,
) {
  for (final e in rootNode) {
    if (predicate(e)) {
      return e;
    }
    final found = htmlSearchByPredicate(e.children, predicate);
    if (found != null) {
      return found;
    }
  }
  return null;
}

dom.Element htmlSearchByClass(List<dom.Element> rootNode, String className) =>
    htmlSearchByPredicate(rootNode, (e) => e.className.contains(className));

List<dom.Element> htmlSearchAllByPredicate(
  List<dom.Element> rootNode,
  bool Function(dom.Element) predicate,
) {
  final found = <dom.Element>[];
  for (final e in rootNode) {
    if (predicate(e)) {
      found.add(e);
    }
    found.addAll(htmlSearchAllByPredicate(e.children, predicate));
  }
  return found;
}

List<dom.Element> htmlParse(String raw) => HtmlParser(raw).parse().children;
