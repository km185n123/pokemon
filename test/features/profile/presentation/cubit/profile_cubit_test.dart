import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:pokemon/features/profile/presentation/cubit/profile_cubit.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late MockProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockProfileRepository();
  });

  group('ProfileCubit', () {
    /*blocTest<ProfileCubit, ProfileState>(
      'should load preferences on initialization',
      build: () {
        when(
          () => mockRepository.getOfflineDbEnabled(),
        ).thenAnswer((_) async => false);
        return ProfileCubit(mockRepository);
      },
      expect: () => [
        const ProfileState(isOfflineDbEnabled: true, isLoading: true),
        const ProfileState(isOfflineDbEnabled: false, isLoading: false),
      ],
      verify: (_) {
        verify(() => mockRepository.getOfflineDbEnabled()).called(1);
      },
    );*/

    /*blocTest<ProfileCubit, ProfileState>(
      'should emit new state and save to repository when toggleOfflineDb is called',
      build: () {
        when(
          () => mockRepository.getOfflineDbEnabled(),
        ).thenAnswer((_) async => true);
        when(
          () => mockRepository.setOfflineDbEnabled(any()),
        ).thenAnswer((_) async => Future.value());
        return ProfileCubit(mockRepository);
      },
      act: (cubit) => cubit.toggleOfflineDb(false),
      skip: 2, // Skip initialization states
      expect: () => [
        const ProfileState(isOfflineDbEnabled: false, isLoading: false),
      ],
      verify: (_) {
        verify(() => mockRepository.setOfflineDbEnabled(false)).called(1);
      },
    );*/
  });
}
