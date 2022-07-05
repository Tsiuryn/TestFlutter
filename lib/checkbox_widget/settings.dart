import 'package:flutter/cupertino.dart';

class Settings {
  CheckboxSettings checkboxSettings;
  ChecklistSettings checklistSettings;

  Settings(
      {CheckboxSettings? checkboxSettings,
      ChecklistSettings? checklistSettings})
      : checkboxSettings = checkboxSettings ?? CheckboxSettings(),
        checklistSettings = checklistSettings ?? ChecklistSettings();
}

class CheckboxSettings {
  int squareColor;
  int textColor;

  CheckboxSettings({
    int? squareColor,
    int? textColor,
  })  : squareColor = squareColor ?? 7,
        textColor = textColor ?? 8;
}

class ChecklistSettings {
  int squareColor;
  int textColor;

  ChecklistSettings({
    int? squareColor,
    int? textColor,
  })  : squareColor = squareColor ?? 4,
        textColor = textColor ?? 5;
}

void main() {
  Settings set = Settings(checkboxSettings: CheckboxSettings(textColor: 11));
  print(set.checkboxSettings.squareColor);
}
