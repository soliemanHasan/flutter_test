import 'dart:async';
import 'dart:typed_data';
import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:base_project_v2/core/core_compoent/show_snack_bar.dart';
import 'package:base_project_v2/core/paths/images_paths.dart';
import 'package:base_project_v2/core/paths/svgs_paths.dart';
import 'package:base_project_v2/core/services/service_locator.dart';
import 'package:base_project_v2/core/utils/app_validator.dart';
import 'package:base_project_v2/core/utils/base_state.dart';
import 'package:base_project_v2/modules/auth/domain/entities/category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/entities/sub_category_entity.dart';
import 'package:base_project_v2/modules/auth/domain/entities/user_entity.dart';
import 'package:base_project_v2/modules/auth/presentation/blocs/categories/category_bloc.dart';
import 'package:base_project_v2/modules/auth/presentation/blocs/register/register_bloc.dart';
import 'package:base_project_v2/modules/auth/presentation/blocs/sub_categories/sub_category_bloc.dart';
import 'package:base_project_v2/modules/auth/presentation/components/auth_text_form_fields.dart';
import 'package:base_project_v2/modules/auth/presentation/components/custom_drowp_down_form_field.dart';
import 'package:base_project_v2/modules/auth/presentation/components/custom_image_picker.dart';
import 'package:base_project_v2/modules/auth/presentation/components/map_screen_shot.dart';
import 'package:base_project_v2/modules/auth/presentation/components/profile_photo_pick.dart';
import 'package:base_project_v2/modules/auth/presentation/components/register_button.dart';
import 'package:base_project_v2/modules/auth/presentation/screens/map_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController categoriesController = TextEditingController();

  final TextEditingController subCategoriesController = TextEditingController();

  final TextEditingController bankController = TextEditingController();

  final TextEditingController ibanCotroller = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  final TextEditingController residencyController = TextEditingController();

  int? selectedValue;
  LatLng? selcted;
  Uint8List? _snapshotImage;
  XFile? residencyPhoto;
    XFile? profileImage;

 

  Future<void> uplodImage() async {
    final ImagePicker _picker = ImagePicker();
    final imageFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      residencyPhoto = XFile(imageFile!.path);
   
    });
  }
  Future<void> uplodProfileImage() async {
    final ImagePicker _picker1 = ImagePicker();
    final imageFile = await _picker1.pickImage(source: ImageSource.gallery);

    setState(() {
      profileImage = XFile(imageFile!.path);
   
    });
  }



  Future<void> _selctLocation() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => MapScreen(
        isSelecting: true,
        onSuccess: (latlang, image) {
          setState(() {
            selcted = latlang;
            _snapshotImage = image;
          });
        },
      ),
      fullscreenDialog: true,
    ));
  }

  List<SubCategoryEntity> _selectedSub = [];
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>(
            create: (context) => sl<RegisterBloc>(),
          ),
          BlocProvider<CategoryBloc>(
              create: (context) =>
                  sl<CategoryBloc>()..add(const FetchCategoryEvent())),
          BlocProvider<SubCategoryBloc>(
              create: (context) => sl<SubCategoryBloc>()),
        ],
        child: BlocConsumer<RegisterBloc, BaseState<UserEntity>>(
          listener: _registerListener,
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                children: [
                  ..._buildBackGroundImage(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.continerColor),
                      width: 390,
                      height: 680,
                      child: Form(
                        key: formKey,
                        child: SingleChildScrollView(
                          child: Column(children: [
                          const  SizedBox(
                              height: 15,
                            ),
                            ProfilePhotoPick(image: profileImage,uploadImage: uplodProfileImage ,),
                           
                            const SizedBox(
                              height: 40,
                            ),
                            ..._buildTextFormField(),
                            BlocBuilder<CategoryBloc,
                                    BaseState<CategoriesEntity>>(
                                builder: (context, state) {
                              if (state.isSuccess) {
                                return CustomDrowpDownFormField(
                                  iconPath: SvgsPaths.categories,
                                  hint: 'category',
                                  value: selectedValue,
                                  items: List.generate(
                                      state.data!.categoriesEntity.length,
                                      (index) => DropdownMenuItem(
                                            value: state.data!
                                                .categoriesEntity[index].id,
                                            child: Text(
                                              state.data!
                                                  .categoriesEntity[index].name,
                                            ),
                                          )),
                                  onChanged: (newvalue) {
                                    setState(() {
                                      selectedValue = newvalue!;
                                    });
                                    context.read<SubCategoryBloc>().add(
                                        FetchSubCategoryEvent(selectedValue));
                                  },
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                );
                              } else if (state.isError) {
                                return (Text(state.errorMessage));
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<SubCategoryBloc,
                                    BaseState<SubCategoriesEntity>>(
                                builder: (context, state) {
                              if (state.isSuccess) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: 370,
                                      height: 48,
                                      child: MultiSelectDialogField<
                                          SubCategoryEntity>(
                                        dialogHeight: 212,
                                        dialogWidth: 234,
                                        checkColor: AppColors.white,
                                        selectedColor: AppColors.primaryColor,
                                        //barrierColor:  AppColors.primaryColor,

                                        buttonText: const Text(
                                          'sub category',
                                          style: TextStyle(
                                              color: AppColors.hintColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),

                                        backgroundColor: AppColors.white,
                                        buttonIcon: const Icon(
                                            Icons.keyboard_arrow_down_outlined),

                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: AppColors
                                                  .textFieldBorderColor),
                                        ),

                                        initialValue: [],
                                        items: List.generate(
                                            state.data!.subCategories.length,
                                            (index) => MultiSelectItem<
                                                    SubCategoryEntity>(
                                                state
                                                    .data!.subCategories[index],
                                                state.data!.subCategories[index]
                                                    .name)),
                                        onConfirm: (value) {
                                          setState(() {
                                            _selectedSub = value;
                                          });
                                        },
                                      ),
                                    ),
                                    ..._selectedSub
                                        .map((e) => Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _selectedSub.remove(e);
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 150,
                                                    margin: EdgeInsets.all(10),
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        e.name,
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 0,
                                                  right: 0,
                                                  child: SvgPicture.asset(
                                                      SvgsPaths.vector),
                                                ),
                                              ],
                                            ))
                                        .toList(),
                                  ],
                                );
                              } else if (state.isError) {
                                return Text(state.errorMessage);
                              } else {
                                return AuthTextFormField(
                                  controller: locationController,
                                  hint: "sub category",
                                  prefixIcon: SvgPicture.asset(
                                    SvgsPaths.subCategories,
                                    fit: BoxFit.scaleDown,
                                  ),
                                );
                              }
                            }),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildLocationWidget(
                                _selctLocation, _snapshotImage),
                            ImagePicke(
                              uploadImage: uplodImage,
                              image: residencyPhoto,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RegiseterButton(
                              onPressed: () => _registerPressed(context, state),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  // ******************************************* /textformfield
  List<Widget> _buildTextFormField() {
    return [
      AuthTextFormField(
        controller: nameController,
        hint: "name",
        prefixIcon: SvgPicture.asset(
          SvgsPaths.name,
          fit: BoxFit.scaleDown,
        ),
      ),
      AuthTextFormField(
        controller: phoneController,
        hint: "phone",
        validator: AppVaildator.phoneValidator,
        prefixIcon: SvgPicture.asset(
          SvgsPaths.phone,
          fit: BoxFit.scaleDown,
        ),
      ),
      AuthTextFormField(
        controller: emailController,
        hint: "email",
        prefixIcon: SvgPicture.asset(
          SvgsPaths.email,
          fit: BoxFit.scaleDown,
        ),
      ),
      AuthTextFormField(
        controller: passwordController,
        hint: "password",
        validator: AppVaildator.passwordValidator,
        prefixIcon: SvgPicture.asset(
          SvgsPaths.password,
          fit: BoxFit.scaleDown,
        ),
      ),
      AuthTextFormField(
        controller: cityController,
        hint: "city",
        prefixIcon: SvgPicture.asset(
          SvgsPaths.city,
          fit: BoxFit.scaleDown,
        ),
      ),
      AuthTextFormField(
        controller: bankController,
        hint: "bank",
        prefixIcon: SvgPicture.asset(
          SvgsPaths.bank,
          fit: BoxFit.scaleDown,
        ),
      ),
      AuthTextFormField(
        controller: ibanCotroller,
        hint: "iban",
        prefixIcon: SvgPicture.asset(
          SvgsPaths.iban,
          fit: BoxFit.scaleDown,
        ),
      ),
    ];
  }

  void _registerListener(BuildContext context, BaseState<UserEntity> state) {
    if (state.isError) showSnackBar(context, state.errorMessage);

    if (state.isSuccess) {
      showSnackBar(context, 'Regiser succssefully');
    }
  }

  Future<void> _registerPressed(
      BuildContext context, BaseState<UserEntity> state) async {
    if (!(formKey.currentState!.validate()) ||
        state.isLoading ||
        residencyPhoto != null) {
      context.read<RegisterBloc>().add(
            RegisterButtonTappedEvent(
              name: nameController.text,
              password: passwordController.text,
              email: emailController.text,
              phone: phoneController.text,
              city: cityController.text,
              bankName: bankController.text,
              latitude: selcted!.latitude,
              longitude: selcted!.longitude,
              iban: ibanCotroller.text,
              subCategories: _selectedSub.map((e) => e.id).toList(),
              profilePhoto: await MultipartFile.fromFile(
                profileImage!.path,
                filename: profileImage!.path.split("/").last,
              ),
              residencyPhotoPath: await MultipartFile.fromFile(
                residencyPhoto!.path,
                filename: residencyPhoto!.path.split("/").last,
              ),
            ),
          );
      // }
    }
  }

// ******************************************* /build back ground image

  List<Widget> _buildBackGroundImage() {
    return [
      Positioned(
        top: 0,
        left: 0,
        child: Image.asset(ImagesPaths.test),
      ),
      Positioned(
        top: 0,
        left: 0,
        child: Image.asset(ImagesPaths.test1),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Image.asset(ImagesPaths.test2),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Image.asset(ImagesPaths.test3),
      ),
      Positioned(
        top: 542,
        left: 0,
        child: Image.asset(ImagesPaths.test4),
      ),
      Positioned(
        top: 292,
        right: 0,
        child: Image.asset(ImagesPaths.test5),
      ),
    ];
  }

// ******************************************* /build location widget screen shot and field
  Widget _buildLocationWidget(
      void Function()? selctLocation, Uint8List? snapshotImage) {
    return Column(
      children: [
        InkWell(
          onTap: selctLocation,
          child: Container(
            width: 370,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border:
                  Border.all(color: AppColors.textFieldBorderColor, width: 1),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  SvgsPaths.location,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Location',
                  style: TextStyle(
                      color: AppColors.hintColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        MapScreenShot(snapshotImage: snapshotImage),
      ],
    );
  }
}
