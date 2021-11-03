import 'package:clean_architecture_poc/core/error/failure.dart';
import 'package:clean_architecture_poc/core/usecases/usecase.dart';
import 'package:clean_architecture_poc/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_poc/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia,Params> {
  final NumberTriviaRepository? repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository!.getConcreteNumberTrivia(params.number);
  }
}
class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}