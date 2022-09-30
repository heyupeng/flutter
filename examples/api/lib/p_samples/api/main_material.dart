import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_api_samples/material/about/about_list_tile.0.dart' as about_list_tile_0;
import 'package:flutter_api_samples/material/app_bar/app_bar.0.dart' as app_bar_0;
import 'package:flutter_api_samples/material/app_bar/app_bar.1.dart' as app_bar_1;
import 'package:flutter_api_samples/material/app_bar/app_bar.2.dart' as app_bar_2;
import 'package:flutter_api_samples/material/app_bar/sliver_app_bar.1.dart' as sliver_app_bar_1;
import 'package:flutter_api_samples/material/app_bar/sliver_app_bar.2.dart' as sliver_app_bar_2;
import 'package:flutter_api_samples/material/app_bar/sliver_app_bar.3.dart' as sliver_app_bar_3;
import 'package:flutter_api_samples/material/autocomplete/autocomplete.0.dart' as autocomplete_0;
import 'package:flutter_api_samples/material/autocomplete/autocomplete.1.dart' as autocomplete_1;
import 'package:flutter_api_samples/material/banner/material_banner.0.dart' as material_banner_0;
import 'package:flutter_api_samples/material/banner/material_banner.1.dart' as material_banner_1;
import 'package:flutter_api_samples/material/bottom_app_bar/bottom_app_bar.1.dart' as bottom_app_bar_1;
import 'package:flutter_api_samples/material/bottom_navigation_bar/bottom_navigation_bar.0.dart' as bottom_navigation_bar_0;
import 'package:flutter_api_samples/material/bottom_navigation_bar/bottom_navigation_bar.1.dart' as bottom_navigation_bar_1;
import 'package:flutter_api_samples/material/bottom_navigation_bar/bottom_navigation_bar.2.dart' as bottom_navigation_bar_2;
import 'package:flutter_api_samples/material/bottom_sheet/show_modal_bottom_sheet.0.dart' as show_modal_bottom_sheet_0;
import 'package:flutter_api_samples/material/button_style/button_style.0.dart' as button_style_0;
import 'package:flutter_api_samples/material/card/card.0.dart' as card_0;
import 'package:flutter_api_samples/material/card/card.1.dart' as card_1;
import 'package:flutter_api_samples/material/card/card.2.dart' as card_2;
import 'package:flutter_api_samples/material/checkbox/checkbox.0.dart' as checkbox_0;
import 'package:flutter_api_samples/material/checkbox_list_tile/checkbox_list_tile.0.dart' as checkbox_list_tile_0;
import 'package:flutter_api_samples/material/checkbox_list_tile/checkbox_list_tile.1.dart' as checkbox_list_tile_1;
import 'package:flutter_api_samples/material/checkbox_list_tile/checkbox_list_tile.2.dart' as checkbox_list_tile_2;
import 'package:flutter_api_samples/material/chip/deletable_chip_attributes.on_deleted.0.dart' as deletable_chip_attributes_on_deleted_0;
import 'package:flutter_api_samples/material/data_table/data_table.0.dart' as data_table_0;
import 'package:flutter_api_samples/material/data_table/data_table.1.dart' as data_table_1;
import 'package:flutter_api_samples/material/date_picker/show_date_picker.0.dart' as show_date_picker_0;
import 'package:flutter_api_samples/material/date_picker/show_date_range_picker.0.dart' as show_date_range_picker_0;
import 'package:flutter_api_samples/material/dialog/alert_dialog.0.dart' as alert_dialog_0;
import 'package:flutter_api_samples/material/dialog/alert_dialog.1.dart' as alert_dialog_1;
import 'package:flutter_api_samples/material/dialog/show_dialog.0.dart' as show_dialog_0;
import 'package:flutter_api_samples/material/dialog/show_dialog.1.dart' as show_dialog_1;
import 'package:flutter_api_samples/material/dialog/show_dialog.2.dart' as show_dialog_2;
import 'package:flutter_api_samples/material/divider/divider.0.dart' as divider_0;
import 'package:flutter_api_samples/material/divider/vertical_divider.0.dart' as vertical_divider_0;
import 'package:flutter_api_samples/material/dropdown/dropdown_button.0.dart' as dropdown_button_0;
import 'package:flutter_api_samples/material/dropdown/dropdown_button.selected_item_builder.0.dart' as dropdown_button_selected_item_builder_0;
import 'package:flutter_api_samples/material/dropdown/dropdown_button.style.0.dart' as dropdown_button_style_0;
import 'package:flutter_api_samples/material/elevated_button/elevated_button.0.dart' as elevated_button_0;
import 'package:flutter_api_samples/material/expansion_panel/expansion_panel_list.0.dart' as expansion_panel_list_0;
import 'package:flutter_api_samples/material/expansion_panel/expansion_panel_list.expansion_panel_list_radio.0.dart' as expansion_panel_list_expansion_panel_list_radio_0;
import 'package:flutter_api_samples/material/expansion_tile/expansion_tile.0.dart' as expansion_tile_0;
import 'package:flutter_api_samples/material/flexible_space_bar/flexible_space_bar.0.dart' as flexible_space_bar_0;
import 'package:flutter_api_samples/material/floating_action_button/floating_action_button.0.dart' as floating_action_button_0;
import 'package:flutter_api_samples/material/floating_action_button/floating_action_button.1.dart' as floating_action_button_1;
import 'package:flutter_api_samples/material/floating_action_button/floating_action_button.2.dart' as floating_action_button_2;
import 'package:flutter_api_samples/material/floating_action_button/floating_action_button.3.dart' as floating_action_button_3;
import 'package:flutter_api_samples/material/floating_action_button_location/standard_fab_location.0.dart' as standard_fab_location_0;
import 'package:flutter_api_samples/material/icon_button/icon_button.0.dart' as icon_button_0;
import 'package:flutter_api_samples/material/icon_button/icon_button.1.dart' as icon_button_1;
import 'package:flutter_api_samples/material/icon_button/icon_button.2.dart' as icon_button_2;
import 'package:flutter_api_samples/material/icon_button/icon_button.3.dart' as icon_button_3;
import 'package:flutter_api_samples/material/ink/ink.image_clip.0.dart' as ink_image_clip_0;
import 'package:flutter_api_samples/material/ink/ink.image_clip.1.dart' as ink_image_clip_1;
import 'package:flutter_api_samples/material/ink_well/ink_well.0.dart' as ink_well_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.0.dart' as input_decoration_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.1.dart' as input_decoration_1;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.2.dart' as input_decoration_2;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.3.dart' as input_decoration_3;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.floating_label_style_error.0.dart' as input_decoration_floating_label_style_error_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.label.0.dart' as input_decoration_label_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.label_style_error.0.dart' as input_decoration_label_style_error_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.material_state.0.dart' as input_decoration_material_state_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.material_state.1.dart' as input_decoration_material_state_1;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.prefix_icon.0.dart' as input_decoration_prefix_icon_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.prefix_icon_constraints.0.dart' as input_decoration_prefix_icon_constraints_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.suffix_icon.0.dart' as input_decoration_suffix_icon_0;
import 'package:flutter_api_samples/material/input_decorator/input_decoration.suffix_icon_constraints.0.dart' as input_decoration_suffix_icon_constraints_0;
import 'package:flutter_api_samples/material/list_tile/list_tile.4.dart' as list_tile_4;
import 'package:flutter_api_samples/material/list_tile/list_tile.5.dart' as list_tile_5;
import 'package:flutter_api_samples/material/list_tile/list_tile.selected.0.dart' as list_tile_selected_0;
import 'package:flutter_api_samples/material/material_state/material_state_border_side.0.dart' as material_state_border_side_0;
import 'package:flutter_api_samples/material/material_state/material_state_mouse_cursor.0.dart' as material_state_mouse_cursor_0;
import 'package:flutter_api_samples/material/material_state/material_state_outlined_border.0.dart' as material_state_outlined_border_0;
import 'package:flutter_api_samples/material/material_state/material_state_property.0.dart' as material_state_property_0;
import 'package:flutter_api_samples/material/navigation_bar/navigation_bar.0.dart' as navigation_bar_0;
import 'package:flutter_api_samples/material/navigation_bar/navigation_bar.dart' as navigation_bar_dart;
import 'package:flutter_api_samples/material/navigation_rail/navigation_rail.0.dart' as navigation_rail_0;
import 'package:flutter_api_samples/material/navigation_rail/navigation_rail.1.dart' as navigation_rail_1;
import 'package:flutter_api_samples/material/navigation_rail/navigation_rail.extended_animation.0.dart' as navigation_rail_extended_animation_0;
import 'package:flutter_api_samples/material/outlined_button/outlined_button.0.dart' as outlined_button_0;
import 'package:flutter_api_samples/material/platform_menu_bar/platform_menu_bar.0.dart' as platform_menu_bar_0;
import 'package:flutter_api_samples/material/popupmenu/popupmenu.0.dart' as popupmenu_0;
import 'package:flutter_api_samples/material/progress_indicator/circular_progress_indicator.0.dart' as circular_progress_indicator_0;
import 'package:flutter_api_samples/material/progress_indicator/linear_progress_indicator.0.dart' as linear_progress_indicator_0;
import 'package:flutter_api_samples/material/radio/radio.0.dart' as radio_0;
import 'package:flutter_api_samples/material/radio/radio.toggleable.0.dart' as radio_toggleable_0;
import 'package:flutter_api_samples/material/radio_list_tile/radio_list_tile.0.dart' as radio_list_tile_0;
import 'package:flutter_api_samples/material/radio_list_tile/radio_list_tile.1.dart' as radio_list_tile_1;
import 'package:flutter_api_samples/material/radio_list_tile/radio_list_tile.2.dart' as radio_list_tile_2;
import 'package:flutter_api_samples/material/radio_list_tile/radio_list_tile.toggleable.0.dart' as radio_list_tile_toggleable_0;
import 'package:flutter_api_samples/material/range_slider/range_slider.0.dart' as range_slider_0;
import 'package:flutter_api_samples/material/refresh_indicator/refresh_indicator.0.dart' as refresh_indicator_0;
import 'package:flutter_api_samples/material/refresh_indicator/refresh_indicator.1.dart' as refresh_indicator_1;
import 'package:flutter_api_samples/material/reorderable_list/reorderable_list_view.0.dart' as reorderable_list_view_0;
import 'package:flutter_api_samples/material/reorderable_list/reorderable_list_view.1.dart' as reorderable_list_view_1;
import 'package:flutter_api_samples/material/reorderable_list/reorderable_list_view.build_default_drag_handles.0.dart' as reorderable_list_view_build_default_drag_handles_0;
import 'package:flutter_api_samples/material/reorderable_list/reorderable_list_view.reorderable_list_view_builder.0.dart' as reorderable_list_view_reorderable_list_view_builder_0;
import 'package:flutter_api_samples/material/scaffold/scaffold.0.dart' as scaffold_0;
import 'package:flutter_api_samples/material/scaffold/scaffold.1.dart' as scaffold_1;
import 'package:flutter_api_samples/material/scaffold/scaffold.2.dart' as scaffold_2;
import 'package:flutter_api_samples/material/scaffold/scaffold.drawer.0.dart' as scaffold_drawer_0;
import 'package:flutter_api_samples/material/scaffold/scaffold.end_drawer.0.dart' as scaffold_end_drawer_0;
import 'package:flutter_api_samples/material/scaffold/scaffold.of.0.dart' as scaffold_of_0;
import 'package:flutter_api_samples/material/scaffold/scaffold.of.1.dart' as scaffold_of_1;
import 'package:flutter_api_samples/material/scaffold/scaffold_messenger.0.dart' as scaffold_messenger_0;
import 'package:flutter_api_samples/material/scaffold/scaffold_messenger.of.0.dart' as scaffold_messenger_of_0;
import 'package:flutter_api_samples/material/scaffold/scaffold_messenger.of.1.dart' as scaffold_messenger_of_1;
import 'package:flutter_api_samples/material/scaffold/scaffold_messenger_state.show_material_banner.0.dart' as scaffold_messenger_state_show_material_banner_0;
import 'package:flutter_api_samples/material/scaffold/scaffold_messenger_state.show_snack_bar.0.dart' as scaffold_messenger_state_show_snack_bar_0;
import 'package:flutter_api_samples/material/scaffold/scaffold_state.show_bottom_sheet.0.dart' as scaffold_state_show_bottom_sheet_0;
import 'package:flutter_api_samples/material/scaffold/scaffold_state.show_snack_bar.0.dart' as scaffold_state_show_snack_bar_0;
import 'package:flutter_api_samples/material/scrollbar/scrollbar.0.dart' as scrollbar_0;
import 'package:flutter_api_samples/material/scrollbar/scrollbar.1.dart' as scrollbar_1;
import 'package:flutter_api_samples/material/selection_area/custom_container.dart' as custom_container_dart;
import 'package:flutter_api_samples/material/selection_area/custom_selectable.dart' as custom_selectable_dart;
import 'package:flutter_api_samples/material/selection_area/disable_partial_selection.dart' as disable_partial_selection_dart;
import 'package:flutter_api_samples/material/selection_area/selection_area.dart' as selection_area_dart;
import 'package:flutter_api_samples/material/slider/slider.0.dart' as slider_0;
import 'package:flutter_api_samples/material/snack_bar/snack_bar.0.dart' as snack_bar_0;
import 'package:flutter_api_samples/material/snack_bar/snack_bar.1.dart' as snack_bar_1;
import 'package:flutter_api_samples/material/stepper/stepper.0.dart' as stepper_0;
import 'package:flutter_api_samples/material/stepper/stepper.controls_builder.0.dart' as stepper_controls_builder_0;
import 'package:flutter_api_samples/material/switch/switch.0.dart' as switch_0;
import 'package:flutter_api_samples/material/switch/switch.1.dart' as switch_1;
import 'package:flutter_api_samples/material/switch_list_tile/switch_list_tile.0.dart' as switch_list_tile_0;
import 'package:flutter_api_samples/material/switch_list_tile/switch_list_tile.1.dart' as switch_list_tile_1;
import 'package:flutter_api_samples/material/switch_list_tile/switch_list_tile.2.dart' as switch_list_tile_2;
import 'package:flutter_api_samples/material/tab_controller/tab_controller.1.dart' as tab_controller_1;
import 'package:flutter_api_samples/material/tabs/tab_bar.0.dart' as tab_bar_0;
import 'package:flutter_api_samples/material/tabs/tab_bar.1.dart' as tab_bar_1;
import 'package:flutter_api_samples/material/text_button/text_button.0.dart' as text_button_0;
import 'package:flutter_api_samples/material/text_button/text_button.1.dart' as text_button_1;
import 'package:flutter_api_samples/material/text_field/text_field.1.dart' as text_field_1;
import 'package:flutter_api_samples/material/text_form_field/text_form_field.1.dart' as text_form_field_1;
import 'package:flutter_api_samples/material/theme/theme_extension.1.dart' as theme_extension_1;
import 'package:flutter_api_samples/material/toggle_buttons/toggle_buttons.0.dart' as toggle_buttons_0;
import 'package:flutter_api_samples/material/tooltip/tooltip.0.dart' as tooltip_0;
import 'package:flutter_api_samples/material/tooltip/tooltip.1.dart' as tooltip_1;
import 'package:flutter_api_samples/material/tooltip/tooltip.2.dart' as tooltip_2;
import 'package:flutter_api_samples/material/tooltip/tooltip.3.dart' as tooltip_3;

import '../common/navigator_observer.dart';

Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'about_list_tile_0': (BuildContext context) => const about_list_tile_0.MyApp(),
  'app_bar_0': (BuildContext context) => const app_bar_0.AppBarApp(),
  'app_bar_1': (BuildContext context) => const app_bar_1.AppBarApp(),
  'app_bar_2': (BuildContext context) => const app_bar_2.AppBarApp(),
  'sliver_app_bar_1': (BuildContext context) => const sliver_app_bar_1.AppBarApp(),
  'sliver_app_bar_2': (BuildContext context) => const sliver_app_bar_2.AppBarMediumApp(),
  'sliver_app_bar_3': (BuildContext context) => const sliver_app_bar_3.AppBarLargeApp(),
  'autocomplete_0': (BuildContext context) => const autocomplete_0.AutocompleteExampleApp(),
  'autocomplete_1': (BuildContext context) => const autocomplete_1.AutocompleteExampleApp(),

  'material_banner_0': (BuildContext context) => const material_banner_0.MyApp(),
  'material_banner_1': (BuildContext context) => const material_banner_1.MyApp(),
  'bottom_app_bar_1': (BuildContext context) => const bottom_app_bar_1.BottomAppBarDemo(),
  'bottom_navigation_bar_0': (BuildContext context) => const bottom_navigation_bar_0.MyApp(),
  'bottom_navigation_bar_1': (BuildContext context) => const bottom_navigation_bar_1.MyApp(),
  'bottom_navigation_bar_2': (BuildContext context) => const bottom_navigation_bar_2.MyApp(),
  'show_modal_bottom_sheet_0': (BuildContext context) => const show_modal_bottom_sheet_0.MyApp(),
  'button_style_0': (BuildContext context) => const button_style_0.ButtonApp(),

  'card_0': (BuildContext context) => const card_0.MyApp(),
  'card_1': (BuildContext context) => const card_1.MyApp(),
  'card_2': (BuildContext context) => const card_2.CardExamplesApp(),
  'checkbox_0': (BuildContext context) => const checkbox_0.MyApp(),
  'checkbox_list_tile_0': (BuildContext context) => const checkbox_list_tile_0.MyApp(),
  'checkbox_list_tile_1': (BuildContext context) => const checkbox_list_tile_1.MyApp(),
  'checkbox_list_tile_2': (BuildContext context) => const checkbox_list_tile_2.MyApp(),
  'deletable_chip_attributes_on_deleted_0': (BuildContext context) => const deletable_chip_attributes_on_deleted_0.MyApp(),
  'data_table_0': (BuildContext context) => const data_table_0.MyApp(),
  'data_table_1': (BuildContext context) => const data_table_1.MyApp(),
  'show_date_picker_0': (BuildContext context) => const show_date_picker_0.MyApp(),
  'show_date_range_picker_0': (BuildContext context) => const show_date_range_picker_0.MyApp(),
  'alert_dialog_0': (BuildContext context) => const alert_dialog_0.MyApp(),
  'alert_dialog_1': (BuildContext context) => const alert_dialog_1.MyApp(),
  'show_dialog_0': (BuildContext context) => const show_dialog_0.MyApp(),
  'show_dialog_1': (BuildContext context) => const show_dialog_1.MyApp(),
  'show_dialog_2': (BuildContext context) => const show_dialog_2.MyApp(),
  'divider_0': (BuildContext context) => const divider_0.MyApp(),
  'vertical_divider_0': (BuildContext context) => const vertical_divider_0.MyApp(),

  'dropdown_button_0': (BuildContext context) => const dropdown_button_0.DropdownButtonApp(),
  'dropdown_button_selected_item_builder_0': (BuildContext context) => const dropdown_button_selected_item_builder_0.DropdownButtonApp(),
  'dropdown_button_style_0': (BuildContext context) => const dropdown_button_style_0.DropdownButtonApp(),
  'elevated_button_0': (BuildContext context) => const elevated_button_0.MyApp(),

  'expansion_panel_list_0': (BuildContext context) => const expansion_panel_list_0.MyApp(),
  'expansion_panel_list_expansion_panel_list_radio_0': (BuildContext context) => const expansion_panel_list_expansion_panel_list_radio_0.MyApp(),
  'expansion_tile_0': (BuildContext context) => const expansion_tile_0.MyApp(),
  'flexible_space_bar_0': (BuildContext context) => const flexible_space_bar_0.MyApp(),
  'floating_action_button_0': (BuildContext context) => const floating_action_button_0.MyApp(),
  'floating_action_button_1': (BuildContext context) => const floating_action_button_1.MyApp(),
  'floating_action_button_2': (BuildContext context) => const floating_action_button_2.MyApp(),
  'floating_action_button_3': (BuildContext context) => const floating_action_button_3.MyApp(),
  'standard_fab_location_0': (BuildContext context) => const standard_fab_location_0.MyApp(),
  'icon_button_0': (BuildContext context) => const icon_button_0.MyApp(),
  'icon_button_1': (BuildContext context) => const icon_button_1.MyApp(),
  'icon_button_2': (BuildContext context) => const icon_button_2.IconButtonApp(),
  'icon_button_3': (BuildContext context) => const icon_button_3.IconButtonToggleApp(),
  'ink_image_clip_0': (BuildContext context) => const ink_image_clip_0.MyApp(),
  'ink_image_clip_1': (BuildContext context) => const ink_image_clip_1.MyApp(),
  'ink_well_0': (BuildContext context) => const ink_well_0.MyApp(),
  'input_decoration_0': (BuildContext context) => const input_decoration_0.MyApp(),
  'input_decoration_1': (BuildContext context) => const input_decoration_1.MyApp(),
  'input_decoration_2': (BuildContext context) => const input_decoration_2.MyApp(),
  'input_decoration_3': (BuildContext context) => const input_decoration_3.MyApp(),
  'input_decoration_floating_label_style_error_0': (BuildContext context) => const input_decoration_floating_label_style_error_0.MyApp(),
  'input_decoration_label_0': (BuildContext context) => const input_decoration_label_0.MyApp(),
  'input_decoration_label_style_error_0': (BuildContext context) => const input_decoration_label_style_error_0.MyApp(),
  'input_decoration_material_state_0': (BuildContext context) => const input_decoration_material_state_0.MyApp(),
  'input_decoration_material_state_1': (BuildContext context) => const input_decoration_material_state_1.MyApp(),
  'input_decoration_prefix_icon_0': (BuildContext context) => const input_decoration_prefix_icon_0.MyApp(),
  'input_decoration_prefix_icon_constraints_0': (BuildContext context) => const input_decoration_prefix_icon_constraints_0.MyApp(),
  'input_decoration_suffix_icon_0': (BuildContext context) => const input_decoration_suffix_icon_0.MyApp(),
  'input_decoration_suffix_icon_constraints_0': (BuildContext context) => const input_decoration_suffix_icon_constraints_0.MyApp(),
  'list_tile_4': (BuildContext context) => const list_tile_4.MyApp(),
  'list_tile_5': (BuildContext context) => const list_tile_5.MyApp(),
  'list_tile_selected_0': (BuildContext context) => const list_tile_selected_0.MyApp(),
  'material_state_border_side_0': (BuildContext context) => const material_state_border_side_0.MyApp(),
  'material_state_mouse_cursor_0': (BuildContext context) => const material_state_mouse_cursor_0.MyApp(),
  'material_state_outlined_border_0': (BuildContext context) => const material_state_outlined_border_0.MyApp(),
  'material_state_property_0': (BuildContext context) => const material_state_property_0.MyApp(),
  'navigation_bar_0': (BuildContext context) => const navigation_bar_0.Home(),
  'navigation_bar_dart': (BuildContext context) => const navigation_bar_dart.MyApp(),
  'navigation_rail_0': (BuildContext context) => const navigation_rail_0.MyApp(),
  'navigation_rail_1': (BuildContext context) => const navigation_rail_1.MyApp(),
  'navigation_rail_extended_animation_0': (BuildContext context) => const navigation_rail_extended_animation_0.MyApp(),
  'outlined_button_0': (BuildContext context) => const outlined_button_0.MyApp(),
  'platform_menu_bar_0': (BuildContext context) => const platform_menu_bar_0.SampleApp(),
  'popupmenu_0': (BuildContext context) => const popupmenu_0.MyApp(),
  'circular_progress_indicator_0': (BuildContext context) => const circular_progress_indicator_0.MyApp(),
  'linear_progress_indicator_0': (BuildContext context) => const linear_progress_indicator_0.MyApp(),
  'radio_0': (BuildContext context) => const radio_0.MyApp(),
  'radio_toggleable_0': (BuildContext context) => const radio_toggleable_0.MyApp(),
  'radio_list_tile_0': (BuildContext context) => const radio_list_tile_0.MyApp(),
  'radio_list_tile_1': (BuildContext context) => const radio_list_tile_1.MyApp(),
  'radio_list_tile_2': (BuildContext context) => const radio_list_tile_2.MyApp(),
  'radio_list_tile_toggleable_0': (BuildContext context) => const radio_list_tile_toggleable_0.MyApp(),
  'range_slider_0': (BuildContext context) => const range_slider_0.MyApp(),
  'refresh_indicator_0': (BuildContext context) => const refresh_indicator_0.MyApp(),
  'refresh_indicator_1': (BuildContext context) => const refresh_indicator_1.MyApp(),

  'reorderable_list_view_0': (BuildContext context) => const reorderable_list_view_0.ReorderableApp(),
  'reorderable_list_view_1': (BuildContext context) => const reorderable_list_view_1.ReorderableApp(),
  'reorderable_list_view_build_default_drag_handles_0': (BuildContext context) => const reorderable_list_view_build_default_drag_handles_0.ReorderableApp(),
  'reorderable_list_view_reorderable_list_view_builder_0': (BuildContext context) => const reorderable_list_view_reorderable_list_view_builder_0.ReorderableApp(),

  'scaffold_0': (BuildContext context) => const scaffold_0.MyApp(),
  'scaffold_1': (BuildContext context) => const scaffold_1.MyApp(),
  'scaffold_2': (BuildContext context) => const scaffold_2.MyApp(),
  'scaffold_drawer_0': (BuildContext context) => const scaffold_drawer_0.MyApp(),
  'scaffold_end_drawer_0': (BuildContext context) => const scaffold_end_drawer_0.MyApp(),
  'scaffold_of_0': (BuildContext context) => const scaffold_of_0.MyApp(),
  'scaffold_of_1': (BuildContext context) => const scaffold_of_1.MyApp(),
  'scaffold_messenger_0': (BuildContext context) => const scaffold_messenger_0.MyApp(),
  'scaffold_messenger_of_0': (BuildContext context) => const scaffold_messenger_of_0.MyApp(),
  'scaffold_messenger_of_1': (BuildContext context) => const scaffold_messenger_of_1.MyApp(),
  'scaffold_messenger_state_show_material_banner_0': (BuildContext context) => const scaffold_messenger_state_show_material_banner_0.MyApp(),
  'scaffold_messenger_state_show_snack_bar_0': (BuildContext context) => const scaffold_messenger_state_show_snack_bar_0.MyApp(),
  'scaffold_state_show_bottom_sheet_0': (BuildContext context) => const scaffold_state_show_bottom_sheet_0.MyApp(),
  'scaffold_state_show_snack_bar_0': (BuildContext context) => const scaffold_state_show_snack_bar_0.MyApp(),
  'scrollbar_0': (BuildContext context) => const scrollbar_0.MyApp(),
  'scrollbar_1': (BuildContext context) => const scrollbar_1.MyApp(),
  'custom_container_dart': (BuildContext context) => const custom_container_dart.MyApp(),
  'custom_selectable_dart': (BuildContext context) => const custom_selectable_dart.MyApp(),
  'disable_partial_selection_dart': (BuildContext context) => const disable_partial_selection_dart.MyApp(),
  'selection_area_dart': (BuildContext context) => const selection_area_dart.MyApp(),
  'slider_0': (BuildContext context) => const slider_0.MyApp(),
  'snack_bar_0': (BuildContext context) => const snack_bar_0.MyApp(),
  'snack_bar_1': (BuildContext context) => const snack_bar_1.MyApp(),
  'stepper_0': (BuildContext context) => const stepper_0.MyApp(),
  'stepper_controls_builder_0': (BuildContext context) => const stepper_controls_builder_0.MyApp(),
  'switch_0': (BuildContext context) => const switch_0.SwitchApp(),
  'switch_1': (BuildContext context) => const switch_1.SwitchApp(),
  'switch_list_tile_0': (BuildContext context) => const switch_list_tile_0.MyApp(),
  'switch_list_tile_1': (BuildContext context) => const switch_list_tile_1.MyApp(),
  'switch_list_tile_2': (BuildContext context) => const switch_list_tile_2.MyApp(),
  'tab_controller_1': (BuildContext context) => const tab_controller_1.MyApp(),
  'tab_bar_0': (BuildContext context) => const tab_bar_0.MyApp(),
  'tab_bar_1': (BuildContext context) => const tab_bar_1.MyApp(),
  'text_button_0': (BuildContext context) => const text_button_0.MyApp(),
  'text_button_1': (BuildContext context) => const text_button_1.Home(),
  'text_field_1': (BuildContext context) => const text_field_1.MyApp(),
  'text_form_field_1': (BuildContext context) => const text_form_field_1.MyApp(),
  'theme_extension_1': (BuildContext context) => const theme_extension_1.MyApp(),
  'toggle_buttons_0': (BuildContext context) => const toggle_buttons_0.MyApp(),
  'tooltip_0': (BuildContext context) => const tooltip_0.MyApp(),
  'tooltip_1': (BuildContext context) => const tooltip_1.MyApp(),
  'tooltip_2': (BuildContext context) => const tooltip_2.MyApp(),
  'tooltip_3': (BuildContext context) => const tooltip_3.MyApp(),
};

void main() {
  Future<Directory> directory = Directory('/Users/peng/Desktop/flutter/examples/api/lib/material').create(recursive: true);
  print(directory);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  
    // WillPopScope(
    //     onWillPop: () async {
    //       log('message2');
    //       return false;
    //     } ,
    //     child: 
      MaterialApp(
      title: 'Fluttr Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        errorColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Home'),
      routes: {
        ...routesMap
      },
      navigatorObservers: [NavRouteServer.server(context)],
        // )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _componentKey = '';
  Widget buildAppBarTitle(BuildContext context) {
    // return Autocomplete(optionsBuilder: (textEditingValue) {
    //   if (textEditingValue.text == null || textEditingValue.text == '') {
    //     return routes123.keys;
    //   }
    //   return routes123.keys.where((element) => element.contains(textEditingValue.text));
    // },);
    return Padding(padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      child: TextField(
        cursorColor: Colors.orange,
        decoration: const InputDecoration(
          icon: Icon(Icons.search, color: Colors.white,),
          contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          border: OutlineInputBorder(borderSide: BorderSide(width: 30,)),
          // fillColor: Colors.red,
          // focusColor: Colors.orange,
          // hoverColor: Colors.green,
          // iconColor: Colors.yellow,
          hintText: 'list',
        ),
        onChanged: (String value) => {
          setState(() {
            _componentKey = value;  
          })
        },
      )
    )
   
      ;
  }

  @override
  Widget build(BuildContext context) {
    log(' ${this.runtimeType} build');
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: this.buildAppBarTitle(context),
      ),
        
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:  ListView(
          controller: ScrollController(),
          children: 
          routesMap.keys.where((String element) => element.contains(_componentKey)).map
          ((String e) => ListTile(title: Text(e), onTap: () {
            _onTap(e, arguments: 'material');
          }
          ))
          .toList(),
        )
      ),
    );
  }

  void _onTap(String title, {Object? arguments}) {
    Route route = MaterialPageRoute<bool>(builder: routesMap[title]!, 
      settings: RouteSettings(name: title, arguments: arguments));
    Navigator.of(context).push(route);

    // Navigator.of(context, rootNavigator: true).push(route);
    // Navigator.of(context).pushNamed(title);
  }

  void goback(BuildContext context) {
    /* goback */
    var currtenRoute = ModalRoute.of(context);
    final bool first = currtenRoute?.isFirst ?? true;
    Navigator.of(context, rootNavigator: first).pop();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    log('didChangeDependencies');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    log('deactivate');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
        log('dispose');

  }
}

