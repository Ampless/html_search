# html\_search

A really small package for searching in HTML.

```dart
import 'package:html_search/html_search.dart';

void main() => htmlParse('<div><p>hi</p><p id="myparagraph">hi again</p></div>')
    .search((e) => e.id == 'myparagraph')
    .map((e) => e.outerHtml)
    .forEach(print);
```
