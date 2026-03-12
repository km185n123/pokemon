import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/profile/data/repositories/profile_repository_impl.dart';

class ProfileState extends Equatable {
  final bool isOfflineDbEnabled;
  final bool isLoading;

  const ProfileState({
    required this.isOfflineDbEnabled,
    this.isLoading = false,
  });

  ProfileState copyWith({bool? isOfflineDbEnabled, bool? isLoading}) {
    return ProfileState(
      isOfflineDbEnabled: isOfflineDbEnabled ?? this.isOfflineDbEnabled,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isOfflineDbEnabled, isLoading];
}

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository)
    : super(const ProfileState(isOfflineDbEnabled: true, isLoading: true));

  Future<void> init() async {
    final isEnabled = await repository.getOfflineDbEnabled();

    emit(state.copyWith(isOfflineDbEnabled: isEnabled, isLoading: false));
  }

  Future<void> toggleOfflineDb(bool value) async {
    emit(state.copyWith(isOfflineDbEnabled: value));

    await repository.setOfflineDbEnabled(value);
  }
}
