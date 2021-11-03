import 'package:clean_architecture_poc/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}
  void main() {
    NetworkInfoImpl ?networkInfo;
    MockDataConnectionChecker? mockDataConnectionChecker;

    setUp(() {
      mockDataConnectionChecker = mockDataConnectionChecker!;
      networkInfo = NetworkInfoImpl(mockDataConnectionChecker!);
    });

    group('isConnected', (){
      test(
        'should forward the cal to DataConectionChecker.hasConnection',
          () async {
      //arrange
      final tHasConnectionFuture = Future.value(true);

      when(mockDataConnectionChecker!.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);
      //act
      final result = await networkInfo!.isConnected;
      //assert
            verify(mockDataConnectionChecker!.hasConnection);
            expect(result,true);
      },
      );
  });
}
