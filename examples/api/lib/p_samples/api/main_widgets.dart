import 'dart:async';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:material_color_utilities/utils/math_utils.dart';

import '../../widgets/actions/action.action_overridable.0.dart' as action_action_overridable_0;
import '../../widgets/actions/action_listener.0.dart' as action_listener_0;
import '../../widgets/actions/actions.0.dart' as actions_0;
import '../../widgets/actions/focusable_action_detector.0.dart' as focusable_action_detector_0;
import '../../widgets/animated_list/animated_list.0.dart' as animated_list_0;
import '../../widgets/animated_list/sliver_animated_list.0.dart' as sliver_animated_list_0;
import '../../widgets/animated_size/animated_size.0.dart' as animated_size_0;
import '../../widgets/animated_switcher/animated_switcher.0.dart' as animated_switcher_0;
import '../../widgets/async/future_builder.0.dart' as future_builder_0;
import '../../widgets/async/stream_builder.0.dart' as stream_builder_0;
import '../../widgets/autocomplete/raw_autocomplete.0.dart' as raw_autocomplete_0;
import '../../widgets/autocomplete/raw_autocomplete.1.dart' as raw_autocomplete_1;
import '../../widgets/autocomplete/raw_autocomplete.2.dart' as raw_autocomplete_2;
import '../../widgets/autocomplete/raw_autocomplete.focus_node.0.dart' as raw_autocomplete_focus_node_0;
import '../../widgets/autofill/autofill_group.0.dart' as autofill_group_0;
import '../../widgets/basic/absorb_pointer.0.dart' as absorb_pointer_0;
import '../../widgets/basic/aspect_ratio.0.dart' as aspect_ratio_0;
import '../../widgets/basic/aspect_ratio.1.dart' as aspect_ratio_1;
import '../../widgets/basic/aspect_ratio.2.dart' as aspect_ratio_2;
import '../../widgets/basic/clip_rrect.0.dart' as clip_rrect_0;
import '../../widgets/basic/clip_rrect.1.dart' as clip_rrect_1;
import '../../widgets/basic/custom_multi_child_layout.0.dart' as custom_multi_child_layout_0;
import '../../widgets/basic/expanded.0.dart' as expanded_0;
import '../../widgets/basic/expanded.1.dart' as expanded_1;
import '../../widgets/basic/fitted_box.0.dart' as fitted_box_0;
import '../../widgets/basic/flow.0.dart' as flow_0;
import '../../widgets/basic/fractionally_sized_box.0.dart' as fractionally_sized_box_0;
import '../../widgets/basic/ignore_pointer.0.dart' as ignore_pointer_0;
import '../../widgets/basic/indexed_stack.0.dart' as indexed_stack_0;
import '../../widgets/basic/listener.0.dart' as listener_0;
import '../../widgets/basic/mouse_region.0.dart' as mouse_region_0;
import '../../widgets/basic/mouse_region.on_exit.0.dart' as mouse_region_on_exit_0;
import '../../widgets/basic/mouse_region.on_exit.1.dart' as mouse_region_on_exit_1;
import '../../widgets/basic/offstage.0.dart' as offstage_0;
import '../../widgets/basic/physical_shape.0.dart' as physical_shape_0;
import '../../widgets/binding/widget_binding_observer.0.dart' as widget_binding_observer_0;
import '../../widgets/color_filter/color_filtered.0.dart' as color_filtered_0;
import '../../widgets/dismissible/dismissible.0.dart' as dismissible_0;
import '../../widgets/drag_target/draggable.0.dart' as draggable_0;
import '../../widgets/editable_text/editable_text.on_changed.0.dart' as editable_text_on_changed_0;
import '../../widgets/editable_text/text_editing_controller.0.dart' as text_editing_controller_0;
import '../../widgets/focus_manager/focus_node.0.dart' as focus_node_0;
import '../../widgets/focus_manager/focus_node.unfocus.0.dart' as focus_node_unfocus_0;
import '../../widgets/focus_scope/focus.0.dart' as focus_0;
import '../../widgets/focus_scope/focus.1.dart' as focus_1;
import '../../widgets/focus_scope/focus.2.dart' as focus_2;
import '../../widgets/focus_scope/focus_scope.0.dart' as focus_scope_0;
import '../../widgets/focus_traversal/focus_traversal_group.0.dart' as focus_traversal_group_0;
import '../../widgets/focus_traversal/ordered_traversal_policy.0.dart' as ordered_traversal_policy_0;
import '../../widgets/form/form.0.dart' as form_0;
import '../../widgets/framework/build_owner.0.dart' as build_owner_0;
import '../../widgets/framework/error_widget.0.dart' as error_widget_0;
import '../../widgets/gesture_detector/gesture_detector.0.dart' as gesture_detector_0;
import '../../widgets/gesture_detector/gesture_detector.1.dart' as gesture_detector_1;
import '../../widgets/gesture_detector/gesture_detector.2.dart' as gesture_detector_2;
import '../../widgets/heroes/hero.0.dart' as hero_0;
import '../../widgets/heroes/hero.1.dart' as hero_1;
import '../../widgets/image/image.error_builder.0.dart' as image_error_builder_0;
import '../../widgets/image/image.frame_builder.0.dart' as image_frame_builder_0;
import '../../widgets/image/image.loading_builder.0.dart' as image_loading_builder_0;
import '../../widgets/implicit_animations/animated_align.0.dart' as animated_align_0;
import '../../widgets/implicit_animations/animated_container.0.dart' as animated_container_0;
import '../../widgets/implicit_animations/animated_fractionally_sized_box.0.dart' as animated_fractionally_sized_box_0;
import '../../widgets/implicit_animations/animated_padding.0.dart' as animated_padding_0;
import '../../widgets/implicit_animations/animated_positioned.0.dart' as animated_positioned_0;
import '../../widgets/implicit_animations/animated_slide.0.dart' as animated_slide_0;
import '../../widgets/implicit_animations/sliver_animated_opacity.0.dart' as sliver_animated_opacity_0;
import '../../widgets/inherited_model/inherited_model.0.dart' as inherited_model_0;
import '../../widgets/inherited_notifier/inherited_notifier.0.dart' as inherited_notifier_0;
import '../../widgets/inherited_theme/inherited_theme.0.dart' as inherited_theme_0;
import '../../widgets/interactive_viewer/interactive_viewer.0.dart' as interactive_viewer_0;
import '../../widgets/interactive_viewer/interactive_viewer.builder.0.dart' as interactive_viewer_builder_0;
import '../../widgets/interactive_viewer/interactive_viewer.constrained.0.dart' as interactive_viewer_constrained_0;
import '../../widgets/interactive_viewer/interactive_viewer.transformation_controller.0.dart' as interactive_viewer_transformation_controller_0;
import '../../widgets/layout_builder/layout_builder.0.dart' as layout_builder_0;
import '../../widgets/media_query/media_query_data.system_gesture_insets.0.dart' as media_query_data_system_gesture_insets_0;
import '../../widgets/navigator/navigator.0.dart' as navigator_0;
import '../../widgets/navigator/navigator.restorable_push.0.dart' as navigator_restorable_push_0;
import '../../widgets/navigator/navigator.restorable_push_and_remove_until.0.dart' as navigator_restorable_push_and_remove_until_0;
import '../../widgets/navigator/navigator.restorable_push_replacement.0.dart' as navigator_restorable_push_replacement_0;
import '../../widgets/navigator/navigator_state.restorable_push.0.dart' as navigator_state_restorable_push_0;
import '../../widgets/navigator/navigator_state.restorable_push_and_remove_until.0.dart' as navigator_state_restorable_push_and_remove_until_0;
import '../../widgets/navigator/navigator_state.restorable_push_replacement.0.dart' as navigator_state_restorable_push_replacement_0;
import '../../widgets/navigator/restorable_route_future.0.dart' as restorable_route_future_0;
import '../../widgets/nested_scroll_view/nested_scroll_view.0.dart' as nested_scroll_view_0;
import '../../widgets/nested_scroll_view/nested_scroll_view.1.dart' as nested_scroll_view_1;
import '../../widgets/nested_scroll_view/nested_scroll_view.2.dart' as nested_scroll_view_2;
import '../../widgets/nested_scroll_view/nested_scroll_view_state.0.dart' as nested_scroll_view_state_0;
import '../../widgets/notification_listener/notification.0.dart' as notification_0;
import '../../widgets/overflow_bar/overflow_bar.0.dart' as overflow_bar_0;
import '../../widgets/overscroll_indicator/glowing_overscroll_indicator.0.dart' as glowing_overscroll_indicator_0;
import '../../widgets/overscroll_indicator/glowing_overscroll_indicator.1.dart' as glowing_overscroll_indicator_1;
import '../../widgets/page_storage/page_storage.0.dart' as page_storage_0;
import '../../widgets/page_view/page_view.0.dart' as page_view_0;
import '../../widgets/preferred_size/preferred_size.0.dart' as preferred_size_0;
import '../../widgets/restoration/restoration_mixin.0.dart' as restoration_mixin_0;
import '../../widgets/restoration_properties/restorable_value.0.dart' as restorable_value_0;
import '../../widgets/routes/show_general_dialog.0.dart' as show_general_dialog_0;
import '../../widgets/scroll_position/scroll_metrics_notification.0.dart' as scroll_metrics_notification_0;
import '../../widgets/scroll_view/custom_scroll_view.1.dart' as custom_scroll_view_1;
import '../../widgets/scroll_view/listview_select.1.dart' as listview_select_1;
import '../../widgets/scrollbar/raw_scrollbar.0.dart' as raw_scrollbar_0;
import '../../widgets/scrollbar/raw_scrollbar.1.dart' as raw_scrollbar_1;
import '../../widgets/scrollbar/raw_scrollbar.2.dart' as raw_scrollbar_2;
import '../../widgets/scrollbar/raw_scrollbar.shape.0.dart' as raw_scrollbar_shape_0;
import '../../widgets/shared_app_data/shared_app_data.0.dart' as shared_app_data_0;
import '../../widgets/shared_app_data/shared_app_data.1.dart' as shared_app_data_1;
import '../../widgets/shortcuts/character_activator.0.dart' as character_activator_0;
import '../../widgets/shortcuts/logical_key_set.0.dart' as logical_key_set_0;
import '../../widgets/shortcuts/shortcuts.0.dart' as shortcuts_0;
import '../../widgets/shortcuts/shortcuts.1.dart' as shortcuts_1;
import '../../widgets/shortcuts/single_activator.single_activator.0.dart' as single_activator_single_activator_0;
import '../../widgets/single_child_scroll_view/single_child_scroll_view.0.dart' as single_child_scroll_view_0;
import '../../widgets/single_child_scroll_view/single_child_scroll_view.1.dart' as single_child_scroll_view_1;
import '../../widgets/sliver_fill/sliver_fill_remaining.0.dart' as sliver_fill_remaining_0;
import '../../widgets/sliver_fill/sliver_fill_remaining.1.dart' as sliver_fill_remaining_1;
import '../../widgets/sliver_fill/sliver_fill_remaining.2.dart' as sliver_fill_remaining_2;
import '../../widgets/sliver_fill/sliver_fill_remaining.3.dart' as sliver_fill_remaining_3;
import '../../widgets/slotted_render_object_widget/slotted_multi_child_render_object_widget_mixin.0.dart' as slotted_multi_child_render_object_widget_mixin_0;
import '../../widgets/table/table.0.dart' as table_0;
import '../../widgets/transitions/align_transition.0.dart' as align_transition_0;
import '../../widgets/transitions/animated_builder.0.dart' as animated_builder_0;
import '../../widgets/transitions/animated_widget.0.dart' as animated_widget_0;
import '../../widgets/transitions/decorated_box_transition.0.dart' as decorated_box_transition_0;
import '../../widgets/transitions/default_text_style_transition.0.dart' as default_text_style_transition_0;
import '../../widgets/transitions/fade_transition.0.dart' as fade_transition_0;
import '../../widgets/transitions/positioned_transition.0.dart' as positioned_transition_0;
import '../../widgets/transitions/relative_positioned_transition.0.dart' as relative_positioned_transition_0;
import '../../widgets/transitions/rotation_transition.0.dart' as rotation_transition_0;
import '../../widgets/transitions/scale_transition.0.dart' as scale_transition_0;
import '../../widgets/transitions/size_transition.0.dart' as size_transition_0;
import '../../widgets/transitions/slide_transition.0.dart' as slide_transition_0;
import '../../widgets/transitions/sliver_fade_transition.0.dart' as sliver_fade_transition_0;
import '../../widgets/tween_animation_builder/tween_animation_builder.0.dart' as tween_animation_builder_0;
import '../../widgets/will_pop_scope/will_pop_scope.0.dart' as will_pop_scope_0;

import '../common/navigator_observer.dart';
import 'main_base.dart' as MB;

Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'action_action_overridable_0': (context) => const action_action_overridable_0.SimpleUSPhoneNumberEntry(),
  'action_listener_0': (context) => const action_listener_0.MyApp(),
  'actions_0': (context) => const actions_0.MyApp(),
  'focusable_action_detector_0': (context) => const focusable_action_detector_0.MyApp(),
  'animated_list_0': (context) => const animated_list_0.AnimatedListSample(),
  'sliver_animated_list_0': (context) => const sliver_animated_list_0.SliverAnimatedListSample(),
  'animated_size_0': (context) => const animated_size_0.MyApp(),
  'animated_switcher_0': (context) => const animated_switcher_0.MyApp(),
  'future_builder_0': (context) => const future_builder_0.MyApp(),
  'stream_builder_0': (context) => const stream_builder_0.MyApp(),

  'raw_autocomplete_0': (context) => const raw_autocomplete_0.AutocompleteExampleApp(),
  'raw_autocomplete_1': (context) => const raw_autocomplete_1.AutocompleteExampleApp(),
  'raw_autocomplete_2': (context) => const raw_autocomplete_2.AutocompleteExampleApp(),
  'raw_autocomplete_focus_node_0': (context) => const raw_autocomplete_focus_node_0.AutocompleteExampleApp(),
  'autofill_group_0': (context) => const autofill_group_0.MyApp(),
  'absorb_pointer_0': (context) => const absorb_pointer_0.MyApp(),
  'aspect_ratio_0': (context) => const aspect_ratio_0.MyApp(),
  'aspect_ratio_1': (context) => const aspect_ratio_1.MyApp(),
  'aspect_ratio_2': (context) => const aspect_ratio_2.MyApp(),

  'clip_rrect_0': (context) => const clip_rrect_0.ClipRRectApp(),
  'clip_rrect_1': (context) => const clip_rrect_1.ClipRRectApp(),
  'custom_multi_child_layout_0': (context) => const custom_multi_child_layout_0.ExampleApp(),
  'expanded_0': (context) => const expanded_0.MyApp(),
  'expanded_1': (context) => const expanded_1.MyApp(),
  'fitted_box_0': (context) => const fitted_box_0.MyApp(),

  'flow_0': (context) => const flow_0.FlowApp(),
  'fractionally_sized_box_0': (context) => const fractionally_sized_box_0.MyApp(),
  'ignore_pointer_0': (context) => const ignore_pointer_0.MyApp(),
  'indexed_stack_0': (context) => const indexed_stack_0.MyApp(),
  'listener_0': (context) => const listener_0.MyApp(),
  'mouse_region_0': (context) => const mouse_region_0.MyApp(),
  'mouse_region_on_exit_0': (context) => const mouse_region_on_exit_0.MyApp(),
  'mouse_region_on_exit_1': (context) => const mouse_region_on_exit_1.MyApp(),
  'offstage_0': (context) => const offstage_0.MyApp(),
  'physical_shape_0': (context) => const physical_shape_0.MyApp(),
  'widget_binding_observer_0': (context) => const widget_binding_observer_0.MyApp(),
  'color_filtered_0': (context) => const color_filtered_0.MyApp(),
  'dismissible_0': (context) => const dismissible_0.MyApp(),
  'draggable_0': (context) => const draggable_0.MyApp(),
  'editable_text_on_changed_0': (context) => const editable_text_on_changed_0.MyApp(),
  'text_editing_controller_0': (context) => const text_editing_controller_0.MyApp(),
  'focus_node_0': (context) => const focus_node_0.MyApp(),
  'focus_node_unfocus_0': (context) => const focus_node_unfocus_0.MyApp(),
  'focus_0': (context) => const focus_0.MyApp(),
  'focus_1': (context) => const focus_1.MyApp(),
  'focus_2': (context) => const focus_2.MyApp(),
  'focus_scope_0': (context) => const focus_scope_0.MyApp(),
  'focus_traversal_group_0': (context) => const focus_traversal_group_0.MyApp(),
  'ordered_traversal_policy_0': (context) => const ordered_traversal_policy_0.MyApp(),
  'form_0': (context) => const form_0.MyApp(),

  // 'build_owner_0': (context) => const build_owner_0.MeasurementView(),
  'error_widget_0': (context) => const error_widget_0.MyApp(),
  'gesture_detector_0': (context) => const gesture_detector_0.MyApp(),
  'gesture_detector_1': (context) => const gesture_detector_1.MyApp(),
  'gesture_detector_2': (context) => const gesture_detector_2.NestedGestureDetectorsApp(),

  'hero_0': (context) => const hero_0.HeroApp(),
  'hero_1': (context) => const hero_1.HeroApp(),
  'image_error_builder_0': (context) => const image_error_builder_0.MyApp(),
  'image_frame_builder_0': (context) => const image_frame_builder_0.MyApp(),
  'image_loading_builder_0': (context) => const image_loading_builder_0.MyApp(),
  'animated_align_0': (context) => const animated_align_0.MyApp(),
  'animated_container_0': (context) => const animated_container_0.MyApp(),
  'animated_fractionally_sized_box_0': (context) => const animated_fractionally_sized_box_0.MyApp(),
  'animated_padding_0': (context) => const animated_padding_0.MyApp(),
  'animated_positioned_0': (context) => const animated_positioned_0.MyApp(),
  'animated_slide_0': (context) => const animated_slide_0.MyApp(),
  'sliver_animated_opacity_0': (context) => const sliver_animated_opacity_0.MyApp(),

  'inherited_model_0': (context) => const inherited_model_0.InheritedModelApp(),
  'inherited_notifier_0': (context) => const inherited_notifier_0.MyApp(),
  'inherited_theme_0': (context) => const inherited_theme_0.MyApp(),
  'interactive_viewer_0': (context) => const interactive_viewer_0.MyApp(),

  'interactive_viewer_builder_0': (context) => const interactive_viewer_builder_0.IVBuilderExampleApp(),
  'interactive_viewer_constrained_0': (context) => const interactive_viewer_constrained_0.MyApp(),
  'interactive_viewer_transformation_controller_0': (context) => const interactive_viewer_transformation_controller_0.MyApp(),
  'layout_builder_0': (context) => const layout_builder_0.MyApp(),
  'media_query_data_system_gesture_insets_0': (context) => const media_query_data_system_gesture_insets_0.MyApp(),
  'navigator_0': (context) => const navigator_0.MyApp(),
  'navigator_restorable_push_0': (context) => const navigator_restorable_push_0.MyApp(),
  'navigator_restorable_push_and_remove_until_0': (context) => const navigator_restorable_push_and_remove_until_0.MyApp(),
  'navigator_restorable_push_replacement_0': (context) => const navigator_restorable_push_replacement_0.MyApp(),
  'navigator_state_restorable_push_0': (context) => const navigator_state_restorable_push_0.MyApp(),
  'navigator_state_restorable_push_and_remove_until_0': (context) => const navigator_state_restorable_push_and_remove_until_0.MyApp(),
  'navigator_state_restorable_push_replacement_0': (context) => const navigator_state_restorable_push_replacement_0.MyApp(),
  'restorable_route_future_0': (context) => const restorable_route_future_0.MyApp(),
  'nested_scroll_view_0': (context) => const nested_scroll_view_0.MyApp(),
  'nested_scroll_view_1': (context) => const nested_scroll_view_1.MyApp(),
  'nested_scroll_view_2': (context) => const nested_scroll_view_2.MyApp(),
  'nested_scroll_view_state_0': (context) => const nested_scroll_view_state_0.MyApp(),
  'notification_0': (context) => const notification_0.MyApp(),
  'overflow_bar_0': (context) => const overflow_bar_0.MyApp(),
  'glowing_overscroll_indicator_0': (context) => const glowing_overscroll_indicator_0.MyApp(),
  'glowing_overscroll_indicator_1': (context) => const glowing_overscroll_indicator_1.MyApp(),
  'page_storage_0': (context) => const page_storage_0.MyApp(),
  'page_view_0': (context) => const page_view_0.MyApp(),
  'preferred_size_0': (context) => const preferred_size_0.MyApp(),

  'restoration_mixin_0': (context) => const restoration_mixin_0.RestorationExampleApp(),
  'restorable_value_0': (context) => const restorable_value_0.MyApp(),
  'show_general_dialog_0': (context) => const show_general_dialog_0.MyApp(),

  'scroll_metrics_notification_0': (context) => const scroll_metrics_notification_0.ScrollMetricsDemo(),
  'custom_scroll_view_1': (context) => const custom_scroll_view_1.MyApp(),
  'listview_select_1': (context) => const listview_select_1.MyApp(),
  'raw_scrollbar_0': (context) => const raw_scrollbar_0.MyApp(),
  'raw_scrollbar_1': (context) => const raw_scrollbar_1.MyApp(),
  'raw_scrollbar_2': (context) => const raw_scrollbar_2.MyApp(),
  'raw_scrollbar_shape_0': (context) => const raw_scrollbar_shape_0.MyApp(),

  'shared_app_data_0': (context) => const shared_app_data_0.Home(),
  'shared_app_data_1': (context) => const shared_app_data_1.Home(),
  'character_activator_0': (context) => const character_activator_0.MyApp(),
  'logical_key_set_0': (context) => const logical_key_set_0.MyApp(),
  'shortcuts_0': (context) => const shortcuts_0.MyApp(),
  'shortcuts_1': (context) => const shortcuts_1.MyApp(),
  'single_activator_single_activator_0': (context) => const single_activator_single_activator_0.MyApp(),
  'single_child_scroll_view_0': (context) => const single_child_scroll_view_0.MyApp(),
  'single_child_scroll_view_1': (context) => const single_child_scroll_view_1.MyApp(),
  'sliver_fill_remaining_0': (context) => const sliver_fill_remaining_0.MyApp(),
  'sliver_fill_remaining_1': (context) => const sliver_fill_remaining_1.MyApp(),
  'sliver_fill_remaining_2': (context) => const sliver_fill_remaining_2.MyApp(),
  'sliver_fill_remaining_3': (context) => const sliver_fill_remaining_3.MyApp(),

  'slotted_multi_child_render_object_widget_mixin_0': (context) => const slotted_multi_child_render_object_widget_mixin_0.ExampleWidget(),
  'table_0': (context) => const table_0.MyApp(),
  'align_transition_0': (context) => const align_transition_0.MyApp(),
  'animated_builder_0': (context) => const animated_builder_0.MyApp(),
  'animated_widget_0': (context) => const animated_widget_0.MyApp(),
  'decorated_box_transition_0': (context) => const decorated_box_transition_0.MyApp(),
  'default_text_style_transition_0': (context) => const default_text_style_transition_0.MyApp(),
  'fade_transition_0': (context) => const fade_transition_0.MyApp(),
  'positioned_transition_0': (context) => const positioned_transition_0.MyApp(),
  'relative_positioned_transition_0': (context) => const relative_positioned_transition_0.MyApp(),
  'rotation_transition_0': (context) => const rotation_transition_0.MyApp(),
  'scale_transition_0': (context) => const scale_transition_0.MyApp(),
  'size_transition_0': (context) => const size_transition_0.MyApp(),
  'slide_transition_0': (context) => const slide_transition_0.MyApp(),
  'sliver_fade_transition_0': (context) => const sliver_fade_transition_0.MyApp(),
  'tween_animation_builder_0': (context) => const tween_animation_builder_0.MyApp(),
  'will_pop_scope_0': (context) => const will_pop_scope_0.MyApp(),
};

void main() {
  // runApp(MyApp());
  runApp(MB.MyApp(routes: routesMap));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MB.MyApp(routes: routesMap);
  }
}
