/*
  Warnings:

  - You are about to drop the `Burhan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `auth_totp_device` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `auth_totp_wizard` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_document_layout` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_enable_profiling_wizard` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_import_import` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_import_mapping` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_import_module` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_language_export` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_language_import` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_language_install` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_module_uninstall` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_module_update` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_module_upgrade` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_partner_merge_automatic_wizard` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_partner_merge_automatic_wizard_res_partner_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `base_partner_merge_line` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `bus_bus` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `bus_presence` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `change_password_own` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `change_password_user` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `change_password_wizard` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `decimal_precision` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `iap_account` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `iap_account_info` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `iap_account_res_company_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_client` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_report_xml` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_server` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_server_group_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_server_webhook_field_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_url` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_window` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_window_group_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_act_window_view` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_actions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_actions_todo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_asset` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_attachment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_config_parameter` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_cron` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_cron_trigger` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_default` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_demo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_demo_failure` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_demo_failure_wizard` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_exports` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_exports_line` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_filters` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_logging` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_mail_server` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_access` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_constraint` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_data` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_fields` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_fields_group_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_fields_selection` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_inherit` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_model_relation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_module_category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_module_module` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_module_module_dependency` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_module_module_exclusion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_profile` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_property` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_rule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_sequence` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_sequence_date_range` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_ui_menu` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_ui_menu_group_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_ui_view` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_ui_view_custom` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ir_ui_view_group_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `rel_modules_langexport` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `rel_server_actions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `report_layout` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `report_paperformat` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_bank` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_company` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_company_users_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_config` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_config_installer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_config_settings` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_country` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_country_group` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_country_res_country_group_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_country_state` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_currency` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_currency_rate` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_groups` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_groups_implied_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_groups_report_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_groups_users_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_lang` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_lang_install_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_partner` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_partner_bank` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_partner_category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_partner_industry` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_partner_res_partner_category_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_partner_title` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_users` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_users_apikeys` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_users_apikeys_description` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_users_deletion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_users_identitycheck` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_users_log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `res_users_settings` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `reset_view_arch_wizard` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `rule_group_rel` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `web_editor_converter_test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `web_editor_converter_test_sub` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `web_tour_tour` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `wizard_ir_model_menu_create` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "auth_totp_device" DROP CONSTRAINT "auth_totp_device_user_id_fkey";

-- DropForeignKey
ALTER TABLE "auth_totp_wizard" DROP CONSTRAINT "auth_totp_wizard_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "auth_totp_wizard" DROP CONSTRAINT "auth_totp_wizard_user_id_fkey";

-- DropForeignKey
ALTER TABLE "auth_totp_wizard" DROP CONSTRAINT "auth_totp_wizard_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_document_layout" DROP CONSTRAINT "base_document_layout_company_id_fkey";

-- DropForeignKey
ALTER TABLE "base_document_layout" DROP CONSTRAINT "base_document_layout_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_document_layout" DROP CONSTRAINT "base_document_layout_report_layout_id_fkey";

-- DropForeignKey
ALTER TABLE "base_document_layout" DROP CONSTRAINT "base_document_layout_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_enable_profiling_wizard" DROP CONSTRAINT "base_enable_profiling_wizard_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_enable_profiling_wizard" DROP CONSTRAINT "base_enable_profiling_wizard_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_import_import" DROP CONSTRAINT "base_import_import_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_import_import" DROP CONSTRAINT "base_import_import_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_import_mapping" DROP CONSTRAINT "base_import_mapping_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_import_mapping" DROP CONSTRAINT "base_import_mapping_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_import_module" DROP CONSTRAINT "base_import_module_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_import_module" DROP CONSTRAINT "base_import_module_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_language_export" DROP CONSTRAINT "base_language_export_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_language_export" DROP CONSTRAINT "base_language_export_model_id_fkey";

-- DropForeignKey
ALTER TABLE "base_language_export" DROP CONSTRAINT "base_language_export_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_language_import" DROP CONSTRAINT "base_language_import_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_language_import" DROP CONSTRAINT "base_language_import_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_language_install" DROP CONSTRAINT "base_language_install_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_language_install" DROP CONSTRAINT "base_language_install_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_module_uninstall" DROP CONSTRAINT "base_module_uninstall_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_module_uninstall" DROP CONSTRAINT "base_module_uninstall_module_id_fkey";

-- DropForeignKey
ALTER TABLE "base_module_uninstall" DROP CONSTRAINT "base_module_uninstall_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_module_update" DROP CONSTRAINT "base_module_update_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_module_update" DROP CONSTRAINT "base_module_update_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_module_upgrade" DROP CONSTRAINT "base_module_upgrade_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_module_upgrade" DROP CONSTRAINT "base_module_upgrade_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" DROP CONSTRAINT "base_partner_merge_automatic_wizard_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" DROP CONSTRAINT "base_partner_merge_automatic_wizard_current_line_id_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" DROP CONSTRAINT "base_partner_merge_automatic_wizard_dst_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" DROP CONSTRAINT "base_partner_merge_automatic_wizard_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard_res_partner_rel" DROP CONSTRAINT "base_partner_merge_automatic__base_partner_merge_automatic_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard_res_partner_rel" DROP CONSTRAINT "base_partner_merge_automatic_wizard_res_par_res_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_line" DROP CONSTRAINT "base_partner_merge_line_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_line" DROP CONSTRAINT "base_partner_merge_line_wizard_id_fkey";

-- DropForeignKey
ALTER TABLE "base_partner_merge_line" DROP CONSTRAINT "base_partner_merge_line_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "bus_bus" DROP CONSTRAINT "bus_bus_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "bus_bus" DROP CONSTRAINT "bus_bus_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "bus_presence" DROP CONSTRAINT "bus_presence_user_id_fkey";

-- DropForeignKey
ALTER TABLE "change_password_own" DROP CONSTRAINT "change_password_own_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "change_password_own" DROP CONSTRAINT "change_password_own_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "change_password_user" DROP CONSTRAINT "change_password_user_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "change_password_user" DROP CONSTRAINT "change_password_user_user_id_fkey";

-- DropForeignKey
ALTER TABLE "change_password_user" DROP CONSTRAINT "change_password_user_wizard_id_fkey";

-- DropForeignKey
ALTER TABLE "change_password_user" DROP CONSTRAINT "change_password_user_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "change_password_wizard" DROP CONSTRAINT "change_password_wizard_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "change_password_wizard" DROP CONSTRAINT "change_password_wizard_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "decimal_precision" DROP CONSTRAINT "decimal_precision_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "decimal_precision" DROP CONSTRAINT "decimal_precision_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "iap_account" DROP CONSTRAINT "iap_account_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "iap_account" DROP CONSTRAINT "iap_account_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "iap_account_info" DROP CONSTRAINT "iap_account_info_account_id_fkey";

-- DropForeignKey
ALTER TABLE "iap_account_info" DROP CONSTRAINT "iap_account_info_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "iap_account_info" DROP CONSTRAINT "iap_account_info_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "iap_account_res_company_rel" DROP CONSTRAINT "iap_account_res_company_rel_iap_account_id_fkey";

-- DropForeignKey
ALTER TABLE "iap_account_res_company_rel" DROP CONSTRAINT "iap_account_res_company_rel_res_company_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_client" DROP CONSTRAINT "ir_act_client_binding_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_client" DROP CONSTRAINT "ir_act_client_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_client" DROP CONSTRAINT "ir_act_client_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_report_xml" DROP CONSTRAINT "ir_act_report_xml_binding_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_report_xml" DROP CONSTRAINT "ir_act_report_xml_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_report_xml" DROP CONSTRAINT "ir_act_report_xml_paperformat_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_report_xml" DROP CONSTRAINT "ir_act_report_xml_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_binding_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_crud_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_link_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_selection_value_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_update_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_update_related_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server" DROP CONSTRAINT "ir_act_server_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server_group_rel" DROP CONSTRAINT "ir_act_server_group_rel_act_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server_group_rel" DROP CONSTRAINT "ir_act_server_group_rel_gid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server_webhook_field_rel" DROP CONSTRAINT "ir_act_server_webhook_field_rel_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_server_webhook_field_rel" DROP CONSTRAINT "ir_act_server_webhook_field_rel_server_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_url" DROP CONSTRAINT "ir_act_url_binding_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_url" DROP CONSTRAINT "ir_act_url_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_url" DROP CONSTRAINT "ir_act_url_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window" DROP CONSTRAINT "ir_act_window_binding_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window" DROP CONSTRAINT "ir_act_window_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window" DROP CONSTRAINT "ir_act_window_search_view_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window" DROP CONSTRAINT "ir_act_window_view_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window" DROP CONSTRAINT "ir_act_window_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window_group_rel" DROP CONSTRAINT "ir_act_window_group_rel_act_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window_group_rel" DROP CONSTRAINT "ir_act_window_group_rel_gid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window_view" DROP CONSTRAINT "ir_act_window_view_act_window_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window_view" DROP CONSTRAINT "ir_act_window_view_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window_view" DROP CONSTRAINT "ir_act_window_view_view_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_act_window_view" DROP CONSTRAINT "ir_act_window_view_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_actions" DROP CONSTRAINT "ir_actions_binding_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_actions" DROP CONSTRAINT "ir_actions_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_actions" DROP CONSTRAINT "ir_actions_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_actions_todo" DROP CONSTRAINT "ir_actions_todo_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_actions_todo" DROP CONSTRAINT "ir_actions_todo_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_asset" DROP CONSTRAINT "ir_asset_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_asset" DROP CONSTRAINT "ir_asset_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_attachment" DROP CONSTRAINT "ir_attachment_company_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_attachment" DROP CONSTRAINT "ir_attachment_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_attachment" DROP CONSTRAINT "ir_attachment_original_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_attachment" DROP CONSTRAINT "ir_attachment_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_config_parameter" DROP CONSTRAINT "ir_config_parameter_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_config_parameter" DROP CONSTRAINT "ir_config_parameter_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_cron" DROP CONSTRAINT "ir_cron_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_cron" DROP CONSTRAINT "ir_cron_ir_actions_server_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_cron" DROP CONSTRAINT "ir_cron_user_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_cron" DROP CONSTRAINT "ir_cron_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_cron_trigger" DROP CONSTRAINT "ir_cron_trigger_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_cron_trigger" DROP CONSTRAINT "ir_cron_trigger_cron_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_cron_trigger" DROP CONSTRAINT "ir_cron_trigger_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_default" DROP CONSTRAINT "ir_default_company_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_default" DROP CONSTRAINT "ir_default_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_default" DROP CONSTRAINT "ir_default_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_default" DROP CONSTRAINT "ir_default_user_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_default" DROP CONSTRAINT "ir_default_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo" DROP CONSTRAINT "ir_demo_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo" DROP CONSTRAINT "ir_demo_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo_failure" DROP CONSTRAINT "ir_demo_failure_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo_failure" DROP CONSTRAINT "ir_demo_failure_module_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo_failure" DROP CONSTRAINT "ir_demo_failure_wizard_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo_failure" DROP CONSTRAINT "ir_demo_failure_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo_failure_wizard" DROP CONSTRAINT "ir_demo_failure_wizard_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_demo_failure_wizard" DROP CONSTRAINT "ir_demo_failure_wizard_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_exports" DROP CONSTRAINT "ir_exports_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_exports" DROP CONSTRAINT "ir_exports_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_exports_line" DROP CONSTRAINT "ir_exports_line_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_exports_line" DROP CONSTRAINT "ir_exports_line_export_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_exports_line" DROP CONSTRAINT "ir_exports_line_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_filters" DROP CONSTRAINT "ir_filters_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_filters" DROP CONSTRAINT "ir_filters_user_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_filters" DROP CONSTRAINT "ir_filters_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_mail_server" DROP CONSTRAINT "ir_mail_server_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_mail_server" DROP CONSTRAINT "ir_mail_server_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model" DROP CONSTRAINT "ir_model_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model" DROP CONSTRAINT "ir_model_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_access" DROP CONSTRAINT "ir_model_access_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_access" DROP CONSTRAINT "ir_model_access_group_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_access" DROP CONSTRAINT "ir_model_access_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_access" DROP CONSTRAINT "ir_model_access_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_constraint" DROP CONSTRAINT "ir_model_constraint_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_constraint" DROP CONSTRAINT "ir_model_constraint_model_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_constraint" DROP CONSTRAINT "ir_model_constraint_module_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_constraint" DROP CONSTRAINT "ir_model_constraint_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_data" DROP CONSTRAINT "ir_model_data_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_data" DROP CONSTRAINT "ir_model_data_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields" DROP CONSTRAINT "ir_model_fields_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields" DROP CONSTRAINT "ir_model_fields_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields" DROP CONSTRAINT "ir_model_fields_related_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields" DROP CONSTRAINT "ir_model_fields_relation_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields" DROP CONSTRAINT "ir_model_fields_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields_group_rel" DROP CONSTRAINT "ir_model_fields_group_rel_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields_group_rel" DROP CONSTRAINT "ir_model_fields_group_rel_group_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields_selection" DROP CONSTRAINT "ir_model_fields_selection_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields_selection" DROP CONSTRAINT "ir_model_fields_selection_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_fields_selection" DROP CONSTRAINT "ir_model_fields_selection_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_inherit" DROP CONSTRAINT "ir_model_inherit_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_inherit" DROP CONSTRAINT "ir_model_inherit_parent_field_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_inherit" DROP CONSTRAINT "ir_model_inherit_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_relation" DROP CONSTRAINT "ir_model_relation_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_relation" DROP CONSTRAINT "ir_model_relation_model_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_relation" DROP CONSTRAINT "ir_model_relation_module_fkey";

-- DropForeignKey
ALTER TABLE "ir_model_relation" DROP CONSTRAINT "ir_model_relation_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_category" DROP CONSTRAINT "ir_module_category_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_category" DROP CONSTRAINT "ir_module_category_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_category" DROP CONSTRAINT "ir_module_category_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_module" DROP CONSTRAINT "ir_module_module_category_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_module" DROP CONSTRAINT "ir_module_module_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_module" DROP CONSTRAINT "ir_module_module_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_module_dependency" DROP CONSTRAINT "ir_module_module_dependency_module_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_module_exclusion" DROP CONSTRAINT "ir_module_module_exclusion_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_module_exclusion" DROP CONSTRAINT "ir_module_module_exclusion_module_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_module_module_exclusion" DROP CONSTRAINT "ir_module_module_exclusion_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_property" DROP CONSTRAINT "ir_property_company_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_property" DROP CONSTRAINT "ir_property_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_property" DROP CONSTRAINT "ir_property_fields_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_property" DROP CONSTRAINT "ir_property_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_rule" DROP CONSTRAINT "ir_rule_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_rule" DROP CONSTRAINT "ir_rule_model_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_rule" DROP CONSTRAINT "ir_rule_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_sequence" DROP CONSTRAINT "ir_sequence_company_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_sequence" DROP CONSTRAINT "ir_sequence_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_sequence" DROP CONSTRAINT "ir_sequence_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_sequence_date_range" DROP CONSTRAINT "ir_sequence_date_range_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_sequence_date_range" DROP CONSTRAINT "ir_sequence_date_range_sequence_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_sequence_date_range" DROP CONSTRAINT "ir_sequence_date_range_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_menu" DROP CONSTRAINT "ir_ui_menu_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_menu" DROP CONSTRAINT "ir_ui_menu_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_menu" DROP CONSTRAINT "ir_ui_menu_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_menu_group_rel" DROP CONSTRAINT "ir_ui_menu_group_rel_gid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_menu_group_rel" DROP CONSTRAINT "ir_ui_menu_group_rel_menu_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view" DROP CONSTRAINT "ir_ui_view_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view" DROP CONSTRAINT "ir_ui_view_inherit_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view" DROP CONSTRAINT "ir_ui_view_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view_custom" DROP CONSTRAINT "ir_ui_view_custom_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view_custom" DROP CONSTRAINT "ir_ui_view_custom_ref_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view_custom" DROP CONSTRAINT "ir_ui_view_custom_user_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view_custom" DROP CONSTRAINT "ir_ui_view_custom_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view_group_rel" DROP CONSTRAINT "ir_ui_view_group_rel_group_id_fkey";

-- DropForeignKey
ALTER TABLE "ir_ui_view_group_rel" DROP CONSTRAINT "ir_ui_view_group_rel_view_id_fkey";

-- DropForeignKey
ALTER TABLE "rel_modules_langexport" DROP CONSTRAINT "rel_modules_langexport_module_id_fkey";

-- DropForeignKey
ALTER TABLE "rel_modules_langexport" DROP CONSTRAINT "rel_modules_langexport_wiz_id_fkey";

-- DropForeignKey
ALTER TABLE "rel_server_actions" DROP CONSTRAINT "rel_server_actions_action_id_fkey";

-- DropForeignKey
ALTER TABLE "rel_server_actions" DROP CONSTRAINT "rel_server_actions_server_id_fkey";

-- DropForeignKey
ALTER TABLE "report_layout" DROP CONSTRAINT "report_layout_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "report_layout" DROP CONSTRAINT "report_layout_view_id_fkey";

-- DropForeignKey
ALTER TABLE "report_layout" DROP CONSTRAINT "report_layout_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "report_paperformat" DROP CONSTRAINT "report_paperformat_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "report_paperformat" DROP CONSTRAINT "report_paperformat_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_bank" DROP CONSTRAINT "res_bank_country_fkey";

-- DropForeignKey
ALTER TABLE "res_bank" DROP CONSTRAINT "res_bank_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_bank" DROP CONSTRAINT "res_bank_state_fkey";

-- DropForeignKey
ALTER TABLE "res_bank" DROP CONSTRAINT "res_bank_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_company" DROP CONSTRAINT "res_company_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_company" DROP CONSTRAINT "res_company_currency_id_fkey";

-- DropForeignKey
ALTER TABLE "res_company" DROP CONSTRAINT "res_company_external_report_layout_id_fkey";

-- DropForeignKey
ALTER TABLE "res_company" DROP CONSTRAINT "res_company_paperformat_id_fkey";

-- DropForeignKey
ALTER TABLE "res_company" DROP CONSTRAINT "res_company_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "res_company" DROP CONSTRAINT "res_company_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "res_company" DROP CONSTRAINT "res_company_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_company_users_rel" DROP CONSTRAINT "res_company_users_rel_cid_fkey";

-- DropForeignKey
ALTER TABLE "res_company_users_rel" DROP CONSTRAINT "res_company_users_rel_user_id_fkey";

-- DropForeignKey
ALTER TABLE "res_config" DROP CONSTRAINT "res_config_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_config" DROP CONSTRAINT "res_config_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_config_installer" DROP CONSTRAINT "res_config_installer_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_config_installer" DROP CONSTRAINT "res_config_installer_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_config_settings" DROP CONSTRAINT "res_config_settings_company_id_fkey";

-- DropForeignKey
ALTER TABLE "res_config_settings" DROP CONSTRAINT "res_config_settings_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_config_settings" DROP CONSTRAINT "res_config_settings_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_country" DROP CONSTRAINT "res_country_address_view_id_fkey";

-- DropForeignKey
ALTER TABLE "res_country" DROP CONSTRAINT "res_country_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_country" DROP CONSTRAINT "res_country_currency_id_fkey";

-- DropForeignKey
ALTER TABLE "res_country" DROP CONSTRAINT "res_country_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_country_group" DROP CONSTRAINT "res_country_group_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_country_group" DROP CONSTRAINT "res_country_group_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_country_res_country_group_rel" DROP CONSTRAINT "res_country_res_country_group_rel_res_country_group_id_fkey";

-- DropForeignKey
ALTER TABLE "res_country_res_country_group_rel" DROP CONSTRAINT "res_country_res_country_group_rel_res_country_id_fkey";

-- DropForeignKey
ALTER TABLE "res_country_state" DROP CONSTRAINT "res_country_state_country_id_fkey";

-- DropForeignKey
ALTER TABLE "res_country_state" DROP CONSTRAINT "res_country_state_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_country_state" DROP CONSTRAINT "res_country_state_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_currency" DROP CONSTRAINT "res_currency_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_currency" DROP CONSTRAINT "res_currency_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_currency_rate" DROP CONSTRAINT "res_currency_rate_company_id_fkey";

-- DropForeignKey
ALTER TABLE "res_currency_rate" DROP CONSTRAINT "res_currency_rate_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_currency_rate" DROP CONSTRAINT "res_currency_rate_currency_id_fkey";

-- DropForeignKey
ALTER TABLE "res_currency_rate" DROP CONSTRAINT "res_currency_rate_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups" DROP CONSTRAINT "res_groups_category_id_fkey";

-- DropForeignKey
ALTER TABLE "res_groups" DROP CONSTRAINT "res_groups_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups" DROP CONSTRAINT "res_groups_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups_implied_rel" DROP CONSTRAINT "res_groups_implied_rel_gid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups_implied_rel" DROP CONSTRAINT "res_groups_implied_rel_hid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups_report_rel" DROP CONSTRAINT "res_groups_report_rel_gid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups_report_rel" DROP CONSTRAINT "res_groups_report_rel_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups_users_rel" DROP CONSTRAINT "res_groups_users_rel_gid_fkey";

-- DropForeignKey
ALTER TABLE "res_groups_users_rel" DROP CONSTRAINT "res_groups_users_rel_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_lang" DROP CONSTRAINT "res_lang_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_lang" DROP CONSTRAINT "res_lang_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_lang_install_rel" DROP CONSTRAINT "res_lang_install_rel_lang_id_fkey";

-- DropForeignKey
ALTER TABLE "res_lang_install_rel" DROP CONSTRAINT "res_lang_install_rel_language_wizard_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_commercial_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_company_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_country_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_industry_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_state_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_title_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_user_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner" DROP CONSTRAINT "res_partner_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_bank" DROP CONSTRAINT "res_partner_bank_bank_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_bank" DROP CONSTRAINT "res_partner_bank_company_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_bank" DROP CONSTRAINT "res_partner_bank_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_bank" DROP CONSTRAINT "res_partner_bank_currency_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_bank" DROP CONSTRAINT "res_partner_bank_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_bank" DROP CONSTRAINT "res_partner_bank_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_category" DROP CONSTRAINT "res_partner_category_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_category" DROP CONSTRAINT "res_partner_category_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_category" DROP CONSTRAINT "res_partner_category_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_industry" DROP CONSTRAINT "res_partner_industry_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_industry" DROP CONSTRAINT "res_partner_industry_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_res_partner_category_rel" DROP CONSTRAINT "res_partner_res_partner_category_rel_category_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_res_partner_category_rel" DROP CONSTRAINT "res_partner_res_partner_category_rel_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_title" DROP CONSTRAINT "res_partner_title_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_partner_title" DROP CONSTRAINT "res_partner_title_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users" DROP CONSTRAINT "res_users_company_id_fkey";

-- DropForeignKey
ALTER TABLE "res_users" DROP CONSTRAINT "res_users_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users" DROP CONSTRAINT "res_users_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "res_users" DROP CONSTRAINT "res_users_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_apikeys" DROP CONSTRAINT "res_users_apikeys_user_id_fkey";

-- DropForeignKey
ALTER TABLE "res_users_apikeys_description" DROP CONSTRAINT "res_users_apikeys_description_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_apikeys_description" DROP CONSTRAINT "res_users_apikeys_description_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_deletion" DROP CONSTRAINT "res_users_deletion_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_deletion" DROP CONSTRAINT "res_users_deletion_user_id_fkey";

-- DropForeignKey
ALTER TABLE "res_users_deletion" DROP CONSTRAINT "res_users_deletion_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_identitycheck" DROP CONSTRAINT "res_users_identitycheck_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_identitycheck" DROP CONSTRAINT "res_users_identitycheck_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_log" DROP CONSTRAINT "res_users_log_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_log" DROP CONSTRAINT "res_users_log_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_settings" DROP CONSTRAINT "res_users_settings_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "res_users_settings" DROP CONSTRAINT "res_users_settings_user_id_fkey";

-- DropForeignKey
ALTER TABLE "res_users_settings" DROP CONSTRAINT "res_users_settings_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "reset_view_arch_wizard" DROP CONSTRAINT "reset_view_arch_wizard_compare_view_id_fkey";

-- DropForeignKey
ALTER TABLE "reset_view_arch_wizard" DROP CONSTRAINT "reset_view_arch_wizard_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "reset_view_arch_wizard" DROP CONSTRAINT "reset_view_arch_wizard_view_id_fkey";

-- DropForeignKey
ALTER TABLE "reset_view_arch_wizard" DROP CONSTRAINT "reset_view_arch_wizard_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "rule_group_rel" DROP CONSTRAINT "rule_group_rel_group_id_fkey";

-- DropForeignKey
ALTER TABLE "rule_group_rel" DROP CONSTRAINT "rule_group_rel_rule_group_id_fkey";

-- DropForeignKey
ALTER TABLE "web_editor_converter_test" DROP CONSTRAINT "web_editor_converter_test_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "web_editor_converter_test" DROP CONSTRAINT "web_editor_converter_test_many2one_fkey";

-- DropForeignKey
ALTER TABLE "web_editor_converter_test" DROP CONSTRAINT "web_editor_converter_test_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "web_editor_converter_test_sub" DROP CONSTRAINT "web_editor_converter_test_sub_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "web_editor_converter_test_sub" DROP CONSTRAINT "web_editor_converter_test_sub_write_uid_fkey";

-- DropForeignKey
ALTER TABLE "web_tour_tour" DROP CONSTRAINT "web_tour_tour_user_id_fkey";

-- DropForeignKey
ALTER TABLE "wizard_ir_model_menu_create" DROP CONSTRAINT "wizard_ir_model_menu_create_create_uid_fkey";

-- DropForeignKey
ALTER TABLE "wizard_ir_model_menu_create" DROP CONSTRAINT "wizard_ir_model_menu_create_menu_id_fkey";

-- DropForeignKey
ALTER TABLE "wizard_ir_model_menu_create" DROP CONSTRAINT "wizard_ir_model_menu_create_write_uid_fkey";

-- DropTable
DROP TABLE "Burhan";

-- DropTable
DROP TABLE "auth_totp_device";

-- DropTable
DROP TABLE "auth_totp_wizard";

-- DropTable
DROP TABLE "base_document_layout";

-- DropTable
DROP TABLE "base_enable_profiling_wizard";

-- DropTable
DROP TABLE "base_import_import";

-- DropTable
DROP TABLE "base_import_mapping";

-- DropTable
DROP TABLE "base_import_module";

-- DropTable
DROP TABLE "base_language_export";

-- DropTable
DROP TABLE "base_language_import";

-- DropTable
DROP TABLE "base_language_install";

-- DropTable
DROP TABLE "base_module_uninstall";

-- DropTable
DROP TABLE "base_module_update";

-- DropTable
DROP TABLE "base_module_upgrade";

-- DropTable
DROP TABLE "base_partner_merge_automatic_wizard";

-- DropTable
DROP TABLE "base_partner_merge_automatic_wizard_res_partner_rel";

-- DropTable
DROP TABLE "base_partner_merge_line";

-- DropTable
DROP TABLE "bus_bus";

-- DropTable
DROP TABLE "bus_presence";

-- DropTable
DROP TABLE "change_password_own";

-- DropTable
DROP TABLE "change_password_user";

-- DropTable
DROP TABLE "change_password_wizard";

-- DropTable
DROP TABLE "decimal_precision";

-- DropTable
DROP TABLE "iap_account";

-- DropTable
DROP TABLE "iap_account_info";

-- DropTable
DROP TABLE "iap_account_res_company_rel";

-- DropTable
DROP TABLE "ir_act_client";

-- DropTable
DROP TABLE "ir_act_report_xml";

-- DropTable
DROP TABLE "ir_act_server";

-- DropTable
DROP TABLE "ir_act_server_group_rel";

-- DropTable
DROP TABLE "ir_act_server_webhook_field_rel";

-- DropTable
DROP TABLE "ir_act_url";

-- DropTable
DROP TABLE "ir_act_window";

-- DropTable
DROP TABLE "ir_act_window_group_rel";

-- DropTable
DROP TABLE "ir_act_window_view";

-- DropTable
DROP TABLE "ir_actions";

-- DropTable
DROP TABLE "ir_actions_todo";

-- DropTable
DROP TABLE "ir_asset";

-- DropTable
DROP TABLE "ir_attachment";

-- DropTable
DROP TABLE "ir_config_parameter";

-- DropTable
DROP TABLE "ir_cron";

-- DropTable
DROP TABLE "ir_cron_trigger";

-- DropTable
DROP TABLE "ir_default";

-- DropTable
DROP TABLE "ir_demo";

-- DropTable
DROP TABLE "ir_demo_failure";

-- DropTable
DROP TABLE "ir_demo_failure_wizard";

-- DropTable
DROP TABLE "ir_exports";

-- DropTable
DROP TABLE "ir_exports_line";

-- DropTable
DROP TABLE "ir_filters";

-- DropTable
DROP TABLE "ir_logging";

-- DropTable
DROP TABLE "ir_mail_server";

-- DropTable
DROP TABLE "ir_model";

-- DropTable
DROP TABLE "ir_model_access";

-- DropTable
DROP TABLE "ir_model_constraint";

-- DropTable
DROP TABLE "ir_model_data";

-- DropTable
DROP TABLE "ir_model_fields";

-- DropTable
DROP TABLE "ir_model_fields_group_rel";

-- DropTable
DROP TABLE "ir_model_fields_selection";

-- DropTable
DROP TABLE "ir_model_inherit";

-- DropTable
DROP TABLE "ir_model_relation";

-- DropTable
DROP TABLE "ir_module_category";

-- DropTable
DROP TABLE "ir_module_module";

-- DropTable
DROP TABLE "ir_module_module_dependency";

-- DropTable
DROP TABLE "ir_module_module_exclusion";

-- DropTable
DROP TABLE "ir_profile";

-- DropTable
DROP TABLE "ir_property";

-- DropTable
DROP TABLE "ir_rule";

-- DropTable
DROP TABLE "ir_sequence";

-- DropTable
DROP TABLE "ir_sequence_date_range";

-- DropTable
DROP TABLE "ir_ui_menu";

-- DropTable
DROP TABLE "ir_ui_menu_group_rel";

-- DropTable
DROP TABLE "ir_ui_view";

-- DropTable
DROP TABLE "ir_ui_view_custom";

-- DropTable
DROP TABLE "ir_ui_view_group_rel";

-- DropTable
DROP TABLE "rel_modules_langexport";

-- DropTable
DROP TABLE "rel_server_actions";

-- DropTable
DROP TABLE "report_layout";

-- DropTable
DROP TABLE "report_paperformat";

-- DropTable
DROP TABLE "res_bank";

-- DropTable
DROP TABLE "res_company";

-- DropTable
DROP TABLE "res_company_users_rel";

-- DropTable
DROP TABLE "res_config";

-- DropTable
DROP TABLE "res_config_installer";

-- DropTable
DROP TABLE "res_config_settings";

-- DropTable
DROP TABLE "res_country";

-- DropTable
DROP TABLE "res_country_group";

-- DropTable
DROP TABLE "res_country_res_country_group_rel";

-- DropTable
DROP TABLE "res_country_state";

-- DropTable
DROP TABLE "res_currency";

-- DropTable
DROP TABLE "res_currency_rate";

-- DropTable
DROP TABLE "res_groups";

-- DropTable
DROP TABLE "res_groups_implied_rel";

-- DropTable
DROP TABLE "res_groups_report_rel";

-- DropTable
DROP TABLE "res_groups_users_rel";

-- DropTable
DROP TABLE "res_lang";

-- DropTable
DROP TABLE "res_lang_install_rel";

-- DropTable
DROP TABLE "res_partner";

-- DropTable
DROP TABLE "res_partner_bank";

-- DropTable
DROP TABLE "res_partner_category";

-- DropTable
DROP TABLE "res_partner_industry";

-- DropTable
DROP TABLE "res_partner_res_partner_category_rel";

-- DropTable
DROP TABLE "res_partner_title";

-- DropTable
DROP TABLE "res_users";

-- DropTable
DROP TABLE "res_users_apikeys";

-- DropTable
DROP TABLE "res_users_apikeys_description";

-- DropTable
DROP TABLE "res_users_deletion";

-- DropTable
DROP TABLE "res_users_identitycheck";

-- DropTable
DROP TABLE "res_users_log";

-- DropTable
DROP TABLE "res_users_settings";

-- DropTable
DROP TABLE "reset_view_arch_wizard";

-- DropTable
DROP TABLE "rule_group_rel";

-- DropTable
DROP TABLE "web_editor_converter_test";

-- DropTable
DROP TABLE "web_editor_converter_test_sub";

-- DropTable
DROP TABLE "web_tour_tour";

-- DropTable
DROP TABLE "wizard_ir_model_menu_create";

-- CreateTable
CREATE TABLE "UserInteraction" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "interactionType" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserInteraction_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "UserInteraction" ADD CONSTRAINT "UserInteraction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserInteraction" ADD CONSTRAINT "UserInteraction_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
