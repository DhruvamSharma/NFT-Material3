import 'dart:isolate';

Future<String> startDownloadUsingOldIsolateMethod() async {
  const String imageDownloadLink = 'this is a link';
  // create the port to receive data from
  final resultPort = ReceivePort();
  // spawn a new isolate and pass down a function that will be used in a new isolate
  // and pass down the result port that will send back the result.
  // you can send any number of arguments.
  await Isolate.spawn(
    _readAndParseJson,
    [resultPort.sendPort, imageDownloadLink],
  );
  return await (resultPort.first) as String;
}

// we create a top-level function that specifically uses the args
// which contain the send port. This send port will actually be used to
// communicate the result back to the main isolate

// This function should have been isolate-agnostic
Future<void> _readAndParseJson(List<dynamic> args) async {
  SendPort resultPort = args[0];
  String fileLink = args[1];

  await Future.delayed(const Duration(seconds: 2));

  Isolate.exit(resultPort, fileLink);
}

// Error Handling

Future<String> startDownloadUsingOldIsolateMethodWithErrorHandling() async {
  const String imageDownloadLink = 'this is a link';
  // create the port to receive data from
  final resultPort = ReceivePort();
  // Adding errorsAreFatal makes sure that the main isolates receives a message
  // that something has gone wrong
  try {
    await Isolate.spawn(
      _readAndParseJson,
      [resultPort.sendPort, imageDownloadLink],
      errorsAreFatal: true,
      onExit: resultPort.sendPort,
      onError: resultPort.sendPort,
    );
  } on Object {
    // check if sending the entrypoint to the new isolate failed.
    // If it did, the result port won’t get any message, and needs to be closed
    resultPort.close();
  }

  final response = await resultPort.first;

  if (response == null) {
    // this means the isolate exited without sending any results
    // TODO throw error
    return 'No message';
  } else if (response is List) {
    // if the response is a list, this means an uncaught error occurred
    final errorAsString = response[0];
    final stackTraceAsString = response[1];
    // TODO throw error
    return 'Uncaught Error';
  } else {
    return response as String;
  }
}

// Isolates with run function
Future<String> startDownloadUsingRunMethod() async {
  final imageData = await Isolate.run(_readAndParseJsonWithoutIsolateLogic);
  return imageData;
}

Future<String> _readAndParseJsonWithoutIsolateLogic() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'this is downloaded data';
}
