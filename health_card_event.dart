part of 'health_card_bloc.dart';

@immutable
class HealthCardEvent {
  final String fullName;
  final String age;
  final String provinceId;
  final String cityOrCenter;
  final String village;
  final String phoneNumber;
  const HealthCardEvent({
    required this.fullName,
    required this.age,
    required this.provinceId,
    required this.cityOrCenter,
    required this.village,
    required this.phoneNumber,
  });
}

