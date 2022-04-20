import 'package:html/dom.dart';
import 'package:html/parser.dart';
export 'package:html/parser.dart' show HtmlParser;

extension HtmlSearch on Iterable<Element> {
  Iterable<Element> search(bool Function(Element) predicate) => [
        where(predicate),
        ...map((e) => e.children.search(predicate)),
      ].reduce((v, e) => [...v, ...e]);

  Element? searchFirst(bool Function(Element) predicate) {
    final e = search(predicate);
    return e.isEmpty ? null : e.first;
  }
}

List<Element> htmlParse(String raw) => HtmlParser(raw).parse().children;
