import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:icr_project4/Apis/ExceptionsHandle.dart';
import 'package:icr_project4/Apis/Network.dart';
import 'package:icr_project4/Apis/Urls.dart';
import 'package:meta/meta.dart';

part 'health_card_event.dart';
part 'health_card_state.dart';

class HealthCardBloc extends Bloc<HealthCardEvent, HealthCardStates> {
  HealthCardBloc() : super(HealthCardInitial()) {
    on<HealthCardEvent>((event, emit) async {
      emit(HealthCardState(isLoading: true));

      try {
        await Network.postData(url: Urls.getHealthCard, data: {
          "full_name": event.fullName,
          "age": event.age,
          "province_id": event.provinceId,
          "village": event.village,
          "city_or_center": event.cityOrCenter,
          "phone_number": event.phoneNumber
        });

        emit(HealthCardState(isLoading: false));
      } catch (error) {
        emit(HealthCardState(isLoading: false));

        if (error is DioError) {
          emit(ErrorState(message: exceptionsHandle(error: error)));
        } else {
          emit(ErrorState(message: "error"));
        }
      }
    });
  }
}
