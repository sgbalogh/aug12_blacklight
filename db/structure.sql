CREATE TABLE "bookmarks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "user_type" varchar, "document_id" varchar, "title" varchar, "created_at" datetime, "updated_at" datetime, "document_type" varchar);
CREATE INDEX "index_bookmarks_on_user_id" ON "bookmarks" ("user_id");
CREATE TABLE "searches" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "query_params" text, "user_id" integer, "user_type" varchar, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_searches_on_user_id" ON "searches" ("user_id");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "guest" boolean DEFAULT 'f', "provider" varchar DEFAULT '' NOT NULL, "aleph_id" varchar, "institution_code" varchar, "patron_status" varchar, "username" varchar DEFAULT '' NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_username_and_provider" ON "users" ("username", "provider");
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20150812160632');

INSERT INTO schema_migrations (version) VALUES ('20150812160633');

INSERT INTO schema_migrations (version) VALUES ('20150812160634');

INSERT INTO schema_migrations (version) VALUES ('20150812160636');

INSERT INTO schema_migrations (version) VALUES ('20150812160637');

INSERT INTO schema_migrations (version) VALUES ('20151016194919');

INSERT INTO schema_migrations (version) VALUES ('20151016195334');

INSERT INTO schema_migrations (version) VALUES ('20151016195520');

INSERT INTO schema_migrations (version) VALUES ('20151016195719');

