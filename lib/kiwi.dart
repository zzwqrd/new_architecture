import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  // container.registerFactory<RegisterBloc>(
  //   (container) => RegisterBloc(
  //     productUseCaseImp: container.resolve<ProductUseCaseImp>(),
  //   ),
  // );

  // container.registerFactory((c) => ProductController());
  // container.registerFactory((c) => DeleteController());
  // container.registerFactory((c) => DataCubitFreezedEnum());
  // container.registerFactory((c) => GetDataTestCubit());
  // container.registerFactory((c) => DropdownCubit());

  // /// this test provider not bloc
  // container.registerFactory((c) => DataNotifier());
  // container.registerFactory((c) => DataCubit());

  // container.registerFactory((c) => DataBloc());
}
