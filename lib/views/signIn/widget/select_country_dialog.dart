import 'dart:convert';
import 'package:clockbox_projet/core/constants/themes.dart';
import 'package:clockbox_projet/core/extensions/string_extension.dart';
import 'package:clockbox_projet/core/ressources/list_countries.dart';
import 'package:clockbox_projet/views/signIn/controller/auth_controller.dart';
import 'package:clockbox_projet/views/signIn/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/helpers.dart';

class SelectCountryDialog extends ConsumerStatefulWidget {
  const SelectCountryDialog({super.key});

  @override
  ConsumerState<SelectCountryDialog> createState() =>
      _SelectCountryDialogState();
}

class _SelectCountryDialogState extends ConsumerState<SelectCountryDialog> {
  bool isSearch = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var countrySort = ListCountries.listCountries
        .where((country) => removeDiacritics(
                jsonDecode(country["node"]["translations"])["fr"])
            .toLowerCase()
            .contains(removeDiacritics(searchController.text).toLowerCase()))
        .toList()
      ..sort((a, b) => removeDiacritics(
              jsonDecode(a["node"]["translations"])["fr"])
          .compareTo(
              removeDiacritics(jsonDecode(b["node"]["translations"])["fr"])));

    return WillPopScope(
      onWillPop: () async {
        if (isSearch) {
          isSearch = false;
          setState(() {});
          searchController.clear();

          return false;
        }

        return true;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Sélectionner un pays",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(16),
                  splashRadius: 16,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomTextField(
              controller: searchController,
              hint: "Rechercher",
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: countrySort.isEmpty
                ? const Center(
                    child: Text("Aucun pays ne correspond à votre recherche"),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 300));

                          var authController = ref.read(authControllerProvider);
                          authController.setCountryCode(
                              countrySort[index]["node"]["alpha2Code"],
                              "+${countrySort[index]["node"]["callingCodes"][0]}");
                          authController.changeCountryCode();

                          if (mounted) {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: AssetImage(
                                        "assets/countries/${countrySort[index]["node"]["name"].toString().assetsName}.png",
                                      ),
                                      width: 36,
                                      height: 28,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Text(
                                    jsonDecode(countrySort[index]["node"]
                                            ["translations"])["fr"] ??
                                        "",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Text(
                                "+${countrySort[index]["node"]["callingCodes"][0]}",
                                style: const TextStyle(
                                    color: kPrimaryColor),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                    itemCount: countrySort.length),
          )
        ]),
      ),
    
    );
  }
}
