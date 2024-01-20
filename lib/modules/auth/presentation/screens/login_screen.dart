// import 'package:base_project_v2/core/core_compoent/app_button.dart';
// import 'package:base_project_v2/core/core_compoent/loading_compoent.dart';
// import 'package:base_project_v2/core/core_compoent/show_snack_bar.dart';
// import 'package:base_project_v2/generated/locale_keys.g.dart';
// import 'package:base_project_v2/modules/auth/presentation/routes/register_route.dart';
// import 'package:base_project_v2/modules/home/presentation/routes/home_route.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/services/service_locator.dart';
// import '../../../../core/utils/app_validator.dart';
// import '../../../../core/utils/base_state.dart';
// import '../../domain/entities/user_entity.dart';
// import '../blocs/login/login_bloc.dart';
// import '../components/auth_text_form_fields.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // provided a bloc
//     return BlocProvider(
//         create: (context) => sl<LoginBloc>(),
//         // listen to bloc state changes
//         child: BlocListener<LoginBloc, BaseState<UserEntity>>(
//           listener: _loginListener,
//           // build screen by bloc builder
//           child: Scaffold(
//             appBar: AppBar(),
//             body: BlocBuilder<LoginBloc, BaseState<UserEntity>>(
//               builder: (context, state) {
//                 ///
//                 /// ... your screen
//                 return Form(
//                   key: formKey,
//                   child: ListView(
//                     padding: EdgeInsets.symmetric(horizontal: 4.w),
//                     children: [
//                       // Header
//                       Text(
//                         LocaleKeys.welcomeBack.tr(),
//                         style: Theme.of(context).textTheme.displayLarge,
//                       ),
//                       Text(
//                         LocaleKeys.enterYouDataToContinue.tr(),
//                         style: Theme.of(context).textTheme.displayMedium,
//                       ),

//                       // phone number
//                       SizedBox(height: 8.w),
//                       Text(
//                         LocaleKeys.phoneNumber.tr(),
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),

//                       AuthTextFormField(
//                         controller: phoneNumberController,
//                         hint: LocaleKeys.enterYourPhoneNumber.tr(),
//                         validator: AppVaildator.phoneValidator,
//                         keyboardType: TextInputType.phone,
//                         prefixIcon: Icon(
//                           Icons.phone,
//                           size: 18.sp,
//                         ),
//                       ),

//                       // password
//                       SizedBox(height: 4.w),
//                       Text(
//                         LocaleKeys.password.tr(),
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                       AuthTextFormField(
//                         controller: passwordController,
//                         hint: LocaleKeys.enterPassword.tr(),
//                         validator: AppVaildator.passwordValidator,
//                         keyboardType: TextInputType.visiblePassword,
//                         isPass: true,
//                         prefixIcon: Icon(
//                           Icons.lock,
//                           size: 18.sp,
//                         ),
//                       ),
//                       SizedBox(height: 45.w),

//                       // button
//                       AppButton(
//                         lable: LocaleKeys.login.tr(),
//                         onTap: () => _loginPressed(context, state),
//                       ),

//                       // fotter
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             LocaleKeys.dontHaveAnAccount.tr(),
//                             style: Theme.of(context).textTheme.displayMedium,
//                           ),
//                           TextButton(
//                             onPressed: () => context.go(RegisterRoute.name),
//                             child: Text(
//                               LocaleKeys.register.tr(),
//                               style: Theme.of(context).textTheme.displaySmall,
//                             ),
//                           )
//                         ],
//                       ),

//                       // loading
//                       state.isLoading
//                           ? const LoadingComponent()
//                           : const SizedBox.shrink(),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ));
//   }

//   void _loginPressed(BuildContext context, BaseState<UserEntity> state) {
//     if (!(formKey.currentState!.validate()) || state.isLoading) return;

//     context.read<LoginBloc>().add(
//           LoginButtonTappedEvent(
//             password: passwordController.text,
//             phoneNumber: phoneNumberController.text,
//           ),
//         );
//   }

//   void _loginListener(BuildContext context, BaseState<UserEntity> state) {
//     if (state.isError) showSnackBar(context, state.errorMessage);

//     if (state.isSuccess) {
//       context.go(HomeRoute.name);
//       showSnackBar(context, LocaleKeys.loginDone.tr());
//     }
//   }
// }
