import 'package:html/dom.dart';
import 'package:html/parser.dart';

Element? searchFirst(
  Iterable<Element> root,
  bool Function(Element) predicate,
) {
  final e = search(root, predicate);
  if (e.isEmpty) return null;
  return e.first;
}

Iterable<Element> search(
  Iterable<Element> root,
  bool Function(Element) predicate,
) =>
    [
      [root.where(predicate)],
      root.map((e) => search(e.children, predicate))
    ].reduce((v, e) => [...v, ...e]).reduce((v, e) => [...v, ...e]);

List<Element> parse(String raw) => HtmlParser(raw).parse().children;
