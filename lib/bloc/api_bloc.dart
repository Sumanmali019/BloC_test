import 'package:assigment/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Cubit<ApiState> {
  final ApiService _apiService = ApiService();

  ApiBloc() : super(ApiInitial());

  Future<void> fetchData() async {
    try {
      final data = await _apiService.fetchApiData();
      emit(ApiLoaded(data));
    } catch (error) {
      emit(ApiError(error.toString()));
    }
  }
}

abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoaded extends ApiState {
  final Map<String, dynamic> data;

  ApiLoaded(this.data);
}

class ApiError extends ApiState {
  final String message;

  ApiError(this.message);
}