import 'package:html/dom.dart';
import 'package:html/parser.dart';
export 'package:html/parser.dart' show HtmlParser;

extension HtmlSearch on Iterable<Element> {
  Iterable<Element> search(bool Function(Element) predicate) => [
    where(predicate),
    ...map((e) => e.children.search(predicate)),
  ].reduce((v, e) => [...v, ...e]);

  Element? searchFirst(bool Function(Element) predicate) =>
      search(predicate).firstOrNull;

  Element? searchLast(bool Function(Element) predicate) =>
      search(predicate).lastOrNull;
}

List<Element> htmlParse(String raw) => HtmlParser(raw).parse().children;
