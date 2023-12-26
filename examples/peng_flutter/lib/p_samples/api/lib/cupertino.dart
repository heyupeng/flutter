
import 'package:flutter/material.dart';

import 'package:flutter_api_samples/cupertino/activity_indicator/cupertino_activity_indicator.0.dart' as cupertino_activity_indicator_0;
import 'package:flutter_api_samples/cupertino/bottom_tab_bar/cupertino_tab_bar.0.dart' as cupertino_tab_bar_0;
import 'package:flutter_api_samples/cupertino/button/cupertino_button.0.dart' as cupertino_button_0;
import 'package:flutter_api_samples/cupertino/context_menu/cupertino_context_menu.0.dart' as cupertino_context_menu_0;
import 'package:flutter_api_samples/cupertino/context_menu/cupertino_context_menu.1.dart' as cupertino_context_menu_1;
import 'package:flutter_api_samples/cupertino/date_picker/cupertino_date_picker.0.dart' as cupertino_date_picker_0;
import 'package:flutter_api_samples/cupertino/date_picker/cupertino_timer_picker.0.dart' as cupertino_timer_picker_0;
import 'package:flutter_api_samples/cupertino/dialog/cupertino_action_sheet.0.dart' as cupertino_action_sheet_0;
import 'package:flutter_api_samples/cupertino/dialog/cupertino_alert_dialog.0.dart' as cupertino_alert_dialog_0;
import 'package:flutter_api_samples/cupertino/form_row/cupertino_form_row.0.dart' as cupertino_form_row_0;
import 'package:flutter_api_samples/cupertino/list_section/list_section_base.0.dart' as list_section_base_0;
import 'package:flutter_api_samples/cupertino/list_section/list_section_inset.0.dart' as list_section_inset_0;
import 'package:flutter_api_samples/cupertino/nav_bar/cupertino_navigation_bar.0.dart' as cupertino_navigation_bar_0;
import 'package:flutter_api_samples/cupertino/nav_bar/cupertino_sliver_nav_bar.0.dart' as cupertino_sliver_nav_bar_0;
import 'package:flutter_api_samples/cupertino/page_scaffold/cupertino_page_scaffold.0.dart' as cupertino_page_scaffold_0;
import 'package:flutter_api_samples/cupertino/picker/cupertino_picker.0.dart' as cupertino_picker_0;
import 'package:flutter_api_samples/cupertino/radio/cupertino_radio.0.dart' as cupertino_radio_0;
import 'package:flutter_api_samples/cupertino/radio/cupertino_radio.toggleable.0.dart' as cupertino_radio_toggleable_0;
import 'package:flutter_api_samples/cupertino/refresh/cupertino_sliver_refresh_control.0.dart' as cupertino_sliver_refresh_control_0;
import 'package:flutter_api_samples/cupertino/route/show_cupertino_dialog.0.dart' as show_cupertino_dialog_0;
import 'package:flutter_api_samples/cupertino/route/show_cupertino_modal_popup.0.dart' as show_cupertino_modal_popup_0;
import 'package:flutter_api_samples/cupertino/scrollbar/cupertino_scrollbar.0.dart' as cupertino_scrollbar_0;
import 'package:flutter_api_samples/cupertino/scrollbar/cupertino_scrollbar.1.dart' as cupertino_scrollbar_1;
import 'package:flutter_api_samples/cupertino/search_field/cupertino_search_field.0.dart' as cupertino_search_field_0;
import 'package:flutter_api_samples/cupertino/search_field/cupertino_search_field.1.dart' as cupertino_search_field_1;
import 'package:flutter_api_samples/cupertino/segmented_control/cupertino_segmented_control.0.dart' as cupertino_segmented_control_0;
import 'package:flutter_api_samples/cupertino/segmented_control/cupertino_sliding_segmented_control.0.dart' as cupertino_sliding_segmented_control_0;
import 'package:flutter_api_samples/cupertino/slider/cupertino_slider.0.dart' as cupertino_slider_0;
import 'package:flutter_api_samples/cupertino/switch/cupertino_switch.0.dart' as cupertino_switch_0;
import 'package:flutter_api_samples/cupertino/tab_scaffold/cupertino_tab_controller.0.dart' as cupertino_tab_controller_0;
import 'package:flutter_api_samples/cupertino/tab_scaffold/cupertino_tab_scaffold.0.dart' as cupertino_tab_scaffold_0;
import 'package:flutter_api_samples/cupertino/text_field/cupertino_text_field.0.dart' as cupertino_text_field_0;
import 'package:flutter_api_samples/cupertino/text_form_field_row/cupertino_text_form_field_row.1.dart' as cupertino_text_form_field_row_1;


Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'cupertino_activity_indicator_0': (context) => cupertino_activity_indicator_0.CupertinoIndicatorApp(),  
  'cupertino_tab_bar_0': (context) => cupertino_tab_bar_0.CupertinoTabBarApp(),
  'cupertino_button_0': (context) => cupertino_button_0.CupertinoButtonApp(),
  'cupertino_context_menu_0': (context) => cupertino_context_menu_0.ContextMenuApp(),
  'cupertino_context_menu_1': (context) => cupertino_context_menu_1.ContextMenuApp(),
  'cupertino_date_picker_0': (context) => cupertino_date_picker_0.DatePickerApp(),
  'cupertino_timer_picker_0': (context) => cupertino_timer_picker_0.TimerPickerApp(),
  'cupertino_action_sheet_0': (context) => cupertino_action_sheet_0.ActionSheetApp(),
  'cupertino_alert_dialog_0': (context) => cupertino_alert_dialog_0.AlertDialogApp(),
  'cupertino_form_row_0': (context) => cupertino_form_row_0.CupertinoFormRowApp(),
  'list_section_base_0': (context) => list_section_base_0.CupertinoListSectionBaseApp(),
  'list_section_inset_0': (context) => list_section_inset_0.CupertinoListSectionInsetApp(),
  'cupertino_navigation_bar_0': (context) => cupertino_navigation_bar_0.NavBarApp(),
  'cupertino_sliver_nav_bar_0': (context) => cupertino_sliver_nav_bar_0.SliverNavBarApp(),
  'cupertino_page_scaffold_0': (context) => cupertino_page_scaffold_0.PageScaffoldApp(),
  'cupertino_picker_0': (context) => cupertino_picker_0.CupertinoPickerApp(),
  'cupertino_radio_0': (context) => cupertino_radio_0.CupertinoRadioApp(),
  'cupertino_radio_toggleable_0': (context) => cupertino_radio_toggleable_0.CupertinoRadioApp(),
  'cupertino_sliver_refresh_control_0': (context) => cupertino_sliver_refresh_control_0.RefreshControlApp(),
  'show_cupertino_dialog_0': (context) => show_cupertino_dialog_0.CupertinoDialogApp(),
  'show_cupertino_modal_popup_0': (context) => show_cupertino_modal_popup_0.ModalPopupApp(),
  'cupertino_scrollbar_0': (context) => cupertino_scrollbar_0.ScrollbarApp(),
  'cupertino_scrollbar_1': (context) => cupertino_scrollbar_1.ScrollbarApp(),
  'cupertino_search_field_0': (context) => cupertino_search_field_0.SearchTextFieldApp(),
  'cupertino_search_field_1': (context) => cupertino_search_field_1.SearchTextFieldApp(),
  'cupertino_segmented_control_0': (context) => cupertino_segmented_control_0.SegmentedControlApp(),
  'cupertino_sliding_segmented_control_0': (context) => cupertino_sliding_segmented_control_0.SegmentedControlApp(),
  'cupertino_slider_0': (context) => cupertino_slider_0.CupertinoSliderApp(),
  'cupertino_switch_0': (context) => cupertino_switch_0.CupertinoSwitchApp(),
  'cupertino_tab_controller_0': (context) => cupertino_tab_controller_0.TabControllerApp(),
  'cupertino_tab_scaffold_0': (context) => cupertino_tab_scaffold_0.TabScaffoldApp(),
  'cupertino_text_field_0': (context) => cupertino_text_field_0.CupertinoTextFieldApp(),
  'cupertino_text_form_field_row_1': (context) => cupertino_text_form_field_row_1.FormSectionApp(),
  };
