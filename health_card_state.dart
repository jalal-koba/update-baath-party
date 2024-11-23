part of 'health_card_bloc.dart';

@immutable
class HealthCardStates {}

class HealthCardInitial extends HealthCardStates {}

class HealthCardState extends HealthCardStates {
  final bool isLoading;

  HealthCardState({required this.isLoading});
}

class ErrorState extends HealthCardStates {
  final String message;

  ErrorState({required this.message});


}
