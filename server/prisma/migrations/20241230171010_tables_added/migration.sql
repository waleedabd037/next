-- CreateTable
CREATE TABLE "Burhan" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "address" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Burhan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "imageID" TEXT NOT NULL,
    "productID" TEXT NOT NULL,
    "image" TEXT NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("imageID")
);

-- CreateTable
CREATE TABLE "auth_totp_device" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR NOT NULL,
    "user_id" INTEGER NOT NULL,
    "scope" VARCHAR,
    "index" VARCHAR(8),
    "key" VARCHAR,
    "create_date" TIMESTAMP(6) DEFAULT (now() AT TIME ZONE 'utc'::text),

    CONSTRAINT "auth_totp_device_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "auth_totp_wizard" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "secret" VARCHAR NOT NULL,
    "url" VARCHAR,
    "code" VARCHAR(7),
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "qrcode" BYTEA,

    CONSTRAINT "auth_totp_wizard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_document_layout" (
    "id" SERIAL NOT NULL,
    "company_id" INTEGER NOT NULL,
    "report_layout_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_document_layout_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_enable_profiling_wizard" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "duration" VARCHAR,
    "expiration" TIMESTAMP(6),
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_enable_profiling_wizard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_import_import" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "res_model" VARCHAR,
    "file_name" VARCHAR,
    "file_type" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "file" BYTEA,

    CONSTRAINT "base_import_import_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_import_mapping" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "res_model" VARCHAR,
    "column_name" VARCHAR,
    "field_name" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_import_mapping_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_import_module" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "state" VARCHAR,
    "import_message" TEXT,
    "modules_dependencies" TEXT,
    "force" BOOLEAN,
    "with_demo" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "module_file" BYTEA NOT NULL,

    CONSTRAINT "base_import_module_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_language_export" (
    "id" SERIAL NOT NULL,
    "model_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "lang" VARCHAR NOT NULL,
    "format" VARCHAR NOT NULL,
    "export_type" VARCHAR NOT NULL,
    "domain" VARCHAR,
    "state" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "data" BYTEA,

    CONSTRAINT "base_language_export_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_language_import" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "code" VARCHAR(6) NOT NULL,
    "filename" VARCHAR NOT NULL,
    "overwrite" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "data" BYTEA NOT NULL,

    CONSTRAINT "base_language_import_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_language_install" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "overwrite" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_language_install_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_module_uninstall" (
    "id" SERIAL NOT NULL,
    "module_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "show_all" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_module_uninstall_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_module_update" (
    "id" SERIAL NOT NULL,
    "updated" INTEGER,
    "added" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "state" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_module_update_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_module_upgrade" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "module_info" TEXT,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_module_upgrade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_partner_merge_automatic_wizard" (
    "id" SERIAL NOT NULL,
    "number_group" INTEGER,
    "current_line_id" INTEGER,
    "dst_partner_id" INTEGER,
    "maximum_group" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "state" VARCHAR NOT NULL,
    "group_by_email" BOOLEAN,
    "group_by_name" BOOLEAN,
    "group_by_is_company" BOOLEAN,
    "group_by_vat" BOOLEAN,
    "group_by_parent_id" BOOLEAN,
    "exclude_contact" BOOLEAN,
    "exclude_journal_item" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_partner_merge_automatic_wizard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "base_partner_merge_automatic_wizard_res_partner_rel" (
    "base_partner_merge_automatic_wizard_id" INTEGER NOT NULL,
    "res_partner_id" INTEGER NOT NULL,

    CONSTRAINT "base_partner_merge_automatic_wizard_res_partner_rel_pkey" PRIMARY KEY ("base_partner_merge_automatic_wizard_id","res_partner_id")
);

-- CreateTable
CREATE TABLE "base_partner_merge_line" (
    "id" SERIAL NOT NULL,
    "wizard_id" INTEGER,
    "min_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "aggr_ids" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "base_partner_merge_line_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bus_bus" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "channel" VARCHAR,
    "message" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "bus_bus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bus_presence" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "status" VARCHAR,
    "last_poll" TIMESTAMP(6),
    "last_presence" TIMESTAMP(6),

    CONSTRAINT "bus_presence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "change_password_own" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "new_password" VARCHAR,
    "confirm_password" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "change_password_own_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "change_password_user" (
    "id" SERIAL NOT NULL,
    "wizard_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "user_login" VARCHAR,
    "new_passwd" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "change_password_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "change_password_wizard" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "change_password_wizard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "decimal_precision" (
    "id" SERIAL NOT NULL,
    "digits" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "decimal_precision_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "iap_account" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "service_name" VARCHAR,
    "account_token" VARCHAR(43),
    "show_token" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "iap_account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "iap_account_info" (
    "id" SERIAL NOT NULL,
    "account_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "account_token" VARCHAR,
    "account_uuid_hashed" VARCHAR,
    "service_name" VARCHAR,
    "description" VARCHAR,
    "warning_email" VARCHAR,
    "unit_name" VARCHAR,
    "balance" DECIMAL,
    "warn_me" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "warning_threshold" DOUBLE PRECISION,

    CONSTRAINT "iap_account_info_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "iap_account_res_company_rel" (
    "iap_account_id" INTEGER NOT NULL,
    "res_company_id" INTEGER NOT NULL,

    CONSTRAINT "iap_account_res_company_rel_pkey" PRIMARY KEY ("iap_account_id","res_company_id")
);

-- CreateTable
CREATE TABLE "ir_act_client" (
    "id" SERIAL NOT NULL,
    "binding_model_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "type" VARCHAR NOT NULL,
    "binding_type" VARCHAR NOT NULL,
    "binding_view_types" VARCHAR,
    "name" JSONB NOT NULL,
    "help" JSONB,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "tag" VARCHAR NOT NULL,
    "target" VARCHAR,
    "res_model" VARCHAR,
    "context" VARCHAR NOT NULL,
    "params_store" BYTEA,

    CONSTRAINT "ir_act_client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_act_report_xml" (
    "id" SERIAL NOT NULL,
    "binding_model_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "type" VARCHAR NOT NULL,
    "binding_type" VARCHAR NOT NULL,
    "binding_view_types" VARCHAR,
    "name" JSONB NOT NULL,
    "help" JSONB,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "paperformat_id" INTEGER,
    "model" VARCHAR NOT NULL,
    "report_type" VARCHAR NOT NULL,
    "report_name" VARCHAR NOT NULL,
    "report_file" VARCHAR,
    "attachment" VARCHAR,
    "print_report_name" JSONB,
    "multi" BOOLEAN,
    "attachment_use" BOOLEAN,

    CONSTRAINT "ir_act_report_xml_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_act_server" (
    "id" SERIAL NOT NULL,
    "binding_model_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "type" VARCHAR NOT NULL,
    "binding_type" VARCHAR NOT NULL,
    "binding_view_types" VARCHAR,
    "name" JSONB NOT NULL,
    "help" JSONB,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "sequence" INTEGER,
    "model_id" INTEGER NOT NULL,
    "crud_model_id" INTEGER,
    "link_field_id" INTEGER,
    "update_field_id" INTEGER,
    "update_related_model_id" INTEGER,
    "selection_value" INTEGER,
    "usage" VARCHAR NOT NULL,
    "state" VARCHAR NOT NULL,
    "model_name" VARCHAR,
    "update_path" VARCHAR,
    "update_m2m_operation" VARCHAR,
    "update_boolean_value" VARCHAR,
    "evaluation_type" VARCHAR,
    "resource_ref" VARCHAR,
    "webhook_url" VARCHAR,
    "code" TEXT,
    "value" TEXT,

    CONSTRAINT "ir_act_server_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_act_server_group_rel" (
    "act_id" INTEGER NOT NULL,
    "gid" INTEGER NOT NULL,

    CONSTRAINT "ir_act_server_group_rel_pkey" PRIMARY KEY ("act_id","gid")
);

-- CreateTable
CREATE TABLE "ir_act_server_webhook_field_rel" (
    "server_id" INTEGER NOT NULL,
    "field_id" INTEGER NOT NULL,

    CONSTRAINT "ir_act_server_webhook_field_rel_pkey" PRIMARY KEY ("server_id","field_id")
);

-- CreateTable
CREATE TABLE "ir_act_url" (
    "id" SERIAL NOT NULL,
    "binding_model_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "type" VARCHAR NOT NULL,
    "binding_type" VARCHAR NOT NULL,
    "binding_view_types" VARCHAR,
    "name" JSONB NOT NULL,
    "help" JSONB,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "target" VARCHAR NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "ir_act_url_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_act_window" (
    "id" SERIAL NOT NULL,
    "binding_model_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "type" VARCHAR NOT NULL,
    "binding_type" VARCHAR NOT NULL,
    "binding_view_types" VARCHAR,
    "name" JSONB NOT NULL,
    "help" JSONB,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "view_id" INTEGER,
    "res_id" INTEGER,
    "limit" INTEGER,
    "search_view_id" INTEGER,
    "domain" VARCHAR,
    "context" VARCHAR NOT NULL,
    "res_model" VARCHAR NOT NULL,
    "target" VARCHAR,
    "view_mode" VARCHAR NOT NULL,
    "mobile_view_mode" VARCHAR,
    "usage" VARCHAR,
    "filter" BOOLEAN,

    CONSTRAINT "ir_act_window_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_act_window_group_rel" (
    "act_id" INTEGER NOT NULL,
    "gid" INTEGER NOT NULL,

    CONSTRAINT "ir_act_window_group_rel_pkey" PRIMARY KEY ("act_id","gid")
);

-- CreateTable
CREATE TABLE "ir_act_window_view" (
    "id" SERIAL NOT NULL,
    "sequence" INTEGER,
    "view_id" INTEGER,
    "act_window_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "view_mode" VARCHAR NOT NULL,
    "multi" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_act_window_view_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_actions" (
    "id" SERIAL NOT NULL,
    "binding_model_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "type" VARCHAR NOT NULL,
    "binding_type" VARCHAR NOT NULL,
    "binding_view_types" VARCHAR,
    "name" JSONB NOT NULL,
    "help" JSONB,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_actions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_actions_todo" (
    "id" SERIAL NOT NULL,
    "action_id" INTEGER NOT NULL,
    "sequence" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "state" VARCHAR NOT NULL,
    "name" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_actions_todo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_asset" (
    "id" SERIAL NOT NULL,
    "sequence" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "bundle" VARCHAR NOT NULL,
    "directive" VARCHAR,
    "path" VARCHAR NOT NULL,
    "target" VARCHAR,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_asset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_attachment" (
    "id" SERIAL NOT NULL,
    "res_id" INTEGER,
    "company_id" INTEGER,
    "file_size" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "res_model" VARCHAR,
    "res_field" VARCHAR,
    "type" VARCHAR NOT NULL,
    "url" VARCHAR(1024),
    "access_token" VARCHAR,
    "store_fname" VARCHAR,
    "checksum" VARCHAR(40),
    "mimetype" VARCHAR,
    "description" TEXT,
    "index_content" TEXT,
    "public" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "db_datas" BYTEA,
    "original_id" INTEGER,

    CONSTRAINT "ir_attachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_config_parameter" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "key" VARCHAR NOT NULL,
    "value" TEXT NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_config_parameter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_cron" (
    "id" SERIAL NOT NULL,
    "ir_actions_server_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "interval_number" INTEGER,
    "numbercall" INTEGER,
    "priority" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "cron_name" VARCHAR,
    "interval_type" VARCHAR,
    "active" BOOLEAN,
    "doall" BOOLEAN,
    "nextcall" TIMESTAMP(6) NOT NULL,
    "lastcall" TIMESTAMP(6),
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_cron_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_cron_trigger" (
    "id" SERIAL NOT NULL,
    "cron_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "call_at" TIMESTAMP(6),
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_cron_trigger_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_default" (
    "id" SERIAL NOT NULL,
    "field_id" INTEGER NOT NULL,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "condition" VARCHAR,
    "json_value" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_default_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_demo" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_demo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_demo_failure" (
    "id" SERIAL NOT NULL,
    "module_id" INTEGER NOT NULL,
    "wizard_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "error" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_demo_failure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_demo_failure_wizard" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_demo_failure_wizard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_exports" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "resource" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_exports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_exports_line" (
    "id" SERIAL NOT NULL,
    "export_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_exports_line_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_filters" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "action_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "model_id" VARCHAR NOT NULL,
    "domain" TEXT NOT NULL,
    "context" TEXT NOT NULL,
    "sort" TEXT NOT NULL,
    "is_default" BOOLEAN,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_filters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_logging" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "type" VARCHAR NOT NULL,
    "dbname" VARCHAR,
    "level" VARCHAR,
    "path" VARCHAR NOT NULL,
    "func" VARCHAR NOT NULL,
    "line" VARCHAR NOT NULL,
    "message" TEXT NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_logging_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_mail_server" (
    "id" SERIAL NOT NULL,
    "smtp_port" INTEGER,
    "sequence" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "from_filter" VARCHAR,
    "smtp_host" VARCHAR,
    "smtp_authentication" VARCHAR NOT NULL,
    "smtp_user" VARCHAR,
    "smtp_pass" VARCHAR,
    "smtp_encryption" VARCHAR NOT NULL,
    "smtp_debug" BOOLEAN,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "smtp_ssl_certificate" BYTEA,
    "smtp_ssl_private_key" BYTEA,

    CONSTRAINT "ir_mail_server_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "model" VARCHAR NOT NULL,
    "order" VARCHAR NOT NULL,
    "state" VARCHAR,
    "name" JSONB NOT NULL,
    "info" TEXT,
    "transient" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_model_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model_access" (
    "id" SERIAL NOT NULL,
    "model_id" INTEGER NOT NULL,
    "group_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "active" BOOLEAN,
    "perm_read" BOOLEAN,
    "perm_write" BOOLEAN,
    "perm_create" BOOLEAN,
    "perm_unlink" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_model_access_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model_constraint" (
    "id" SERIAL NOT NULL,
    "model" INTEGER NOT NULL,
    "module" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "definition" VARCHAR,
    "type" VARCHAR(1) NOT NULL,
    "message" JSONB,
    "write_date" TIMESTAMP(6),
    "create_date" TIMESTAMP(6),

    CONSTRAINT "ir_model_constraint_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model_data" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "create_date" TIMESTAMP(6) DEFAULT (now() AT TIME ZONE 'UTC'::text),
    "write_date" TIMESTAMP(6) DEFAULT (now() AT TIME ZONE 'UTC'::text),
    "write_uid" INTEGER,
    "res_id" INTEGER,
    "noupdate" BOOLEAN DEFAULT false,
    "name" VARCHAR NOT NULL,
    "module" VARCHAR NOT NULL,
    "model" VARCHAR NOT NULL,

    CONSTRAINT "ir_model_data_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model_fields" (
    "id" SERIAL NOT NULL,
    "relation_field_id" INTEGER,
    "model_id" INTEGER NOT NULL,
    "related_field_id" INTEGER,
    "size" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "complete_name" VARCHAR,
    "model" VARCHAR NOT NULL,
    "relation" VARCHAR,
    "relation_field" VARCHAR,
    "ttype" VARCHAR NOT NULL,
    "related" VARCHAR,
    "state" VARCHAR NOT NULL,
    "on_delete" VARCHAR,
    "domain" VARCHAR,
    "relation_table" VARCHAR,
    "column1" VARCHAR,
    "column2" VARCHAR,
    "depends" VARCHAR,
    "currency_field" VARCHAR,
    "field_description" JSONB NOT NULL,
    "help" JSONB,
    "compute" TEXT,
    "copied" BOOLEAN,
    "required" BOOLEAN,
    "readonly" BOOLEAN,
    "index" BOOLEAN,
    "translate" BOOLEAN,
    "group_expand" BOOLEAN,
    "selectable" BOOLEAN,
    "store" BOOLEAN,
    "sanitize" BOOLEAN,
    "sanitize_overridable" BOOLEAN,
    "sanitize_tags" BOOLEAN,
    "sanitize_attributes" BOOLEAN,
    "sanitize_style" BOOLEAN,
    "sanitize_form" BOOLEAN,
    "strip_style" BOOLEAN,
    "strip_classes" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_model_fields_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model_fields_group_rel" (
    "field_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "ir_model_fields_group_rel_pkey" PRIMARY KEY ("field_id","group_id")
);

-- CreateTable
CREATE TABLE "ir_model_fields_selection" (
    "id" SERIAL NOT NULL,
    "field_id" INTEGER NOT NULL,
    "sequence" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "value" VARCHAR NOT NULL,
    "name" JSONB NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_model_fields_selection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model_inherit" (
    "id" SERIAL NOT NULL,
    "model_id" INTEGER NOT NULL,
    "parent_id" INTEGER NOT NULL,
    "parent_field_id" INTEGER,

    CONSTRAINT "ir_model_inherit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_model_relation" (
    "id" SERIAL NOT NULL,
    "model" INTEGER NOT NULL,
    "module" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "write_date" TIMESTAMP(6),
    "create_date" TIMESTAMP(6),

    CONSTRAINT "ir_model_relation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_module_category" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "write_uid" INTEGER,
    "parent_id" INTEGER,
    "name" JSONB NOT NULL,
    "sequence" INTEGER,
    "description" JSONB,
    "visible" BOOLEAN,
    "exclusive" BOOLEAN,

    CONSTRAINT "ir_module_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_module_module" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "write_uid" INTEGER,
    "website" VARCHAR,
    "summary" JSONB,
    "name" VARCHAR NOT NULL,
    "author" VARCHAR,
    "icon" VARCHAR,
    "state" VARCHAR(16),
    "latest_version" VARCHAR,
    "shortdesc" JSONB,
    "category_id" INTEGER,
    "description" JSONB,
    "application" BOOLEAN DEFAULT false,
    "demo" BOOLEAN DEFAULT false,
    "web" BOOLEAN DEFAULT false,
    "license" VARCHAR(32),
    "sequence" INTEGER DEFAULT 100,
    "auto_install" BOOLEAN DEFAULT false,
    "to_buy" BOOLEAN DEFAULT false,
    "maintainer" VARCHAR,
    "published_version" VARCHAR,
    "url" VARCHAR,
    "contributors" TEXT,
    "menus_by_module" TEXT,
    "reports_by_module" TEXT,
    "views_by_module" TEXT,
    "module_type" VARCHAR,
    "imported" BOOLEAN,

    CONSTRAINT "ir_module_module_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_module_module_dependency" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR,
    "module_id" INTEGER,
    "auto_install_required" BOOLEAN DEFAULT true,

    CONSTRAINT "ir_module_module_dependency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_module_module_exclusion" (
    "id" SERIAL NOT NULL,
    "module_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_module_module_exclusion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_profile" (
    "id" SERIAL NOT NULL,
    "sql_count" INTEGER,
    "entry_count" INTEGER,
    "session" VARCHAR,
    "name" VARCHAR,
    "init_stack_trace" TEXT,
    "sql" TEXT,
    "traces_async" TEXT,
    "traces_sync" TEXT,
    "qweb" TEXT,
    "create_date" TIMESTAMP(6),
    "duration" DOUBLE PRECISION,

    CONSTRAINT "ir_profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_property" (
    "id" SERIAL NOT NULL,
    "company_id" INTEGER,
    "fields_id" INTEGER NOT NULL,
    "value_integer" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "res_id" VARCHAR,
    "value_reference" VARCHAR,
    "type" VARCHAR NOT NULL,
    "value_text" TEXT,
    "value_datetime" TIMESTAMP(6),
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "value_float" DOUBLE PRECISION,
    "value_binary" BYTEA,

    CONSTRAINT "ir_property_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_rule" (
    "id" SERIAL NOT NULL,
    "model_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "domain_force" TEXT,
    "active" BOOLEAN,
    "perm_read" BOOLEAN,
    "perm_write" BOOLEAN,
    "perm_create" BOOLEAN,
    "perm_unlink" BOOLEAN,
    "global" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_rule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_sequence" (
    "id" SERIAL NOT NULL,
    "number_next" INTEGER NOT NULL,
    "number_increment" INTEGER NOT NULL,
    "padding" INTEGER NOT NULL,
    "company_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "code" VARCHAR,
    "implementation" VARCHAR NOT NULL,
    "prefix" VARCHAR,
    "suffix" VARCHAR,
    "active" BOOLEAN,
    "use_date_range" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_sequence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_sequence_date_range" (
    "id" SERIAL NOT NULL,
    "sequence_id" INTEGER NOT NULL,
    "number_next" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "date_from" DATE NOT NULL,
    "date_to" DATE NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_sequence_date_range_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_ui_menu" (
    "id" SERIAL NOT NULL,
    "sequence" INTEGER,
    "parent_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "parent_path" VARCHAR,
    "web_icon" VARCHAR,
    "action" VARCHAR,
    "name" JSONB NOT NULL,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_ui_menu_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_ui_menu_group_rel" (
    "menu_id" INTEGER NOT NULL,
    "gid" INTEGER NOT NULL,

    CONSTRAINT "ir_ui_menu_group_rel_pkey" PRIMARY KEY ("menu_id","gid")
);

-- CreateTable
CREATE TABLE "ir_ui_view" (
    "id" SERIAL NOT NULL,
    "priority" INTEGER NOT NULL,
    "inherit_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "model" VARCHAR,
    "key" VARCHAR,
    "type" VARCHAR,
    "arch_fs" VARCHAR,
    "mode" VARCHAR NOT NULL,
    "arch_db" JSONB,
    "arch_prev" TEXT,
    "arch_updated" BOOLEAN,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_ui_view_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_ui_view_custom" (
    "id" SERIAL NOT NULL,
    "ref_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "arch" TEXT NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "ir_ui_view_custom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ir_ui_view_group_rel" (
    "view_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "ir_ui_view_group_rel_pkey" PRIMARY KEY ("view_id","group_id")
);

-- CreateTable
CREATE TABLE "rel_modules_langexport" (
    "wiz_id" INTEGER NOT NULL,
    "module_id" INTEGER NOT NULL,

    CONSTRAINT "rel_modules_langexport_pkey" PRIMARY KEY ("wiz_id","module_id")
);

-- CreateTable
CREATE TABLE "rel_server_actions" (
    "server_id" INTEGER NOT NULL,
    "action_id" INTEGER NOT NULL,

    CONSTRAINT "rel_server_actions_pkey" PRIMARY KEY ("server_id","action_id")
);

-- CreateTable
CREATE TABLE "report_layout" (
    "id" SERIAL NOT NULL,
    "view_id" INTEGER NOT NULL,
    "sequence" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "image" VARCHAR,
    "pdf" VARCHAR,
    "name" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "report_layout_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "report_paperformat" (
    "id" SERIAL NOT NULL,
    "page_height" INTEGER,
    "page_width" INTEGER,
    "header_spacing" INTEGER,
    "dpi" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "format" VARCHAR,
    "orientation" VARCHAR,
    "default" BOOLEAN,
    "header_line" BOOLEAN,
    "disable_shrinking" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "margin_top" DOUBLE PRECISION,
    "margin_bottom" DOUBLE PRECISION,
    "margin_left" DOUBLE PRECISION,
    "margin_right" DOUBLE PRECISION,

    CONSTRAINT "report_paperformat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_bank" (
    "id" SERIAL NOT NULL,
    "state" INTEGER,
    "country" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "street" VARCHAR,
    "street2" VARCHAR,
    "zip" VARCHAR,
    "city" VARCHAR,
    "email" VARCHAR,
    "phone" VARCHAR,
    "bic" VARCHAR,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_bank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_company" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR NOT NULL,
    "partner_id" INTEGER NOT NULL,
    "currency_id" INTEGER NOT NULL,
    "sequence" INTEGER,
    "create_date" TIMESTAMP(6),
    "parent_path" VARCHAR,
    "parent_id" INTEGER,
    "paperformat_id" INTEGER,
    "external_report_layout_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "email" VARCHAR,
    "phone" VARCHAR,
    "mobile" VARCHAR,
    "font" VARCHAR,
    "primary_color" VARCHAR,
    "secondary_color" VARCHAR,
    "layout_background" VARCHAR NOT NULL,
    "report_header" JSONB,
    "report_footer" JSONB,
    "company_details" JSONB,
    "active" BOOLEAN,
    "uses_default_logo" BOOLEAN,
    "write_date" TIMESTAMP(6),
    "logo_web" BYTEA,

    CONSTRAINT "res_company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_company_users_rel" (
    "cid" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "res_company_users_rel_pkey" PRIMARY KEY ("cid","user_id")
);

-- CreateTable
CREATE TABLE "res_config" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_config_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_config_installer" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_config_installer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_config_settings" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "web_app_name" VARCHAR,
    "company_id" INTEGER NOT NULL,
    "user_default_rights" BOOLEAN,
    "module_base_import" BOOLEAN,
    "module_google_calendar" BOOLEAN,
    "module_microsoft_calendar" BOOLEAN,
    "module_mail_plugin" BOOLEAN,
    "module_auth_oauth" BOOLEAN,
    "module_auth_ldap" BOOLEAN,
    "module_account_inter_company_rules" BOOLEAN,
    "module_voip" BOOLEAN,
    "module_web_unsplash" BOOLEAN,
    "module_partner_autocomplete" BOOLEAN,
    "module_base_geolocalize" BOOLEAN,
    "module_google_recaptcha" BOOLEAN,
    "module_website_cf_turnstile" BOOLEAN,
    "group_multi_currency" BOOLEAN,
    "show_effect" BOOLEAN,
    "module_product_images" BOOLEAN,
    "profiling_enabled_until" TIMESTAMP(6),
    "unsplash_access_key" VARCHAR,
    "unsplash_app_id" VARCHAR,

    CONSTRAINT "res_config_settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_country" (
    "id" SERIAL NOT NULL,
    "address_view_id" INTEGER,
    "currency_id" INTEGER,
    "phone_code" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "code" VARCHAR(2) NOT NULL,
    "name_position" VARCHAR,
    "name" JSONB NOT NULL,
    "vat_label" JSONB,
    "address_format" TEXT,
    "state_required" BOOLEAN,
    "zip_required" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_country_group" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" JSONB NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_country_group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_country_res_country_group_rel" (
    "res_country_id" INTEGER NOT NULL,
    "res_country_group_id" INTEGER NOT NULL,

    CONSTRAINT "res_country_res_country_group_rel_pkey" PRIMARY KEY ("res_country_id","res_country_group_id")
);

-- CreateTable
CREATE TABLE "res_country_state" (
    "id" SERIAL NOT NULL,
    "country_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "code" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_country_state_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_currency" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR NOT NULL,
    "symbol" VARCHAR NOT NULL,
    "decimal_places" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "full_name" VARCHAR,
    "position" VARCHAR,
    "currency_unit_label" VARCHAR,
    "currency_subunit_label" VARCHAR,
    "rounding" DECIMAL,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_currency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_currency_rate" (
    "id" SERIAL NOT NULL,
    "currency_id" INTEGER NOT NULL,
    "company_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" DATE NOT NULL,
    "rate" DECIMAL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_currency_rate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_groups" (
    "id" SERIAL NOT NULL,
    "name" JSONB NOT NULL,
    "category_id" INTEGER,
    "color" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "comment" JSONB,
    "share" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_groups_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_groups_implied_rel" (
    "gid" INTEGER NOT NULL,
    "hid" INTEGER NOT NULL,

    CONSTRAINT "res_groups_implied_rel_pkey" PRIMARY KEY ("gid","hid")
);

-- CreateTable
CREATE TABLE "res_groups_report_rel" (
    "uid" INTEGER NOT NULL,
    "gid" INTEGER NOT NULL,

    CONSTRAINT "res_groups_report_rel_pkey" PRIMARY KEY ("uid","gid")
);

-- CreateTable
CREATE TABLE "res_groups_users_rel" (
    "gid" INTEGER NOT NULL,
    "uid" INTEGER NOT NULL,

    CONSTRAINT "res_groups_users_rel_pkey" PRIMARY KEY ("gid","uid")
);

-- CreateTable
CREATE TABLE "res_lang" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "code" VARCHAR NOT NULL,
    "iso_code" VARCHAR,
    "url_code" VARCHAR NOT NULL,
    "direction" VARCHAR NOT NULL,
    "date_format" VARCHAR NOT NULL,
    "time_format" VARCHAR NOT NULL,
    "week_start" VARCHAR NOT NULL,
    "grouping" VARCHAR NOT NULL,
    "decimal_point" VARCHAR NOT NULL,
    "thousands_sep" VARCHAR,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_lang_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_lang_install_rel" (
    "language_wizard_id" INTEGER NOT NULL,
    "lang_id" INTEGER NOT NULL,

    CONSTRAINT "res_lang_install_rel_pkey" PRIMARY KEY ("language_wizard_id","lang_id")
);

-- CreateTable
CREATE TABLE "res_partner" (
    "id" SERIAL NOT NULL,
    "company_id" INTEGER,
    "create_date" TIMESTAMP(6),
    "name" VARCHAR,
    "title" INTEGER,
    "parent_id" INTEGER,
    "user_id" INTEGER,
    "state_id" INTEGER,
    "country_id" INTEGER,
    "industry_id" INTEGER,
    "color" INTEGER,
    "commercial_partner_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "complete_name" VARCHAR,
    "ref" VARCHAR,
    "lang" VARCHAR,
    "tz" VARCHAR,
    "vat" VARCHAR,
    "company_registry" VARCHAR,
    "website" VARCHAR,
    "function" VARCHAR,
    "type" VARCHAR,
    "street" VARCHAR,
    "street2" VARCHAR,
    "zip" VARCHAR,
    "city" VARCHAR,
    "email" VARCHAR,
    "phone" VARCHAR,
    "mobile" VARCHAR,
    "commercial_company_name" VARCHAR,
    "company_name" VARCHAR,
    "date" DATE,
    "comment" TEXT,
    "partner_latitude" DECIMAL,
    "partner_longitude" DECIMAL,
    "active" BOOLEAN,
    "employee" BOOLEAN,
    "is_company" BOOLEAN,
    "partner_share" BOOLEAN,
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_partner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_partner_bank" (
    "id" SERIAL NOT NULL,
    "partner_id" INTEGER NOT NULL,
    "bank_id" INTEGER,
    "sequence" INTEGER,
    "currency_id" INTEGER,
    "company_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "acc_number" VARCHAR NOT NULL,
    "sanitized_acc_number" VARCHAR,
    "acc_holder_name" VARCHAR,
    "active" BOOLEAN,
    "allow_out_payment" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_partner_bank_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_partner_category" (
    "id" SERIAL NOT NULL,
    "color" INTEGER,
    "parent_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "parent_path" VARCHAR,
    "name" JSONB NOT NULL,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_partner_category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_partner_industry" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" JSONB,
    "full_name" JSONB,
    "active" BOOLEAN,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_partner_industry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_partner_res_partner_category_rel" (
    "category_id" INTEGER NOT NULL,
    "partner_id" INTEGER NOT NULL,

    CONSTRAINT "res_partner_res_partner_category_rel_pkey" PRIMARY KEY ("category_id","partner_id")
);

-- CreateTable
CREATE TABLE "res_partner_title" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" JSONB NOT NULL,
    "shortcut" JSONB,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_partner_title_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_users" (
    "id" SERIAL NOT NULL,
    "company_id" INTEGER NOT NULL,
    "partner_id" INTEGER NOT NULL,
    "active" BOOLEAN DEFAULT true,
    "create_date" TIMESTAMP(6),
    "login" VARCHAR NOT NULL,
    "password" VARCHAR,
    "action_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "signature" TEXT,
    "share" BOOLEAN,
    "write_date" TIMESTAMP(6),
    "totp_secret" VARCHAR,

    CONSTRAINT "res_users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_users_apikeys" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR NOT NULL,
    "user_id" INTEGER NOT NULL,
    "scope" VARCHAR,
    "index" VARCHAR(8),
    "key" VARCHAR,
    "create_date" TIMESTAMP(6) DEFAULT (now() AT TIME ZONE 'utc'::text),

    CONSTRAINT "res_users_apikeys_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_users_apikeys_description" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_users_apikeys_description_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_users_deletion" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "user_id_int" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "state" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_users_deletion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_users_identitycheck" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "request" VARCHAR,
    "password" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_users_identitycheck_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_users_log" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_users_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "res_users_settings" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "res_users_settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reset_view_arch_wizard" (
    "id" SERIAL NOT NULL,
    "view_id" INTEGER,
    "compare_view_id" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "reset_mode" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "reset_view_arch_wizard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "rule_group_rel" (
    "rule_group_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,

    CONSTRAINT "rule_group_rel_pkey" PRIMARY KEY ("rule_group_id","group_id")
);

-- CreateTable
CREATE TABLE "web_editor_converter_test" (
    "id" SERIAL NOT NULL,
    "integer" INTEGER,
    "many2one" INTEGER,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "char" VARCHAR,
    "selection_str" VARCHAR,
    "date" DATE,
    "html" TEXT,
    "text" TEXT,
    "numeric" DECIMAL,
    "datetime" TIMESTAMP(6),
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),
    "float" DOUBLE PRECISION,
    "binary" BYTEA,

    CONSTRAINT "web_editor_converter_test_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "web_editor_converter_test_sub" (
    "id" SERIAL NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "web_editor_converter_test_sub_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "web_tour_tour" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER,
    "name" VARCHAR NOT NULL,

    CONSTRAINT "web_tour_tour_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wizard_ir_model_menu_create" (
    "id" SERIAL NOT NULL,
    "menu_id" INTEGER NOT NULL,
    "create_uid" INTEGER,
    "write_uid" INTEGER,
    "name" VARCHAR NOT NULL,
    "create_date" TIMESTAMP(6),
    "write_date" TIMESTAMP(6),

    CONSTRAINT "wizard_ir_model_menu_create_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "auth_totp_device_user_id_index_idx" ON "auth_totp_device"("user_id", "index");

-- CreateIndex
CREATE INDEX "base_import_mapping__res_model_index" ON "base_import_mapping"("res_model");

-- CreateIndex
CREATE INDEX "base_partner_merge_automatic__res_partner_id_base_partner_m_idx" ON "base_partner_merge_automatic_wizard_res_partner_rel"("res_partner_id", "base_partner_merge_automatic_wizard_id");

-- CreateIndex
CREATE UNIQUE INDEX "decimal_precision_name_uniq" ON "decimal_precision"("name");

-- CreateIndex
CREATE INDEX "iap_account_res_company_rel_res_company_id_iap_account_id_idx" ON "iap_account_res_company_rel"("res_company_id", "iap_account_id");

-- CreateIndex
CREATE INDEX "ir_act_server__model_id_index" ON "ir_act_server"("model_id");

-- CreateIndex
CREATE INDEX "ir_act_server_group_rel_gid_act_id_idx" ON "ir_act_server_group_rel"("gid", "act_id");

-- CreateIndex
CREATE INDEX "ir_act_server_webhook_field_rel_field_id_server_id_idx" ON "ir_act_server_webhook_field_rel"("field_id", "server_id");

-- CreateIndex
CREATE INDEX "ir_act_window_group_rel_gid_act_id_idx" ON "ir_act_window_group_rel"("gid", "act_id");

-- CreateIndex
CREATE UNIQUE INDEX "act_window_view_unique_mode_per_action" ON "ir_act_window_view"("act_window_id", "view_mode");

-- CreateIndex
CREATE INDEX "ir_actions_todo__action_id_index" ON "ir_actions_todo"("action_id");

-- CreateIndex
CREATE INDEX "ir_attachment__store_fname_index" ON "ir_attachment"("store_fname");

-- CreateIndex
CREATE INDEX "ir_attachment_res_idx" ON "ir_attachment"("res_model", "res_id");

-- CreateIndex
CREATE UNIQUE INDEX "ir_config_parameter_key_uniq" ON "ir_config_parameter"("key");

-- CreateIndex
CREATE INDEX "ir_cron_trigger__call_at_index" ON "ir_cron_trigger"("call_at");

-- CreateIndex
CREATE INDEX "ir_cron_trigger__cron_id_index" ON "ir_cron_trigger"("cron_id");

-- CreateIndex
CREATE INDEX "ir_default__company_id_index" ON "ir_default"("company_id");

-- CreateIndex
CREATE INDEX "ir_default__field_id_index" ON "ir_default"("field_id");

-- CreateIndex
CREATE INDEX "ir_default__user_id_index" ON "ir_default"("user_id");

-- CreateIndex
CREATE INDEX "ir_exports__resource_index" ON "ir_exports"("resource");

-- CreateIndex
CREATE INDEX "ir_exports_line__export_id_index" ON "ir_exports_line"("export_id");

-- CreateIndex
CREATE UNIQUE INDEX "ir_filters_name_model_uid_unique" ON "ir_filters"("model_id", "user_id", "action_id", "name");

-- CreateIndex
CREATE INDEX "ir_logging__dbname_index" ON "ir_logging"("dbname");

-- CreateIndex
CREATE INDEX "ir_logging__level_index" ON "ir_logging"("level");

-- CreateIndex
CREATE INDEX "ir_logging__type_index" ON "ir_logging"("type");

-- CreateIndex
CREATE INDEX "ir_mail_server__name_index" ON "ir_mail_server"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ir_model_obj_name_uniq" ON "ir_model"("model");

-- CreateIndex
CREATE INDEX "ir_model_access__group_id_index" ON "ir_model_access"("group_id");

-- CreateIndex
CREATE INDEX "ir_model_access__model_id_index" ON "ir_model_access"("model_id");

-- CreateIndex
CREATE INDEX "ir_model_access__name_index" ON "ir_model_access"("name");

-- CreateIndex
CREATE INDEX "ir_model_constraint__model_index" ON "ir_model_constraint"("model");

-- CreateIndex
CREATE INDEX "ir_model_constraint__module_index" ON "ir_model_constraint"("module");

-- CreateIndex
CREATE INDEX "ir_model_constraint__name_index" ON "ir_model_constraint"("name");

-- CreateIndex
CREATE INDEX "ir_model_constraint__type_index" ON "ir_model_constraint"("type");

-- CreateIndex
CREATE UNIQUE INDEX "ir_model_constraint_module_name_uniq" ON "ir_model_constraint"("name", "module");

-- CreateIndex
CREATE INDEX "ir_model_data_model_res_id_index" ON "ir_model_data"("model", "res_id");

-- CreateIndex
CREATE UNIQUE INDEX "ir_model_data_module_name_uniq_index" ON "ir_model_data"("module", "name");

-- CreateIndex
CREATE INDEX "ir_model_fields__complete_name_index" ON "ir_model_fields"("complete_name");

-- CreateIndex
CREATE INDEX "ir_model_fields__model_id_index" ON "ir_model_fields"("model_id");

-- CreateIndex
CREATE INDEX "ir_model_fields__model_index" ON "ir_model_fields"("model");

-- CreateIndex
CREATE INDEX "ir_model_fields__name_index" ON "ir_model_fields"("name");

-- CreateIndex
CREATE INDEX "ir_model_fields__state_index" ON "ir_model_fields"("state");

-- CreateIndex
CREATE UNIQUE INDEX "ir_model_fields_name_unique" ON "ir_model_fields"("model", "name");

-- CreateIndex
CREATE INDEX "ir_model_fields_group_rel_group_id_field_id_idx" ON "ir_model_fields_group_rel"("group_id", "field_id");

-- CreateIndex
CREATE INDEX "ir_model_fields_selection__field_id_index" ON "ir_model_fields_selection"("field_id");

-- CreateIndex
CREATE UNIQUE INDEX "ir_model_fields_selection_selection_field_uniq" ON "ir_model_fields_selection"("field_id", "value");

-- CreateIndex
CREATE UNIQUE INDEX "ir_model_inherit_uniq" ON "ir_model_inherit"("model_id", "parent_id");

-- CreateIndex
CREATE INDEX "ir_model_relation__model_index" ON "ir_model_relation"("model");

-- CreateIndex
CREATE INDEX "ir_model_relation__module_index" ON "ir_model_relation"("module");

-- CreateIndex
CREATE INDEX "ir_model_relation__name_index" ON "ir_model_relation"("name");

-- CreateIndex
CREATE INDEX "ir_module_category__parent_id_index" ON "ir_module_category"("parent_id");

-- CreateIndex
CREATE UNIQUE INDEX "ir_module_module_name_uniq" ON "ir_module_module"("name");

-- CreateIndex
CREATE INDEX "ir_module_module__category_id_index" ON "ir_module_module"("category_id");

-- CreateIndex
CREATE INDEX "ir_module_module__state_index" ON "ir_module_module"("state");

-- CreateIndex
CREATE INDEX "ir_module_module_dependency__name_index" ON "ir_module_module_dependency"("name");

-- CreateIndex
CREATE INDEX "ir_module_module_exclusion__name_index" ON "ir_module_module_exclusion"("name");

-- CreateIndex
CREATE INDEX "ir_profile__session_index" ON "ir_profile"("session");

-- CreateIndex
CREATE INDEX "ir_property__company_id_index" ON "ir_property"("company_id");

-- CreateIndex
CREATE INDEX "ir_property__name_index" ON "ir_property"("name");

-- CreateIndex
CREATE INDEX "ir_property__res_id_index" ON "ir_property"("res_id");

-- CreateIndex
CREATE INDEX "ir_property__type_index" ON "ir_property"("type");

-- CreateIndex
CREATE INDEX "ir_rule__model_id_index" ON "ir_rule"("model_id");

-- CreateIndex
CREATE INDEX "ir_rule__name_index" ON "ir_rule"("name");

-- CreateIndex
CREATE INDEX "ir_ui_menu__parent_id_index" ON "ir_ui_menu"("parent_id");

-- CreateIndex
CREATE INDEX "ir_ui_menu__parent_path_index" ON "ir_ui_menu"("parent_path");

-- CreateIndex
CREATE INDEX "ir_ui_menu_group_rel_gid_menu_id_idx" ON "ir_ui_menu_group_rel"("gid", "menu_id");

-- CreateIndex
CREATE INDEX "ir_ui_view__inherit_id_index" ON "ir_ui_view"("inherit_id");

-- CreateIndex
CREATE INDEX "ir_ui_view__model_index" ON "ir_ui_view"("model");

-- CreateIndex
CREATE INDEX "ir_ui_view_model_type_inherit_id" ON "ir_ui_view"("model", "inherit_id");

-- CreateIndex
CREATE INDEX "ir_ui_view_custom__ref_id_index" ON "ir_ui_view_custom"("ref_id");

-- CreateIndex
CREATE INDEX "ir_ui_view_custom__user_id_index" ON "ir_ui_view_custom"("user_id");

-- CreateIndex
CREATE INDEX "ir_ui_view_custom_user_id_ref_id" ON "ir_ui_view_custom"("user_id", "ref_id");

-- CreateIndex
CREATE INDEX "ir_ui_view_group_rel_group_id_view_id_idx" ON "ir_ui_view_group_rel"("group_id", "view_id");

-- CreateIndex
CREATE INDEX "rel_modules_langexport_module_id_wiz_id_idx" ON "rel_modules_langexport"("module_id", "wiz_id");

-- CreateIndex
CREATE INDEX "rel_server_actions_action_id_server_id_idx" ON "rel_server_actions"("action_id", "server_id");

-- CreateIndex
CREATE INDEX "res_bank__bic_index" ON "res_bank"("bic");

-- CreateIndex
CREATE UNIQUE INDEX "res_company_name_uniq" ON "res_company"("name");

-- CreateIndex
CREATE INDEX "res_company__parent_id_index" ON "res_company"("parent_id");

-- CreateIndex
CREATE INDEX "res_company__parent_path_index" ON "res_company"("parent_path");

-- CreateIndex
CREATE INDEX "res_company_users_rel_user_id_cid_idx" ON "res_company_users_rel"("user_id", "cid");

-- CreateIndex
CREATE UNIQUE INDEX "res_country_code_uniq" ON "res_country"("code");

-- CreateIndex
CREATE UNIQUE INDEX "res_country_name_uniq" ON "res_country"("name");

-- CreateIndex
CREATE INDEX "res_country_res_country_group_res_country_group_id_res_coun_idx" ON "res_country_res_country_group_rel"("res_country_group_id", "res_country_id");

-- CreateIndex
CREATE UNIQUE INDEX "res_country_state_name_code_uniq" ON "res_country_state"("country_id", "code");

-- CreateIndex
CREATE UNIQUE INDEX "res_currency_unique_name" ON "res_currency"("name");

-- CreateIndex
CREATE INDEX "res_currency_rate__name_index" ON "res_currency_rate"("name");

-- CreateIndex
CREATE UNIQUE INDEX "res_currency_rate_unique_name_per_day" ON "res_currency_rate"("name", "currency_id", "company_id");

-- CreateIndex
CREATE INDEX "res_groups__category_id_index" ON "res_groups"("category_id");

-- CreateIndex
CREATE UNIQUE INDEX "res_groups_name_uniq" ON "res_groups"("category_id", "name");

-- CreateIndex
CREATE INDEX "res_groups_implied_rel_hid_gid_idx" ON "res_groups_implied_rel"("hid", "gid");

-- CreateIndex
CREATE INDEX "res_groups_report_rel_gid_uid_idx" ON "res_groups_report_rel"("gid", "uid");

-- CreateIndex
CREATE INDEX "res_groups_users_rel_uid_gid_idx" ON "res_groups_users_rel"("uid", "gid");

-- CreateIndex
CREATE UNIQUE INDEX "res_lang_name_uniq" ON "res_lang"("name");

-- CreateIndex
CREATE UNIQUE INDEX "res_lang_code_uniq" ON "res_lang"("code");

-- CreateIndex
CREATE UNIQUE INDEX "res_lang_url_code_uniq" ON "res_lang"("url_code");

-- CreateIndex
CREATE INDEX "res_lang_install_rel_lang_id_language_wizard_id_idx" ON "res_lang_install_rel"("lang_id", "language_wizard_id");

-- CreateIndex
CREATE INDEX "res_partner__commercial_partner_id_index" ON "res_partner"("commercial_partner_id");

-- CreateIndex
CREATE INDEX "res_partner__company_id_index" ON "res_partner"("company_id");

-- CreateIndex
CREATE INDEX "res_partner__complete_name_index" ON "res_partner"("complete_name");

-- CreateIndex
CREATE INDEX "res_partner__date_index" ON "res_partner"("date");

-- CreateIndex
CREATE INDEX "res_partner__name_index" ON "res_partner"("name");

-- CreateIndex
CREATE INDEX "res_partner__parent_id_index" ON "res_partner"("parent_id");

-- CreateIndex
CREATE INDEX "res_partner__ref_index" ON "res_partner"("ref");

-- CreateIndex
CREATE INDEX "res_partner__vat_index" ON "res_partner"("vat");

-- CreateIndex
CREATE INDEX "res_partner_bank__partner_id_index" ON "res_partner_bank"("partner_id");

-- CreateIndex
CREATE UNIQUE INDEX "res_partner_bank_unique_number" ON "res_partner_bank"("sanitized_acc_number", "partner_id");

-- CreateIndex
CREATE INDEX "res_partner_category__parent_id_index" ON "res_partner_category"("parent_id");

-- CreateIndex
CREATE INDEX "res_partner_category__parent_path_index" ON "res_partner_category"("parent_path");

-- CreateIndex
CREATE INDEX "res_partner_res_partner_category_rel_partner_id_category_id_idx" ON "res_partner_res_partner_category_rel"("partner_id", "category_id");

-- CreateIndex
CREATE UNIQUE INDEX "res_users_login_key" ON "res_users"("login");

-- CreateIndex
CREATE INDEX "res_users__partner_id_index" ON "res_users"("partner_id");

-- CreateIndex
CREATE INDEX "res_users_apikeys_user_id_index_idx" ON "res_users_apikeys"("user_id", "index");

-- CreateIndex
CREATE UNIQUE INDEX "res_users_settings_unique_user_id" ON "res_users_settings"("user_id");

-- CreateIndex
CREATE INDEX "rule_group_rel_group_id_rule_group_id_idx" ON "rule_group_rel"("group_id", "rule_group_id");

-- AddForeignKey
ALTER TABLE "auth_totp_device" ADD CONSTRAINT "auth_totp_device_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_totp_wizard" ADD CONSTRAINT "auth_totp_wizard_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_totp_wizard" ADD CONSTRAINT "auth_totp_wizard_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "auth_totp_wizard" ADD CONSTRAINT "auth_totp_wizard_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_document_layout" ADD CONSTRAINT "base_document_layout_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_document_layout" ADD CONSTRAINT "base_document_layout_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_document_layout" ADD CONSTRAINT "base_document_layout_report_layout_id_fkey" FOREIGN KEY ("report_layout_id") REFERENCES "report_layout"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_document_layout" ADD CONSTRAINT "base_document_layout_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_enable_profiling_wizard" ADD CONSTRAINT "base_enable_profiling_wizard_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_enable_profiling_wizard" ADD CONSTRAINT "base_enable_profiling_wizard_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_import_import" ADD CONSTRAINT "base_import_import_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_import_import" ADD CONSTRAINT "base_import_import_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_import_mapping" ADD CONSTRAINT "base_import_mapping_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_import_mapping" ADD CONSTRAINT "base_import_mapping_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_import_module" ADD CONSTRAINT "base_import_module_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_import_module" ADD CONSTRAINT "base_import_module_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_language_export" ADD CONSTRAINT "base_language_export_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_language_export" ADD CONSTRAINT "base_language_export_model_id_fkey" FOREIGN KEY ("model_id") REFERENCES "ir_model"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_language_export" ADD CONSTRAINT "base_language_export_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_language_import" ADD CONSTRAINT "base_language_import_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_language_import" ADD CONSTRAINT "base_language_import_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_language_install" ADD CONSTRAINT "base_language_install_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_language_install" ADD CONSTRAINT "base_language_install_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_module_uninstall" ADD CONSTRAINT "base_module_uninstall_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_module_uninstall" ADD CONSTRAINT "base_module_uninstall_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "ir_module_module"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_module_uninstall" ADD CONSTRAINT "base_module_uninstall_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_module_update" ADD CONSTRAINT "base_module_update_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_module_update" ADD CONSTRAINT "base_module_update_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_module_upgrade" ADD CONSTRAINT "base_module_upgrade_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_module_upgrade" ADD CONSTRAINT "base_module_upgrade_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" ADD CONSTRAINT "base_partner_merge_automatic_wizard_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" ADD CONSTRAINT "base_partner_merge_automatic_wizard_current_line_id_fkey" FOREIGN KEY ("current_line_id") REFERENCES "base_partner_merge_line"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" ADD CONSTRAINT "base_partner_merge_automatic_wizard_dst_partner_id_fkey" FOREIGN KEY ("dst_partner_id") REFERENCES "res_partner"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard" ADD CONSTRAINT "base_partner_merge_automatic_wizard_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard_res_partner_rel" ADD CONSTRAINT "base_partner_merge_automatic__base_partner_merge_automatic_fkey" FOREIGN KEY ("base_partner_merge_automatic_wizard_id") REFERENCES "base_partner_merge_automatic_wizard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_automatic_wizard_res_partner_rel" ADD CONSTRAINT "base_partner_merge_automatic_wizard_res_par_res_partner_id_fkey" FOREIGN KEY ("res_partner_id") REFERENCES "res_partner"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_line" ADD CONSTRAINT "base_partner_merge_line_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_line" ADD CONSTRAINT "base_partner_merge_line_wizard_id_fkey" FOREIGN KEY ("wizard_id") REFERENCES "base_partner_merge_automatic_wizard"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "base_partner_merge_line" ADD CONSTRAINT "base_partner_merge_line_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bus_bus" ADD CONSTRAINT "bus_bus_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bus_bus" ADD CONSTRAINT "bus_bus_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "bus_presence" ADD CONSTRAINT "bus_presence_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_own" ADD CONSTRAINT "change_password_own_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_own" ADD CONSTRAINT "change_password_own_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_user" ADD CONSTRAINT "change_password_user_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_user" ADD CONSTRAINT "change_password_user_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_user" ADD CONSTRAINT "change_password_user_wizard_id_fkey" FOREIGN KEY ("wizard_id") REFERENCES "change_password_wizard"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_user" ADD CONSTRAINT "change_password_user_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_wizard" ADD CONSTRAINT "change_password_wizard_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "change_password_wizard" ADD CONSTRAINT "change_password_wizard_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "decimal_precision" ADD CONSTRAINT "decimal_precision_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "decimal_precision" ADD CONSTRAINT "decimal_precision_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "iap_account" ADD CONSTRAINT "iap_account_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "iap_account" ADD CONSTRAINT "iap_account_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "iap_account_info" ADD CONSTRAINT "iap_account_info_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "iap_account"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "iap_account_info" ADD CONSTRAINT "iap_account_info_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "iap_account_info" ADD CONSTRAINT "iap_account_info_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "iap_account_res_company_rel" ADD CONSTRAINT "iap_account_res_company_rel_iap_account_id_fkey" FOREIGN KEY ("iap_account_id") REFERENCES "iap_account"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "iap_account_res_company_rel" ADD CONSTRAINT "iap_account_res_company_rel_res_company_id_fkey" FOREIGN KEY ("res_company_id") REFERENCES "res_company"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_client" ADD CONSTRAINT "ir_act_client_binding_model_id_fkey" FOREIGN KEY ("binding_model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_client" ADD CONSTRAINT "ir_act_client_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_client" ADD CONSTRAINT "ir_act_client_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_report_xml" ADD CONSTRAINT "ir_act_report_xml_binding_model_id_fkey" FOREIGN KEY ("binding_model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_report_xml" ADD CONSTRAINT "ir_act_report_xml_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_report_xml" ADD CONSTRAINT "ir_act_report_xml_paperformat_id_fkey" FOREIGN KEY ("paperformat_id") REFERENCES "report_paperformat"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_report_xml" ADD CONSTRAINT "ir_act_report_xml_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_binding_model_id_fkey" FOREIGN KEY ("binding_model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_crud_model_id_fkey" FOREIGN KEY ("crud_model_id") REFERENCES "ir_model"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_link_field_id_fkey" FOREIGN KEY ("link_field_id") REFERENCES "ir_model_fields"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_model_id_fkey" FOREIGN KEY ("model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_selection_value_fkey" FOREIGN KEY ("selection_value") REFERENCES "ir_model_fields_selection"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_update_field_id_fkey" FOREIGN KEY ("update_field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_update_related_model_id_fkey" FOREIGN KEY ("update_related_model_id") REFERENCES "ir_model"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server" ADD CONSTRAINT "ir_act_server_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server_group_rel" ADD CONSTRAINT "ir_act_server_group_rel_act_id_fkey" FOREIGN KEY ("act_id") REFERENCES "ir_act_server"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server_group_rel" ADD CONSTRAINT "ir_act_server_group_rel_gid_fkey" FOREIGN KEY ("gid") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server_webhook_field_rel" ADD CONSTRAINT "ir_act_server_webhook_field_rel_field_id_fkey" FOREIGN KEY ("field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_server_webhook_field_rel" ADD CONSTRAINT "ir_act_server_webhook_field_rel_server_id_fkey" FOREIGN KEY ("server_id") REFERENCES "ir_act_server"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_url" ADD CONSTRAINT "ir_act_url_binding_model_id_fkey" FOREIGN KEY ("binding_model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_url" ADD CONSTRAINT "ir_act_url_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_url" ADD CONSTRAINT "ir_act_url_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window" ADD CONSTRAINT "ir_act_window_binding_model_id_fkey" FOREIGN KEY ("binding_model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window" ADD CONSTRAINT "ir_act_window_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window" ADD CONSTRAINT "ir_act_window_search_view_id_fkey" FOREIGN KEY ("search_view_id") REFERENCES "ir_ui_view"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window" ADD CONSTRAINT "ir_act_window_view_id_fkey" FOREIGN KEY ("view_id") REFERENCES "ir_ui_view"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window" ADD CONSTRAINT "ir_act_window_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window_group_rel" ADD CONSTRAINT "ir_act_window_group_rel_act_id_fkey" FOREIGN KEY ("act_id") REFERENCES "ir_act_window"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window_group_rel" ADD CONSTRAINT "ir_act_window_group_rel_gid_fkey" FOREIGN KEY ("gid") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window_view" ADD CONSTRAINT "ir_act_window_view_act_window_id_fkey" FOREIGN KEY ("act_window_id") REFERENCES "ir_act_window"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window_view" ADD CONSTRAINT "ir_act_window_view_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window_view" ADD CONSTRAINT "ir_act_window_view_view_id_fkey" FOREIGN KEY ("view_id") REFERENCES "ir_ui_view"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_act_window_view" ADD CONSTRAINT "ir_act_window_view_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_actions" ADD CONSTRAINT "ir_actions_binding_model_id_fkey" FOREIGN KEY ("binding_model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_actions" ADD CONSTRAINT "ir_actions_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_actions" ADD CONSTRAINT "ir_actions_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_actions_todo" ADD CONSTRAINT "ir_actions_todo_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_actions_todo" ADD CONSTRAINT "ir_actions_todo_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_asset" ADD CONSTRAINT "ir_asset_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_asset" ADD CONSTRAINT "ir_asset_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_attachment" ADD CONSTRAINT "ir_attachment_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_attachment" ADD CONSTRAINT "ir_attachment_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_attachment" ADD CONSTRAINT "ir_attachment_original_id_fkey" FOREIGN KEY ("original_id") REFERENCES "ir_attachment"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_attachment" ADD CONSTRAINT "ir_attachment_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_config_parameter" ADD CONSTRAINT "ir_config_parameter_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_config_parameter" ADD CONSTRAINT "ir_config_parameter_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_cron" ADD CONSTRAINT "ir_cron_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_cron" ADD CONSTRAINT "ir_cron_ir_actions_server_id_fkey" FOREIGN KEY ("ir_actions_server_id") REFERENCES "ir_act_server"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_cron" ADD CONSTRAINT "ir_cron_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_cron" ADD CONSTRAINT "ir_cron_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_cron_trigger" ADD CONSTRAINT "ir_cron_trigger_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_cron_trigger" ADD CONSTRAINT "ir_cron_trigger_cron_id_fkey" FOREIGN KEY ("cron_id") REFERENCES "ir_cron"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_cron_trigger" ADD CONSTRAINT "ir_cron_trigger_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_default" ADD CONSTRAINT "ir_default_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_default" ADD CONSTRAINT "ir_default_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_default" ADD CONSTRAINT "ir_default_field_id_fkey" FOREIGN KEY ("field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_default" ADD CONSTRAINT "ir_default_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_default" ADD CONSTRAINT "ir_default_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo" ADD CONSTRAINT "ir_demo_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo" ADD CONSTRAINT "ir_demo_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo_failure" ADD CONSTRAINT "ir_demo_failure_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo_failure" ADD CONSTRAINT "ir_demo_failure_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "ir_module_module"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo_failure" ADD CONSTRAINT "ir_demo_failure_wizard_id_fkey" FOREIGN KEY ("wizard_id") REFERENCES "ir_demo_failure_wizard"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo_failure" ADD CONSTRAINT "ir_demo_failure_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo_failure_wizard" ADD CONSTRAINT "ir_demo_failure_wizard_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_demo_failure_wizard" ADD CONSTRAINT "ir_demo_failure_wizard_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_exports" ADD CONSTRAINT "ir_exports_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_exports" ADD CONSTRAINT "ir_exports_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_exports_line" ADD CONSTRAINT "ir_exports_line_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_exports_line" ADD CONSTRAINT "ir_exports_line_export_id_fkey" FOREIGN KEY ("export_id") REFERENCES "ir_exports"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_exports_line" ADD CONSTRAINT "ir_exports_line_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_filters" ADD CONSTRAINT "ir_filters_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_filters" ADD CONSTRAINT "ir_filters_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_filters" ADD CONSTRAINT "ir_filters_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_mail_server" ADD CONSTRAINT "ir_mail_server_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_mail_server" ADD CONSTRAINT "ir_mail_server_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model" ADD CONSTRAINT "ir_model_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model" ADD CONSTRAINT "ir_model_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_access" ADD CONSTRAINT "ir_model_access_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_access" ADD CONSTRAINT "ir_model_access_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "res_groups"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_access" ADD CONSTRAINT "ir_model_access_model_id_fkey" FOREIGN KEY ("model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_access" ADD CONSTRAINT "ir_model_access_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_constraint" ADD CONSTRAINT "ir_model_constraint_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_constraint" ADD CONSTRAINT "ir_model_constraint_model_fkey" FOREIGN KEY ("model") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_constraint" ADD CONSTRAINT "ir_model_constraint_module_fkey" FOREIGN KEY ("module") REFERENCES "ir_module_module"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_constraint" ADD CONSTRAINT "ir_model_constraint_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_data" ADD CONSTRAINT "ir_model_data_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_data" ADD CONSTRAINT "ir_model_data_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields" ADD CONSTRAINT "ir_model_fields_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields" ADD CONSTRAINT "ir_model_fields_model_id_fkey" FOREIGN KEY ("model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields" ADD CONSTRAINT "ir_model_fields_related_field_id_fkey" FOREIGN KEY ("related_field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields" ADD CONSTRAINT "ir_model_fields_relation_field_id_fkey" FOREIGN KEY ("relation_field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields" ADD CONSTRAINT "ir_model_fields_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields_group_rel" ADD CONSTRAINT "ir_model_fields_group_rel_field_id_fkey" FOREIGN KEY ("field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields_group_rel" ADD CONSTRAINT "ir_model_fields_group_rel_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields_selection" ADD CONSTRAINT "ir_model_fields_selection_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields_selection" ADD CONSTRAINT "ir_model_fields_selection_field_id_fkey" FOREIGN KEY ("field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_fields_selection" ADD CONSTRAINT "ir_model_fields_selection_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_inherit" ADD CONSTRAINT "ir_model_inherit_model_id_fkey" FOREIGN KEY ("model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_inherit" ADD CONSTRAINT "ir_model_inherit_parent_field_id_fkey" FOREIGN KEY ("parent_field_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_inherit" ADD CONSTRAINT "ir_model_inherit_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_relation" ADD CONSTRAINT "ir_model_relation_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_relation" ADD CONSTRAINT "ir_model_relation_model_fkey" FOREIGN KEY ("model") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_relation" ADD CONSTRAINT "ir_model_relation_module_fkey" FOREIGN KEY ("module") REFERENCES "ir_module_module"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_model_relation" ADD CONSTRAINT "ir_model_relation_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_category" ADD CONSTRAINT "ir_module_category_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_category" ADD CONSTRAINT "ir_module_category_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "ir_module_category"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_category" ADD CONSTRAINT "ir_module_category_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_module" ADD CONSTRAINT "ir_module_module_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "ir_module_category"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_module" ADD CONSTRAINT "ir_module_module_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_module" ADD CONSTRAINT "ir_module_module_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_module_dependency" ADD CONSTRAINT "ir_module_module_dependency_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "ir_module_module"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_module_exclusion" ADD CONSTRAINT "ir_module_module_exclusion_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_module_exclusion" ADD CONSTRAINT "ir_module_module_exclusion_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "ir_module_module"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_module_module_exclusion" ADD CONSTRAINT "ir_module_module_exclusion_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_property" ADD CONSTRAINT "ir_property_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_property" ADD CONSTRAINT "ir_property_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_property" ADD CONSTRAINT "ir_property_fields_id_fkey" FOREIGN KEY ("fields_id") REFERENCES "ir_model_fields"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_property" ADD CONSTRAINT "ir_property_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_rule" ADD CONSTRAINT "ir_rule_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_rule" ADD CONSTRAINT "ir_rule_model_id_fkey" FOREIGN KEY ("model_id") REFERENCES "ir_model"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_rule" ADD CONSTRAINT "ir_rule_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_sequence" ADD CONSTRAINT "ir_sequence_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_sequence" ADD CONSTRAINT "ir_sequence_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_sequence" ADD CONSTRAINT "ir_sequence_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_sequence_date_range" ADD CONSTRAINT "ir_sequence_date_range_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_sequence_date_range" ADD CONSTRAINT "ir_sequence_date_range_sequence_id_fkey" FOREIGN KEY ("sequence_id") REFERENCES "ir_sequence"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_sequence_date_range" ADD CONSTRAINT "ir_sequence_date_range_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_menu" ADD CONSTRAINT "ir_ui_menu_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_menu" ADD CONSTRAINT "ir_ui_menu_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "ir_ui_menu"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_menu" ADD CONSTRAINT "ir_ui_menu_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_menu_group_rel" ADD CONSTRAINT "ir_ui_menu_group_rel_gid_fkey" FOREIGN KEY ("gid") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_menu_group_rel" ADD CONSTRAINT "ir_ui_menu_group_rel_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "ir_ui_menu"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view" ADD CONSTRAINT "ir_ui_view_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view" ADD CONSTRAINT "ir_ui_view_inherit_id_fkey" FOREIGN KEY ("inherit_id") REFERENCES "ir_ui_view"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view" ADD CONSTRAINT "ir_ui_view_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view_custom" ADD CONSTRAINT "ir_ui_view_custom_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view_custom" ADD CONSTRAINT "ir_ui_view_custom_ref_id_fkey" FOREIGN KEY ("ref_id") REFERENCES "ir_ui_view"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view_custom" ADD CONSTRAINT "ir_ui_view_custom_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view_custom" ADD CONSTRAINT "ir_ui_view_custom_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view_group_rel" ADD CONSTRAINT "ir_ui_view_group_rel_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ir_ui_view_group_rel" ADD CONSTRAINT "ir_ui_view_group_rel_view_id_fkey" FOREIGN KEY ("view_id") REFERENCES "ir_ui_view"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "rel_modules_langexport" ADD CONSTRAINT "rel_modules_langexport_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "ir_module_module"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "rel_modules_langexport" ADD CONSTRAINT "rel_modules_langexport_wiz_id_fkey" FOREIGN KEY ("wiz_id") REFERENCES "base_language_export"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "rel_server_actions" ADD CONSTRAINT "rel_server_actions_action_id_fkey" FOREIGN KEY ("action_id") REFERENCES "ir_act_server"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "rel_server_actions" ADD CONSTRAINT "rel_server_actions_server_id_fkey" FOREIGN KEY ("server_id") REFERENCES "ir_act_server"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_layout" ADD CONSTRAINT "report_layout_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_layout" ADD CONSTRAINT "report_layout_view_id_fkey" FOREIGN KEY ("view_id") REFERENCES "ir_ui_view"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_layout" ADD CONSTRAINT "report_layout_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_paperformat" ADD CONSTRAINT "report_paperformat_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "report_paperformat" ADD CONSTRAINT "report_paperformat_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_bank" ADD CONSTRAINT "res_bank_country_fkey" FOREIGN KEY ("country") REFERENCES "res_country"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_bank" ADD CONSTRAINT "res_bank_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_bank" ADD CONSTRAINT "res_bank_state_fkey" FOREIGN KEY ("state") REFERENCES "res_country_state"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_bank" ADD CONSTRAINT "res_bank_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company" ADD CONSTRAINT "res_company_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company" ADD CONSTRAINT "res_company_currency_id_fkey" FOREIGN KEY ("currency_id") REFERENCES "res_currency"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company" ADD CONSTRAINT "res_company_external_report_layout_id_fkey" FOREIGN KEY ("external_report_layout_id") REFERENCES "ir_ui_view"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company" ADD CONSTRAINT "res_company_paperformat_id_fkey" FOREIGN KEY ("paperformat_id") REFERENCES "report_paperformat"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company" ADD CONSTRAINT "res_company_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "res_company"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company" ADD CONSTRAINT "res_company_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "res_partner"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company" ADD CONSTRAINT "res_company_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company_users_rel" ADD CONSTRAINT "res_company_users_rel_cid_fkey" FOREIGN KEY ("cid") REFERENCES "res_company"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_company_users_rel" ADD CONSTRAINT "res_company_users_rel_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_config" ADD CONSTRAINT "res_config_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_config" ADD CONSTRAINT "res_config_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_config_installer" ADD CONSTRAINT "res_config_installer_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_config_installer" ADD CONSTRAINT "res_config_installer_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_config_settings" ADD CONSTRAINT "res_config_settings_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_config_settings" ADD CONSTRAINT "res_config_settings_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_config_settings" ADD CONSTRAINT "res_config_settings_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country" ADD CONSTRAINT "res_country_address_view_id_fkey" FOREIGN KEY ("address_view_id") REFERENCES "ir_ui_view"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country" ADD CONSTRAINT "res_country_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country" ADD CONSTRAINT "res_country_currency_id_fkey" FOREIGN KEY ("currency_id") REFERENCES "res_currency"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country" ADD CONSTRAINT "res_country_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country_group" ADD CONSTRAINT "res_country_group_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country_group" ADD CONSTRAINT "res_country_group_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country_res_country_group_rel" ADD CONSTRAINT "res_country_res_country_group_rel_res_country_group_id_fkey" FOREIGN KEY ("res_country_group_id") REFERENCES "res_country_group"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country_res_country_group_rel" ADD CONSTRAINT "res_country_res_country_group_rel_res_country_id_fkey" FOREIGN KEY ("res_country_id") REFERENCES "res_country"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country_state" ADD CONSTRAINT "res_country_state_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "res_country"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country_state" ADD CONSTRAINT "res_country_state_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_country_state" ADD CONSTRAINT "res_country_state_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_currency" ADD CONSTRAINT "res_currency_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_currency" ADD CONSTRAINT "res_currency_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_currency_rate" ADD CONSTRAINT "res_currency_rate_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_currency_rate" ADD CONSTRAINT "res_currency_rate_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_currency_rate" ADD CONSTRAINT "res_currency_rate_currency_id_fkey" FOREIGN KEY ("currency_id") REFERENCES "res_currency"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_currency_rate" ADD CONSTRAINT "res_currency_rate_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups" ADD CONSTRAINT "res_groups_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "ir_module_category"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups" ADD CONSTRAINT "res_groups_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups" ADD CONSTRAINT "res_groups_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups_implied_rel" ADD CONSTRAINT "res_groups_implied_rel_gid_fkey" FOREIGN KEY ("gid") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups_implied_rel" ADD CONSTRAINT "res_groups_implied_rel_hid_fkey" FOREIGN KEY ("hid") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups_report_rel" ADD CONSTRAINT "res_groups_report_rel_gid_fkey" FOREIGN KEY ("gid") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups_report_rel" ADD CONSTRAINT "res_groups_report_rel_uid_fkey" FOREIGN KEY ("uid") REFERENCES "ir_act_report_xml"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups_users_rel" ADD CONSTRAINT "res_groups_users_rel_gid_fkey" FOREIGN KEY ("gid") REFERENCES "res_groups"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_groups_users_rel" ADD CONSTRAINT "res_groups_users_rel_uid_fkey" FOREIGN KEY ("uid") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_lang" ADD CONSTRAINT "res_lang_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_lang" ADD CONSTRAINT "res_lang_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_lang_install_rel" ADD CONSTRAINT "res_lang_install_rel_lang_id_fkey" FOREIGN KEY ("lang_id") REFERENCES "res_lang"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_lang_install_rel" ADD CONSTRAINT "res_lang_install_rel_language_wizard_id_fkey" FOREIGN KEY ("language_wizard_id") REFERENCES "base_language_install"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_commercial_partner_id_fkey" FOREIGN KEY ("commercial_partner_id") REFERENCES "res_partner"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "res_country"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_industry_id_fkey" FOREIGN KEY ("industry_id") REFERENCES "res_partner_industry"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "res_partner"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "res_country_state"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_title_fkey" FOREIGN KEY ("title") REFERENCES "res_partner_title"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner" ADD CONSTRAINT "res_partner_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_bank" ADD CONSTRAINT "res_partner_bank_bank_id_fkey" FOREIGN KEY ("bank_id") REFERENCES "res_bank"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_bank" ADD CONSTRAINT "res_partner_bank_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_bank" ADD CONSTRAINT "res_partner_bank_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_bank" ADD CONSTRAINT "res_partner_bank_currency_id_fkey" FOREIGN KEY ("currency_id") REFERENCES "res_currency"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_bank" ADD CONSTRAINT "res_partner_bank_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "res_partner"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_bank" ADD CONSTRAINT "res_partner_bank_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_category" ADD CONSTRAINT "res_partner_category_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_category" ADD CONSTRAINT "res_partner_category_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "res_partner_category"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_category" ADD CONSTRAINT "res_partner_category_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_industry" ADD CONSTRAINT "res_partner_industry_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_industry" ADD CONSTRAINT "res_partner_industry_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_res_partner_category_rel" ADD CONSTRAINT "res_partner_res_partner_category_rel_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "res_partner_category"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_res_partner_category_rel" ADD CONSTRAINT "res_partner_res_partner_category_rel_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "res_partner"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_title" ADD CONSTRAINT "res_partner_title_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_partner_title" ADD CONSTRAINT "res_partner_title_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users" ADD CONSTRAINT "res_users_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "res_company"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users" ADD CONSTRAINT "res_users_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users" ADD CONSTRAINT "res_users_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "res_partner"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users" ADD CONSTRAINT "res_users_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_apikeys" ADD CONSTRAINT "res_users_apikeys_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_apikeys_description" ADD CONSTRAINT "res_users_apikeys_description_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_apikeys_description" ADD CONSTRAINT "res_users_apikeys_description_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_deletion" ADD CONSTRAINT "res_users_deletion_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_deletion" ADD CONSTRAINT "res_users_deletion_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_deletion" ADD CONSTRAINT "res_users_deletion_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_identitycheck" ADD CONSTRAINT "res_users_identitycheck_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_identitycheck" ADD CONSTRAINT "res_users_identitycheck_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_log" ADD CONSTRAINT "res_users_log_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_log" ADD CONSTRAINT "res_users_log_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_settings" ADD CONSTRAINT "res_users_settings_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_settings" ADD CONSTRAINT "res_users_settings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "res_users_settings" ADD CONSTRAINT "res_users_settings_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reset_view_arch_wizard" ADD CONSTRAINT "reset_view_arch_wizard_compare_view_id_fkey" FOREIGN KEY ("compare_view_id") REFERENCES "ir_ui_view"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reset_view_arch_wizard" ADD CONSTRAINT "reset_view_arch_wizard_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reset_view_arch_wizard" ADD CONSTRAINT "reset_view_arch_wizard_view_id_fkey" FOREIGN KEY ("view_id") REFERENCES "ir_ui_view"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "reset_view_arch_wizard" ADD CONSTRAINT "reset_view_arch_wizard_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "rule_group_rel" ADD CONSTRAINT "rule_group_rel_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "res_groups"("id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "rule_group_rel" ADD CONSTRAINT "rule_group_rel_rule_group_id_fkey" FOREIGN KEY ("rule_group_id") REFERENCES "ir_rule"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "web_editor_converter_test" ADD CONSTRAINT "web_editor_converter_test_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "web_editor_converter_test" ADD CONSTRAINT "web_editor_converter_test_many2one_fkey" FOREIGN KEY ("many2one") REFERENCES "web_editor_converter_test_sub"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "web_editor_converter_test" ADD CONSTRAINT "web_editor_converter_test_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "web_editor_converter_test_sub" ADD CONSTRAINT "web_editor_converter_test_sub_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "web_editor_converter_test_sub" ADD CONSTRAINT "web_editor_converter_test_sub_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "web_tour_tour" ADD CONSTRAINT "web_tour_tour_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "wizard_ir_model_menu_create" ADD CONSTRAINT "wizard_ir_model_menu_create_create_uid_fkey" FOREIGN KEY ("create_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "wizard_ir_model_menu_create" ADD CONSTRAINT "wizard_ir_model_menu_create_menu_id_fkey" FOREIGN KEY ("menu_id") REFERENCES "ir_ui_menu"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "wizard_ir_model_menu_create" ADD CONSTRAINT "wizard_ir_model_menu_create_write_uid_fkey" FOREIGN KEY ("write_uid") REFERENCES "res_users"("id") ON DELETE SET NULL ON UPDATE NO ACTION;
