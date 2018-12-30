library petitparser.core.parsers.epsilon;

import 'package:petitparser/src/core/contexts/context.dart';
import 'package:petitparser/src/core/contexts/result.dart';
import 'package:petitparser/src/core/parser.dart';

/// Returns a parser that consumes nothing and succeeds.
///
/// For example, `char('a').or(epsilon())` is equivalent to
/// `char('a').optional()`.
Parser<T> epsilon<T>([T result]) => EpsilonParser<T>(result);

/// A parser that consumes nothing and succeeds.
class EpsilonParser<T> extends Parser<T> {
  final T result;

  EpsilonParser(this.result);

  @override
  Result<T> parseOn(Context context) => context.success(result);

  @override
  EpsilonParser<T> copy() => EpsilonParser<T>(result);

  @override
  bool hasEqualProperties(EpsilonParser<T> other) =>
      super.hasEqualProperties(other) && result == other.result;
}
