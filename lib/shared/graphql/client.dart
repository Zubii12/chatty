import 'package:graphql/src/core/_base_options.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String graphqlHttpsEndpoint = 'https://chatty.hasura.app/v1/graphql';

class GQClient {
  const GQClient();

  Future<GraphQLClient> get _getInstance async {
    final HttpLink httpLink = HttpLink(graphqlHttpsEndpoint, defaultHeaders: <String, String>{
      'x-hasura-admin-secret': 'wyoJZASOipMNrKbq1ATovZKOrdbwBBcm1P8k5HBMRSIifaxPGU2eJIScJzjOP0A6',
    });

    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(),
      defaultPolicies: DefaultPolicies(
        mutate: Policies.safe(
          FetchPolicy.noCache,
          ErrorPolicy.all,
          CacheRereadPolicy.mergeOptimistic,
        ),
        query: Policies.safe(
          FetchPolicy.noCache,
          ErrorPolicy.all,
          CacheRereadPolicy.mergeOptimistic,
        ),
        subscribe: Policies.safe(
          FetchPolicy.noCache,
          ErrorPolicy.ignore,
          CacheRereadPolicy.mergeOptimistic,
        ),
        watchQuery: Policies.safe(
          FetchPolicy.noCache,
          ErrorPolicy.all,
          CacheRereadPolicy.mergeOptimistic,
        ),
      ),
    );
  }

  Future<QueryResult> runOperation({required BaseOptions options}) async {
    final GraphQLClient client = await _getInstance;
    QueryResult? result;

    if (options is QueryOptions) {
      result = await client.query(options);
    }
    if (options is MutationOptions) {
      result = await client.mutate(options);
    }
    if (result!.hasException) {
      throw result.exception!;
    }
    return result;
  }
}
