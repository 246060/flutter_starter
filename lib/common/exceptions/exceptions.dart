abstract class BaseException implements Exception {
  BaseException({this.message, this.origin});

  final String? message;
  final Exception? origin;

  @override
  String toString() => '''
      Message: $message 
      Exception: ${origin?.toString()}
      ''';
}

class ResourceNotFoundException extends BaseException {
  ResourceNotFoundException({dynamic target, super.origin})
      : super(message: 'resource[$target] not found');
}



