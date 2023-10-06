import 'package:flutter/material.dart';

class Langmenu extends StatelessWidget {
  const Langmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<AppLanguage>(
      value: AppLanguage.en,
        items: List.generate(AppLanguage.values.length, (index){
      return DropdownMenuItem(child:Text(AppLanguage.values[index].getLangName) ,
      value: AppLanguage.values[index],);
    } ), onChanged: (val){

    });
  }
}

extension LangHandler on AppLanguage{
  String get getLangName{
    switch(this){

      case AppLanguage.ar:
       return"العربية";
      case AppLanguage.en:
       return"English";
      case AppLanguage.fr:
        return"Francais";
    }
  }
}

enum AppLanguage{
  ar,
  en,
  fr
}