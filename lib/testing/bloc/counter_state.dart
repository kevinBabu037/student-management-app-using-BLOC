part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
final int count;

  CounterState({required this.count});
}

final class CounterInitial extends CounterState {
  CounterInitial({required super.count});
  
}

final class IncrementCountState extends CounterState{
  final int count;

  IncrementCountState({required this.count}) : super(count: 0);
}
