import 'package:flutter/foundation.dart';

/// Reports a wiredash error to [FlutterError.onError]
///
/// Set [debugOnly] to `true` for errors which should only be logged in debug
/// builds. Defaults to `false`.
void reportWiredashError(dynamic e, StackTrace /*?*/ stack, String message,
    {bool debugOnly = false}) {
  assert(e != null);
  assert(message != null);
  assert(debugOnly != null);
  final reporter = FlutterError.onError;
  if (reporter == null) return;
  final details = FlutterErrorDetails(
    exception: e,
    stack: stack,
    library: 'wiredash',
    silent: debugOnly,
    informationCollector: () => [
      DiagnosticsNode.message(message),
    ],
  );
  reporter.call(details);
}
