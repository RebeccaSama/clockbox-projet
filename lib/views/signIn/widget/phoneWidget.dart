import 'package:clockbox_projet/core/constants/themes.dart';
import 'package:clockbox_projet/core/extensions/string_extension.dart';
import 'package:clockbox_projet/core/provider/providers.dart';
import 'package:clockbox_projet/core/ressources/list_countries.dart';
import 'package:clockbox_projet/core/utils/utils.dart';
import 'package:clockbox_projet/views/signIn/controller/auth_controller.dart';
import 'package:clockbox_projet/views/signIn/widget/custom_text_field.dart';
import 'package:clockbox_projet/views/signIn/widget/select_country_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneField extends ConsumerWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const PhoneField({Key? key, required this.controller, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authController = ref.watch(authControllerProvider);
    var actualCountry = ListCountries.listCountries
        .where((country) =>
            country["node"]["alpha2Code"] == authController.countryCode)
        .single;

    return 
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: kLastColor),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
      ),
      child:
       Row(
        children: [
          GestureDetector(
            onTap: () {
              Utils.showCustomDialog(
                context: context,
                canPop: false,
                backgroundColor: Colors.white.withOpacity(0.87),
                insetPadding: const EdgeInsets.all(24),
                borderRadius: 16,
                child: (ctx) => const SelectCountryDialog(),
              );
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          "assets/countries/${actualCountry["node"]["name"].toString().assetsName}.png",
                          width: 36,
                          height: 28,
                          fit: BoxFit.fill,
                        )),
                  ),
                  const Icon(Icons.arrow_drop_down_rounded)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 4),
            child: Text(
              "+${ref.watch(phoneMasksProvider)[actualCountry["node"]["alpha2Code"]]?.phoneCode ?? ""}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: CustomTextField(
              controller: controller,
              onChanged: onChanged,
              hasDecoration: false,
              inputFormatters: [authController.maskTextInputFormatter],
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              keyboardType: TextInputType.number,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
