
import 'package:flutter/material.dart';

import 'package:flutter_api_samples/widgets/actions/action_listener.0.dart' as action_listener_0;
import 'package:flutter_api_samples/widgets/actions/actions.0.dart' as actions_0;
import 'package:flutter_api_samples/widgets/actions/focusable_action_detector.0.dart' as focusable_action_detector_0;
import 'package:flutter_api_samples/widgets/animated_size/animated_size.0.dart' as animated_size_0;
import 'package:flutter_api_samples/widgets/animated_switcher/animated_switcher.0.dart' as animated_switcher_0;
import 'package:flutter_api_samples/widgets/app/widgets_app.widgets_app.0.dart' as widgets_app_widgets_app_0;
import 'package:flutter_api_samples/widgets/app_lifecycle_listener/app_lifecycle_listener.0.dart' as app_lifecycle_listener_0;
import 'package:flutter_api_samples/widgets/app_lifecycle_listener/app_lifecycle_listener.1.dart' as app_lifecycle_listener_1;
import 'package:flutter_api_samples/widgets/async/future_builder.0.dart' as future_builder_0;
import 'package:flutter_api_samples/widgets/async/stream_builder.0.dart' as stream_builder_0;
import 'package:flutter_api_samples/widgets/autocomplete/raw_autocomplete.0.dart' as raw_autocomplete_0;
import 'package:flutter_api_samples/widgets/autocomplete/raw_autocomplete.1.dart' as raw_autocomplete_1;
import 'package:flutter_api_samples/widgets/autocomplete/raw_autocomplete.2.dart' as raw_autocomplete_2;
import 'package:flutter_api_samples/widgets/autocomplete/raw_autocomplete.focus_node.0.dart' as raw_autocomplete_focus_node_0;
import 'package:flutter_api_samples/widgets/autofill/autofill_group.0.dart' as autofill_group_0;
import 'package:flutter_api_samples/widgets/basic/absorb_pointer.0.dart' as absorb_pointer_0;
import 'package:flutter_api_samples/widgets/basic/aspect_ratio.0.dart' as aspect_ratio_0;
import 'package:flutter_api_samples/widgets/basic/aspect_ratio.1.dart' as aspect_ratio_1;
import 'package:flutter_api_samples/widgets/basic/aspect_ratio.2.dart' as aspect_ratio_2;
import 'package:flutter_api_samples/widgets/basic/clip_rrect.0.dart' as clip_rrect_0;
import 'package:flutter_api_samples/widgets/basic/clip_rrect.1.dart' as clip_rrect_1;
import 'package:flutter_api_samples/widgets/basic/custom_multi_child_layout.0.dart' as custom_multi_child_layout_0;
import 'package:flutter_api_samples/widgets/basic/expanded.0.dart' as expanded_0;
import 'package:flutter_api_samples/widgets/basic/expanded.1.dart' as expanded_1;
import 'package:flutter_api_samples/widgets/basic/fitted_box.0.dart' as fitted_box_0;
import 'package:flutter_api_samples/widgets/basic/flow.0.dart' as flow_0;
import 'package:flutter_api_samples/widgets/basic/fractionally_sized_box.0.dart' as fractionally_sized_box_0;
import 'package:flutter_api_samples/widgets/basic/ignore_pointer.0.dart' as ignore_pointer_0;
import 'package:flutter_api_samples/widgets/basic/indexed_stack.0.dart' as indexed_stack_0;
import 'package:flutter_api_samples/widgets/basic/listener.0.dart' as listener_0;
import 'package:flutter_api_samples/widgets/basic/mouse_region.0.dart' as mouse_region_0;
import 'package:flutter_api_samples/widgets/basic/mouse_region.on_exit.0.dart' as mouse_region_on_exit_0;
import 'package:flutter_api_samples/widgets/basic/mouse_region.on_exit.1.dart' as mouse_region_on_exit_1;
import 'package:flutter_api_samples/widgets/basic/offstage.0.dart' as offstage_0;
import 'package:flutter_api_samples/widgets/basic/overflowbox.0.dart' as overflowbox_0;
import 'package:flutter_api_samples/widgets/basic/physical_shape.0.dart' as physical_shape_0;
import 'package:flutter_api_samples/widgets/binding/widget_binding_observer.0.dart' as widget_binding_observer_0;
import 'package:flutter_api_samples/widgets/color_filter/color_filtered.0.dart' as color_filtered_0;
import 'package:flutter_api_samples/widgets/dismissible/dismissible.0.dart' as dismissible_0;
import 'package:flutter_api_samples/widgets/drag_target/draggable.0.dart' as draggable_0;
import 'package:flutter_api_samples/widgets/editable_text/editable_text.on_changed.0.dart' as editable_text_on_changed_0;
import 'package:flutter_api_samples/widgets/editable_text/editable_text.on_content_inserted.0.dart' as editable_text_on_content_inserted_0;
import 'package:flutter_api_samples/widgets/editable_text/text_editing_controller.0.dart' as text_editing_controller_0;
import 'package:flutter_api_samples/widgets/focus_manager/focus_node.0.dart' as focus_node_0;
import 'package:flutter_api_samples/widgets/focus_manager/focus_node.unfocus.0.dart' as focus_node_unfocus_0;
import 'package:flutter_api_samples/widgets/focus_scope/focus.0.dart' as focus_0;
import 'package:flutter_api_samples/widgets/focus_scope/focus.1.dart' as focus_1;
import 'package:flutter_api_samples/widgets/focus_scope/focus.2.dart' as focus_2;
import 'package:flutter_api_samples/widgets/focus_scope/focus_scope.0.dart' as focus_scope_0;
import 'package:flutter_api_samples/widgets/focus_traversal/focus_traversal_group.0.dart' as focus_traversal_group_0;
import 'package:flutter_api_samples/widgets/focus_traversal/ordered_traversal_policy.0.dart' as ordered_traversal_policy_0;
import 'package:flutter_api_samples/widgets/form/form.0.dart' as form_0;
import 'package:flutter_api_samples/widgets/form/form.1.dart' as form_1;
import 'package:flutter_api_samples/widgets/framework/error_widget.0.dart' as error_widget_0;
import 'package:flutter_api_samples/widgets/gesture_detector/gesture_detector.0.dart' as gesture_detector_0;
import 'package:flutter_api_samples/widgets/gesture_detector/gesture_detector.1.dart' as gesture_detector_1;
import 'package:flutter_api_samples/widgets/gesture_detector/gesture_detector.2.dart' as gesture_detector_2;
import 'package:flutter_api_samples/widgets/heroes/hero.0.dart' as hero_0;
import 'package:flutter_api_samples/widgets/heroes/hero.1.dart' as hero_1;
import 'package:flutter_api_samples/widgets/image/image.error_builder.0.dart' as image_error_builder_0;
import 'package:flutter_api_samples/widgets/image/image.frame_builder.0.dart' as image_frame_builder_0;
import 'package:flutter_api_samples/widgets/image/image.loading_builder.0.dart' as image_loading_builder_0;
import 'package:flutter_api_samples/widgets/implicit_animations/animated_align.0.dart' as animated_align_0;
import 'package:flutter_api_samples/widgets/implicit_animations/animated_container.0.dart' as animated_container_0;
import 'package:flutter_api_samples/widgets/implicit_animations/animated_fractionally_sized_box.0.dart' as animated_fractionally_sized_box_0;
import 'package:flutter_api_samples/widgets/implicit_animations/animated_padding.0.dart' as animated_padding_0;
import 'package:flutter_api_samples/widgets/implicit_animations/animated_positioned.0.dart' as animated_positioned_0;
import 'package:flutter_api_samples/widgets/implicit_animations/animated_slide.0.dart' as animated_slide_0;
import 'package:flutter_api_samples/widgets/implicit_animations/sliver_animated_opacity.0.dart' as sliver_animated_opacity_0;
import 'package:flutter_api_samples/widgets/inherited_model/inherited_model.0.dart' as inherited_model_0;
import 'package:flutter_api_samples/widgets/inherited_notifier/inherited_notifier.0.dart' as inherited_notifier_0;
import 'package:flutter_api_samples/widgets/inherited_theme/inherited_theme.0.dart' as inherited_theme_0;
import 'package:flutter_api_samples/widgets/interactive_viewer/interactive_viewer.0.dart' as interactive_viewer_0;
import 'package:flutter_api_samples/widgets/interactive_viewer/interactive_viewer.builder.0.dart' as interactive_viewer_builder_0;
import 'package:flutter_api_samples/widgets/interactive_viewer/interactive_viewer.constrained.0.dart' as interactive_viewer_constrained_0;
import 'package:flutter_api_samples/widgets/interactive_viewer/interactive_viewer.transformation_controller.0.dart' as interactive_viewer_transformation_controller_0;
import 'package:flutter_api_samples/widgets/layout_builder/layout_builder.0.dart' as layout_builder_0;
import 'package:flutter_api_samples/widgets/magnifier/magnifier.0.dart' as magnifier_0;
import 'package:flutter_api_samples/widgets/media_query/media_query_data.system_gesture_insets.0.dart' as media_query_data_system_gesture_insets_0;
import 'package:flutter_api_samples/widgets/navigator/navigator.0.dart' as navigator_0;
import 'package:flutter_api_samples/widgets/navigator/navigator.restorable_push.0.dart' as navigator_restorable_push_0;
import 'package:flutter_api_samples/widgets/navigator/navigator.restorable_push_and_remove_until.0.dart' as navigator_restorable_push_and_remove_until_0;
import 'package:flutter_api_samples/widgets/navigator/navigator.restorable_push_replacement.0.dart' as navigator_restorable_push_replacement_0;
import 'package:flutter_api_samples/widgets/navigator/navigator_state.restorable_push.0.dart' as navigator_state_restorable_push_0;
import 'package:flutter_api_samples/widgets/navigator/navigator_state.restorable_push_and_remove_until.0.dart' as navigator_state_restorable_push_and_remove_until_0;
import 'package:flutter_api_samples/widgets/navigator/navigator_state.restorable_push_replacement.0.dart' as navigator_state_restorable_push_replacement_0;
import 'package:flutter_api_samples/widgets/navigator/restorable_route_future.0.dart' as restorable_route_future_0;
import 'package:flutter_api_samples/widgets/navigator_pop_handler/navigator_pop_handler.0.dart' as navigator_pop_handler_0;
import 'package:flutter_api_samples/widgets/navigator_pop_handler/navigator_pop_handler.1.dart' as navigator_pop_handler_1;
import 'package:flutter_api_samples/widgets/nested_scroll_view/nested_scroll_view.0.dart' as nested_scroll_view_0;
import 'package:flutter_api_samples/widgets/nested_scroll_view/nested_scroll_view.1.dart' as nested_scroll_view_1;
import 'package:flutter_api_samples/widgets/nested_scroll_view/nested_scroll_view.2.dart' as nested_scroll_view_2;
import 'package:flutter_api_samples/widgets/nested_scroll_view/nested_scroll_view_state.0.dart' as nested_scroll_view_state_0;
import 'package:flutter_api_samples/widgets/notification_listener/notification.0.dart' as notification_0;
import 'package:flutter_api_samples/widgets/overflow_bar/overflow_bar.0.dart' as overflow_bar_0;
import 'package:flutter_api_samples/widgets/overlay/overlay.0.dart' as overlay_0;
import 'package:flutter_api_samples/widgets/overlay/overlay_portal.0.dart' as overlay_portal_0;
import 'package:flutter_api_samples/widgets/overscroll_indicator/glowing_overscroll_indicator.0.dart' as glowing_overscroll_indicator_0;
import 'package:flutter_api_samples/widgets/overscroll_indicator/glowing_overscroll_indicator.1.dart' as glowing_overscroll_indicator_1;
import 'package:flutter_api_samples/widgets/page_storage/page_storage.0.dart' as page_storage_0;
import 'package:flutter_api_samples/widgets/page_view/page_view.0.dart' as page_view_0;
import 'package:flutter_api_samples/widgets/pop_scope/pop_scope.0.dart' as pop_scope_0;
import 'package:flutter_api_samples/widgets/preferred_size/preferred_size.0.dart' as preferred_size_0;
import 'package:flutter_api_samples/widgets/restoration/restoration_mixin.0.dart' as restoration_mixin_0;
import 'package:flutter_api_samples/widgets/restoration_properties/restorable_value.0.dart' as restorable_value_0;
import 'package:flutter_api_samples/widgets/routes/popup_route.0.dart' as popup_route_0;
import 'package:flutter_api_samples/widgets/routes/show_general_dialog.0.dart' as show_general_dialog_0;
import 'package:flutter_api_samples/widgets/scroll_notification_observer/scroll_notification_observer.0.dart' as scroll_notification_observer_0;
import 'package:flutter_api_samples/widgets/scroll_view/custom_scroll_view.1.dart' as custom_scroll_view_1;
import 'package:flutter_api_samples/widgets/scroll_view/grid_view.0.dart' as grid_view_0;
import 'package:flutter_api_samples/widgets/scroll_view/list_view.0.dart' as list_view_0;
import 'package:flutter_api_samples/widgets/scrollbar/raw_scrollbar.0.dart' as raw_scrollbar_0;
import 'package:flutter_api_samples/widgets/scrollbar/raw_scrollbar.1.dart' as raw_scrollbar_1;
import 'package:flutter_api_samples/widgets/scrollbar/raw_scrollbar.2.dart' as raw_scrollbar_2;
import 'package:flutter_api_samples/widgets/scrollbar/raw_scrollbar.desktop.0.dart' as raw_scrollbar_desktop_0;
import 'package:flutter_api_samples/widgets/scrollbar/raw_scrollbar.shape.0.dart' as raw_scrollbar_shape_0;
import 'package:flutter_api_samples/widgets/shortcuts/callback_shortcuts.0.dart' as callback_shortcuts_0;
import 'package:flutter_api_samples/widgets/shortcuts/character_activator.0.dart' as character_activator_0;
import 'package:flutter_api_samples/widgets/shortcuts/logical_key_set.0.dart' as logical_key_set_0;
import 'package:flutter_api_samples/widgets/shortcuts/shortcuts.0.dart' as shortcuts_0;
import 'package:flutter_api_samples/widgets/shortcuts/shortcuts.1.dart' as shortcuts_1;
import 'package:flutter_api_samples/widgets/shortcuts/single_activator.single_activator.0.dart' as single_activator_single_activator_0;
import 'package:flutter_api_samples/widgets/single_child_scroll_view/single_child_scroll_view.0.dart' as single_child_scroll_view_0;
import 'package:flutter_api_samples/widgets/single_child_scroll_view/single_child_scroll_view.1.dart' as single_child_scroll_view_1;
import 'package:flutter_api_samples/widgets/sliver/decorated_sliver.0.dart' as decorated_sliver_0;
import 'package:flutter_api_samples/widgets/sliver/sliver_constrained_cross_axis.0.dart' as sliver_constrained_cross_axis_0;
import 'package:flutter_api_samples/widgets/sliver/sliver_cross_axis_group.0.dart' as sliver_cross_axis_group_0;
import 'package:flutter_api_samples/widgets/sliver/sliver_main_axis_group.0.dart' as sliver_main_axis_group_0;
import 'package:flutter_api_samples/widgets/sliver/sliver_opacity.1.dart' as sliver_opacity_1;
import 'package:flutter_api_samples/widgets/sliver_fill/sliver_fill_remaining.0.dart' as sliver_fill_remaining_0;
import 'package:flutter_api_samples/widgets/sliver_fill/sliver_fill_remaining.1.dart' as sliver_fill_remaining_1;
import 'package:flutter_api_samples/widgets/sliver_fill/sliver_fill_remaining.2.dart' as sliver_fill_remaining_2;
import 'package:flutter_api_samples/widgets/sliver_fill/sliver_fill_remaining.3.dart' as sliver_fill_remaining_3;
import 'package:flutter_api_samples/widgets/table/table.0.dart' as table_0;
import 'package:flutter_api_samples/widgets/tap_region/text_field_tap_region.0.dart' as text_field_tap_region_0;
import 'package:flutter_api_samples/widgets/text/text.0.dart' as text_0;
import 'package:flutter_api_samples/widgets/text_magnifier/text_magnifier.0.dart' as text_magnifier_0;
import 'package:flutter_api_samples/widgets/transitions/align_transition.0.dart' as align_transition_0;
import 'package:flutter_api_samples/widgets/transitions/animated_builder.0.dart' as animated_builder_0;
import 'package:flutter_api_samples/widgets/transitions/animated_widget.0.dart' as animated_widget_0;
import 'package:flutter_api_samples/widgets/transitions/decorated_box_transition.0.dart' as decorated_box_transition_0;
import 'package:flutter_api_samples/widgets/transitions/default_text_style_transition.0.dart' as default_text_style_transition_0;
import 'package:flutter_api_samples/widgets/transitions/fade_transition.0.dart' as fade_transition_0;
import 'package:flutter_api_samples/widgets/transitions/listenable_builder.0.dart' as listenable_builder_0;
import 'package:flutter_api_samples/widgets/transitions/listenable_builder.1.dart' as listenable_builder_1;
import 'package:flutter_api_samples/widgets/transitions/listenable_builder.2.dart' as listenable_builder_2;
import 'package:flutter_api_samples/widgets/transitions/listenable_builder.3.dart' as listenable_builder_3;
import 'package:flutter_api_samples/widgets/transitions/matrix_transition.0.dart' as matrix_transition_0;
import 'package:flutter_api_samples/widgets/transitions/positioned_transition.0.dart' as positioned_transition_0;
import 'package:flutter_api_samples/widgets/transitions/relative_positioned_transition.0.dart' as relative_positioned_transition_0;
import 'package:flutter_api_samples/widgets/transitions/rotation_transition.0.dart' as rotation_transition_0;
import 'package:flutter_api_samples/widgets/transitions/scale_transition.0.dart' as scale_transition_0;
import 'package:flutter_api_samples/widgets/transitions/size_transition.0.dart' as size_transition_0;
import 'package:flutter_api_samples/widgets/transitions/slide_transition.0.dart' as slide_transition_0;
import 'package:flutter_api_samples/widgets/transitions/sliver_fade_transition.0.dart' as sliver_fade_transition_0;
import 'package:flutter_api_samples/widgets/tween_animation_builder/tween_animation_builder.0.dart' as tween_animation_builder_0;
import 'package:flutter_api_samples/widgets/undo_history/undo_history_controller.0.dart' as undo_history_controller_0;


Map<String, WidgetBuilder> routesMap = <String, WidgetBuilder> {
  'action_listener_0': (context) => const action_listener_0.ActionListenerExampleApp(), 
  'actions_0': (context) => const actions_0.ActionsExampleApp(), 
  'focusable_action_detector_0': (context) => const focusable_action_detector_0.FocusableActionDetectorExampleApp(), 
  'animated_size_0': (context) => const animated_size_0.AnimatedSizeExampleApp(), 
  'animated_switcher_0': (context) => const animated_switcher_0.AnimatedSwitcherExampleApp(), 
  'widgets_app_widgets_app_0': (context) => const widgets_app_widgets_app_0.WidgetsAppExampleApp(), 
  'app_lifecycle_listener_0': (context) => const app_lifecycle_listener_0.AppLifecycleListenerExample(), 
  'app_lifecycle_listener_1': (context) => const app_lifecycle_listener_1.AppLifecycleListenerExample(), 
  'future_builder_0': (context) => const future_builder_0.FutureBuilderExampleApp(), 
  'stream_builder_0': (context) => const stream_builder_0.StreamBuilderExampleApp(), 
  'raw_autocomplete_0': (context) => const raw_autocomplete_0.AutocompleteExampleApp(), 
  'raw_autocomplete_1': (context) => const raw_autocomplete_1.AutocompleteExampleApp(), 
  'raw_autocomplete_2': (context) => const raw_autocomplete_2.AutocompleteExampleApp(), 
  'raw_autocomplete_focus_node_0': (context) => const raw_autocomplete_focus_node_0.AutocompleteExampleApp(), 
  'autofill_group_0': (context) => const autofill_group_0.AutofillGroupExampleApp(), 
  'absorb_pointer_0': (context) => const absorb_pointer_0.AbsorbPointerApp(), 
  'aspect_ratio_0': (context) => const aspect_ratio_0.AspectRatioApp(), 
  'aspect_ratio_1': (context) => const aspect_ratio_1.AspectRatioApp(), 
  'aspect_ratio_2': (context) => const aspect_ratio_2.AspectRatioApp(), 
  'clip_rrect_0': (context) => const clip_rrect_0.ClipRRectApp(), 
  'clip_rrect_1': (context) => const clip_rrect_1.ClipRRectApp(), 
  'custom_multi_child_layout_0': (context) => const custom_multi_child_layout_0.CustomMultiChildLayoutApp(), 
  'expanded_0': (context) => const expanded_0.ExpandedApp(), 
  'expanded_1': (context) => const expanded_1.ExpandedApp(), 
  'fitted_box_0': (context) => const fitted_box_0.FittedBoxApp(), 
  'flow_0': (context) => const flow_0.FlowApp(), 
  'fractionally_sized_box_0': (context) => const fractionally_sized_box_0.FractionallySizedBoxApp(), 
  'ignore_pointer_0': (context) => const ignore_pointer_0.IgnorePointerApp(), 
  'indexed_stack_0': (context) => const indexed_stack_0.IndexedStackApp(), 
  'listener_0': (context) => const listener_0.ListenerApp(), 
  'mouse_region_0': (context) => const mouse_region_0.MouseRegionApp(), 
  'mouse_region_on_exit_0': (context) => const mouse_region_on_exit_0.MouseRegionApp(), 
  'mouse_region_on_exit_1': (context) => const mouse_region_on_exit_1.MouseRegionApp(), 
  'offstage_0': (context) => const offstage_0.OffstageApp(), 
  'overflowbox_0': (context) => const overflowbox_0.OverflowBoxApp(), 
  'physical_shape_0': (context) => const physical_shape_0.PhysicalShapeApp(), 
  'widget_binding_observer_0': (context) => const widget_binding_observer_0.WidgetBindingObserverExampleApp(), 
  'color_filtered_0': (context) => const color_filtered_0.ColorFilteredExampleApp(), 
  'dismissible_0': (context) => const dismissible_0.DismissibleExampleApp(), 
  'draggable_0': (context) => const draggable_0.DraggableExampleApp(), 
  'editable_text_on_changed_0': (context) => const editable_text_on_changed_0.OnChangedExampleApp(), 
  'editable_text_on_content_inserted_0': (context) => const editable_text_on_content_inserted_0.KeyboardInsertedContentApp(), 
  'text_editing_controller_0': (context) => const text_editing_controller_0.TextEditingControllerExampleApp(), 
  'focus_node_0': (context) => const focus_node_0.FocusNodeExampleApp(), 
  'focus_node_unfocus_0': (context) => const focus_node_unfocus_0.UnfocusExampleApp(), 
  'focus_0': (context) => const focus_0.FocusExampleApp(), 
  'focus_1': (context) => const focus_1.FocusExampleApp(), 
  'focus_2': (context) => const focus_2.FocusExampleApp(), 
  'focus_scope_0': (context) => const focus_scope_0.FocusScopeExampleApp(), 
  'focus_traversal_group_0': (context) => const focus_traversal_group_0.FocusTraversalGroupExampleApp(), 
  'ordered_traversal_policy_0': (context) => const ordered_traversal_policy_0.OrderedTraversalPolicyExampleApp(), 
  'form_0': (context) => const form_0.FormExampleApp(), 
  'form_1': (context) => const form_1.FormApp(), 
  'error_widget_0': (context) => const error_widget_0.ErrorWidgetExampleApp(), 
  'gesture_detector_0': (context) => const gesture_detector_0.GestureDetectorExampleApp(), 
  'gesture_detector_1': (context) => const gesture_detector_1.GestureDetectorExampleApp(), 
  'gesture_detector_2': (context) => const gesture_detector_2.NestedGestureDetectorsApp(), 
  'hero_0': (context) => const hero_0.HeroApp(), 
  'hero_1': (context) => const hero_1.HeroApp(), 
  'image_error_builder_0': (context) => const image_error_builder_0.ErrorBuilderExampleApp(), 
  'image_frame_builder_0': (context) => const image_frame_builder_0.FrameBuilderExampleApp(), 
  'image_loading_builder_0': (context) => const image_loading_builder_0.LoadingBuilderExampleApp(), 
  'animated_align_0': (context) => const animated_align_0.AnimatedAlignExampleApp(), 
  'animated_container_0': (context) => const animated_container_0.AnimatedContainerExampleApp(), 
  'animated_fractionally_sized_box_0': (context) => const animated_fractionally_sized_box_0.AnimatedFractionallySizedBoxExampleApp(), 
  'animated_padding_0': (context) => const animated_padding_0.AnimatedPaddingExampleApp(), 
  'animated_positioned_0': (context) => const animated_positioned_0.AnimatedPositionedExampleApp(), 
  'animated_slide_0': (context) => const animated_slide_0.AnimatedSlideApp(), 
  'sliver_animated_opacity_0': (context) => const sliver_animated_opacity_0.SliverAnimatedOpacityExampleApp(), 
  'inherited_model_0': (context) => const inherited_model_0.InheritedModelApp(), 
  'inherited_notifier_0': (context) => const inherited_notifier_0.InheritedNotifierExampleApp(), 
  'inherited_theme_0': (context) => const inherited_theme_0.InheritedThemeExampleApp(), 
  'interactive_viewer_0': (context) => const interactive_viewer_0.InteractiveViewerExampleApp(), 
  'interactive_viewer_builder_0': (context) => const interactive_viewer_builder_0.IVBuilderExampleApp(), 
  'interactive_viewer_constrained_0': (context) => const interactive_viewer_constrained_0.ConstrainedExampleApp(), 
  'interactive_viewer_transformation_controller_0': (context) => const interactive_viewer_transformation_controller_0.TransformationControllerExampleApp(), 
  'layout_builder_0': (context) => const layout_builder_0.LayoutBuilderExampleApp(), 
  'magnifier_0': (context) => const magnifier_0.MagnifierExampleApp(), 
  'media_query_data_system_gesture_insets_0': (context) => const media_query_data_system_gesture_insets_0.SystemGestureInsetsExampleApp(), 
  'navigator_0': (context) => const navigator_0.NavigatorExampleApp(), 
  'navigator_restorable_push_0': (context) => const navigator_restorable_push_0.RestorablePushExampleApp(), 
  'navigator_restorable_push_and_remove_until_0': (context) => const navigator_restorable_push_and_remove_until_0.RestorablePushAndRemoveUntilExampleApp(), 
  'navigator_restorable_push_replacement_0': (context) => const navigator_restorable_push_replacement_0.RestorablePushReplacementExampleApp(), 
  'navigator_state_restorable_push_0': (context) => const navigator_state_restorable_push_0.RestorablePushExampleApp(), 
  'navigator_state_restorable_push_and_remove_until_0': (context) => const navigator_state_restorable_push_and_remove_until_0.RestorablePushAndRemoveUntilExampleApp(), 
  'navigator_state_restorable_push_replacement_0': (context) => const navigator_state_restorable_push_replacement_0.RestorablePushReplacementExampleApp(), 
  'restorable_route_future_0': (context) => const restorable_route_future_0.RestorableRouteFutureExampleApp(), 
  'navigator_pop_handler_0': (context) => const navigator_pop_handler_0.NavigatorPopHandlerApp(), 
  'navigator_pop_handler_1': (context) => const navigator_pop_handler_1.NavigatorPopHandlerApp(), 
  'nested_scroll_view_0': (context) => const nested_scroll_view_0.NestedScrollViewExampleApp(), 
  'nested_scroll_view_1': (context) => const nested_scroll_view_1.NestedScrollViewExampleApp(), 
  'nested_scroll_view_2': (context) => const nested_scroll_view_2.NestedScrollViewExampleApp(), 
  'nested_scroll_view_state_0': (context) => const nested_scroll_view_state_0.NestedScrollViewStateExampleApp(), 
  'notification_0': (context) => const notification_0.NotificationExampleApp(), 
  'overflow_bar_0': (context) => const overflow_bar_0.OverflowBarExampleApp(), 
  'overlay_0': (context) => const overlay_0.OverlayApp(), 
  'overlay_portal_0': (context) => const overlay_portal_0.OverlayPortalExampleApp(), 
  'glowing_overscroll_indicator_0': (context) => const glowing_overscroll_indicator_0.GlowingOverscrollIndicatorExampleApp(), 
  'glowing_overscroll_indicator_1': (context) => const glowing_overscroll_indicator_1.GlowingOverscrollIndicatorExampleApp(), 
  'page_storage_0': (context) => const page_storage_0.PageStorageExampleApp(), 
  'page_view_0': (context) => const page_view_0.PageViewExampleApp(), 
  'pop_scope_0': (context) => const pop_scope_0.NavigatorPopHandlerApp(), 
  'preferred_size_0': (context) => const preferred_size_0.PreferredSizeExampleApp(), 
  'restoration_mixin_0': (context) => const restoration_mixin_0.RestorationExampleApp(), 
  'restorable_value_0': (context) => const restorable_value_0.RestorableValueExampleApp(), 
  'popup_route_0': (context) => const popup_route_0.PopupRouteApp(), 
  'show_general_dialog_0': (context) => const show_general_dialog_0.GeneralDialogApp(), 
  'scroll_notification_observer_0': (context) => const scroll_notification_observer_0.ScrollNotificationObserverApp(), 
  'custom_scroll_view_1': (context) => const custom_scroll_view_1.CustomScrollViewExampleApp(), 
  'grid_view_0': (context) => const grid_view_0.GridViewExampleApp(), 
  'list_view_0': (context) => const list_view_0.ListViewExampleApp(), 
  'raw_scrollbar_0': (context) => const raw_scrollbar_0.RawScrollbarExampleApp(), 
  'raw_scrollbar_1': (context) => const raw_scrollbar_1.RawScrollbarExampleApp(), 
  'raw_scrollbar_2': (context) => const raw_scrollbar_2.RawScrollbarExampleApp(), 
  'raw_scrollbar_desktop_0': (context) => const raw_scrollbar_desktop_0.ScrollbarApp(), 
  'raw_scrollbar_shape_0': (context) => const raw_scrollbar_shape_0.ShapeExampleApp(), 
  'callback_shortcuts_0': (context) => const callback_shortcuts_0.CallbackShortcutsApp(), 
  'character_activator_0': (context) => const character_activator_0.CharacterActivatorExampleApp(), 
  'logical_key_set_0': (context) => const logical_key_set_0.LogicalKeySetExampleApp(), 
  'shortcuts_0': (context) => const shortcuts_0.ShortcutsExampleApp(), 
  'shortcuts_1': (context) => const shortcuts_1.ShortcutsExampleApp(), 
  'single_activator_single_activator_0': (context) => const single_activator_single_activator_0.SingleActivatorExampleApp(), 
  'single_child_scroll_view_0': (context) => const single_child_scroll_view_0.SingleChildScrollViewExampleApp(), 
  'single_child_scroll_view_1': (context) => const single_child_scroll_view_1.SingleChildScrollViewExampleApp(), 
  'decorated_sliver_0': (context) => const decorated_sliver_0.SliverDecorationExampleApp(), 
  'sliver_constrained_cross_axis_0': (context) => const sliver_constrained_cross_axis_0.SliverConstrainedCrossAxisExampleApp(), 
  'sliver_cross_axis_group_0': (context) => const sliver_cross_axis_group_0.SliverCrossAxisGroupExampleApp(), 
  'sliver_main_axis_group_0': (context) => const sliver_main_axis_group_0.SliverMainAxisGroupExampleApp(), 
  'sliver_opacity_1': (context) => const sliver_opacity_1.SliverOpacityExampleApp(), 
  'sliver_fill_remaining_0': (context) => const sliver_fill_remaining_0.SliverFillRemainingExampleApp(), 
  'sliver_fill_remaining_1': (context) => const sliver_fill_remaining_1.SliverFillRemainingExampleApp(), 
  'sliver_fill_remaining_2': (context) => const sliver_fill_remaining_2.SliverFillRemainingExampleApp(), 
  'sliver_fill_remaining_3': (context) => const sliver_fill_remaining_3.SliverFillRemainingExampleApp(), 
  'table_0': (context) => const table_0.TableExampleApp(), 
  'text_field_tap_region_0': (context) => const text_field_tap_region_0.TapRegionApp(), 
  'text_0': (context) => const text_0.DefaultTextStyleApp(), 
  'text_magnifier_0': (context) => const text_magnifier_0.TextMagnifierExampleApp(text: 'Text Magnifier Example',), 
  'align_transition_0': (context) => const align_transition_0.AlignTransitionExampleApp(), 
  'animated_builder_0': (context) => const animated_builder_0.AnimatedBuilderExampleApp(), 
  'animated_widget_0': (context) => const animated_widget_0.AnimatedWidgetExampleApp(), 
  'decorated_box_transition_0': (context) => const decorated_box_transition_0.DecoratedBoxTransitionExampleApp(), 
  'default_text_style_transition_0': (context) => const default_text_style_transition_0.DefaultTextStyleTransitionExampleApp(), 
  'fade_transition_0': (context) => const fade_transition_0.FadeTransitionExampleApp(), 
  'listenable_builder_0': (context) => const listenable_builder_0.ListenableBuilderExample(), 
  'listenable_builder_1': (context) => const listenable_builder_1.ListenableBuilderExample(), 
  'listenable_builder_2': (context) => const listenable_builder_2.ListenableBuilderExample(), 
  'listenable_builder_3': (context) => const listenable_builder_3.ListenableBuilderExample(), 
  'matrix_transition_0': (context) => const matrix_transition_0.MatrixTransitionExampleApp(), 
  'positioned_transition_0': (context) => const positioned_transition_0.PositionedTransitionExampleApp(), 
  'relative_positioned_transition_0': (context) => const relative_positioned_transition_0.RelativePositionedTransitionExampleApp(), 
  'rotation_transition_0': (context) => const rotation_transition_0.RotationTransitionExampleApp(), 
  'scale_transition_0': (context) => const scale_transition_0.ScaleTransitionExampleApp(), 
  'size_transition_0': (context) => const size_transition_0.SizeTransitionExampleApp(), 
  'slide_transition_0': (context) => const slide_transition_0.SlideTransitionExampleApp(), 
  'sliver_fade_transition_0': (context) => const sliver_fade_transition_0.SliverFadeTransitionExampleApp(), 
  'tween_animation_builder_0': (context) => const tween_animation_builder_0.TweenAnimationBuilderExampleApp(), 
  'undo_history_controller_0': (context) => const undo_history_controller_0.UndoHistoryControllerExampleApp(), 
};