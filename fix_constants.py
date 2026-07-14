import os
import re
import glob

def process_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()

    # app_radius.dart
    if 'app_radius.dart' in filepath:
        if 'flutter_screenutil' not in content:
            content = content.replace("import 'package:flutter/widgets.dart';", "import 'package:flutter/widgets.dart';\nimport 'package:flutter_screenutil/flutter_screenutil.dart';")
        content = content.replace("static const double", "static double get")
        content = re.sub(r'static double get (\w+) = ([\d\.]+);', r'static double get \1 => \2.r;', content)
        content = content.replace("static final BorderRadius", "static BorderRadius get")
        content = re.sub(r'static BorderRadius get (\w+) = BorderRadius.circular\((\w+)\);', r'static BorderRadius get \1 => BorderRadius.circular(\2);', content)
    
    # app_spacing.dart
    if 'app_spacing.dart' in filepath:
        if 'flutter_screenutil' not in content:
            content = "import 'package:flutter_screenutil/flutter_screenutil.dart';\n" + content
        content = content.replace("static const double", "static double get")
        content = re.sub(r'static double get (\w+) = ([\d\.]+);', r'static double get \1 => \2.w;', content)

    # app_text_style.dart
    if 'app_text_style.dart' in filepath:
        if 'flutter_screenutil' not in content:
            content = content.replace("import 'package:flutter/material.dart';", "import 'package:flutter/material.dart';\nimport 'package:flutter_screenutil/flutter_screenutil.dart';")
        content = content.replace("static const TextStyle", "static TextStyle get")
        content = re.sub(r'static TextStyle get (\w+) = TextStyle\(', r'static TextStyle get \1 => TextStyle(', content)
        content = re.sub(r'fontSize: ([\d\.]+),', r'fontSize: \1.sp,', content)
        content = re.sub(r'letterSpacing: ([\-\.\d]+) \* ([\d\.]+),', r'letterSpacing: \1 * \2.sp,', content)

    # app_shadow.dart
    if 'app_shadow.dart' in filepath:
        if 'flutter_screenutil' not in content:
            content = content.replace("import 'package:flutter/material.dart';", "import 'package:flutter/material.dart';\nimport 'package:flutter_screenutil/flutter_screenutil.dart';")
        content = content.replace("static final List<BoxShadow>", "static List<BoxShadow> get")
        content = re.sub(r'static List<BoxShadow> get (\w+) = \[', r'static List<BoxShadow> get \1 => [', content)
        content = re.sub(r'offset: const Offset\(([\d\.]+), ([\d\.]+)\),', r'offset: Offset(\1.w, \2.h),', content)
        content = re.sub(r'blurRadius: ([\d\.]+),', r'blurRadius: \1.r,', content)
        content = re.sub(r'spreadRadius: ([\-\d\.]+),', r'spreadRadius: \1.r,', content)

    # app_input_decoration.dart
    if 'app_input_decoration.dart' in filepath:
        if 'flutter_screenutil' not in content:
            content = content.replace("import 'package:flutter/material.dart';", "import 'package:flutter/material.dart';\nimport 'package:flutter_screenutil/flutter_screenutil.dart';")
        content = content.replace("static InputDecorationTheme light = InputDecorationTheme(", "static InputDecorationTheme get light => InputDecorationTheme(")
        content = content.replace("static InputDecorationTheme dark = light.copyWith(", "static InputDecorationTheme get dark => light.copyWith(")
        # Convert padding
        content = content.replace("contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),", "contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),")
        content = content.replace("const BorderSide(", "BorderSide(")

    with open(filepath, 'w') as f:
        f.write(content)

for f in glob.glob('lib/Core/constant/*.dart'):
    process_file(f)

# Also fix app_theme.dart in Core/theme
theme_path = 'lib/Core/theme/app_theme.dart'
if os.path.exists(theme_path):
    with open(theme_path, 'r') as f:
        content = f.read()
    content = content.replace("padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),", "padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),") # keep as is or modify
    with open(theme_path, 'w') as f:
        f.write(content)
