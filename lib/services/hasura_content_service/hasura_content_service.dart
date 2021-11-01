import 'package:chatty/services/content_service.dart';
import 'package:chatty/shared/graphql/client.dart';

class HasuraContentService extends ContentService {
  const HasuraContentService({required GQClient client}) : _client = client;

  final GQClient _client;
}
