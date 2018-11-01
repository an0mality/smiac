# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180821114354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_images", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.integer  "types"
    t.text     "preview"
    t.text     "body"
    t.datetime "published_at",       precision: 6
    t.datetime "published_to",       precision: 6
    t.string   "vid_url"
    t.integer  "user_id",                                      null: false
    t.string   "name"
    t.datetime "created_at",         precision: 6,             null: false
    t.datetime "updated_at",         precision: 6,             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at",   precision: 6
    t.boolean  "show"
    t.integer  "count_views",                      default: 0
    t.integer  "article_image_id"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "calendar_documents", force: :cascade do |t|
    t.string  "filename"
    t.string  "content_type"
    t.binary  "file_contents"
    t.integer "calendar_list_id", null: false
  end

  create_table "calendar_lists", force: :cascade do |t|
    t.text     "name"
    t.string   "report_period"
    t.integer  "employee_id"
    t.text     "submitting_date"
    t.integer  "calendar_report_type_id"
    t.string   "hour"
    t.string   "day"
    t.string   "wday"
    t.string   "report_name"
    t.string   "employee_str"
    t.datetime "updated_at"
  end

  create_table "calendar_report_types", force: :cascade do |t|
    t.string "name"
    t.string "month"
    t.string "color"
  end

  create_table "calendar_schedules", force: :cascade do |t|
    t.integer  "calendar_list_id"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "district"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",                             null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   precision: 6
    t.datetime "updated_at",                   precision: 6
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "cookies_ecos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name",           null: false
    t.string "cabinet_number", null: false
    t.text   "description"
  end

  create_table "document_stages", force: :cascade do |t|
    t.string  "name",      null: false
    t.integer "parent_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.integer  "user_id",                       null: false
    t.integer  "document_stage_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count_download",    default: 0
  end

  create_table "eco_answers", force: :cascade do |t|
    t.string   "name",                            null: false
    t.integer  "eco_question_id",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "old",             default: false
  end

  create_table "eco_questions", force: :cascade do |t|
    t.string   "name",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "old",        default: false
    t.integer  "position"
  end

  create_table "eco_votes", force: :cascade do |t|
    t.text     "description"
    t.integer  "number",          null: false
    t.integer  "eco_question_id", null: false
    t.integer  "eco_answer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "eco_votes", ["eco_answer_id"], name: "index_eco_votes_on_eco_answer_id", using: :btree
  add_index "eco_votes", ["eco_question_id"], name: "index_eco_votes_on_eco_question_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer "department_id",                 null: false
    t.string  "surname",                       null: false
    t.string  "name",                          null: false
    t.string  "patronymic",                    null: false
    t.string  "phone_number",                  null: false
    t.boolean "boss",          default: false
  end

  create_table "faq_rmis_answers", force: :cascade do |t|
    t.integer "faq_rmis_theme_id", null: false
    t.text    "question",          null: false
    t.text    "description"
  end

  create_table "faq_rmis_themes", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "email"
    t.string   "fio"
    t.integer  "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tel"
    t.string   "org_text"
    t.string   "message"
  end

  create_table "nok_marks", force: :cascade do |t|
    t.text "description", null: false
  end

  create_table "nok_ratings", force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "nok_type_id",     null: false
    t.integer "nok_mark_id",     null: false
    t.integer "nok_year_id",     null: false
    t.integer "result",          null: false
  end

  add_index "nok_ratings", ["organization_id"], name: "index_nok_ratings_on_organization_id", using: :btree

  create_table "nok_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "nok_years", force: :cascade do |t|
    t.integer "year", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string  "address",              limit: 255, null: false
    t.string  "name",                 limit: 255, null: false
    t.text    "description"
    t.string  "logo",                 limit: 255
    t.string  "tel_secretary",        limit: 255
    t.string  "fax",                  limit: 255
    t.integer "key"
    t.integer "type_organization_id"
    t.string  "full_name",            limit: 255
    t.string  "tag_ids",              limit: 255
    t.string  "lsd_id",               limit: 255
    t.string  "web_site",             limit: 255
  end

  create_table "rating_answers", force: :cascade do |t|
    t.text    "body"
    t.integer "rating_question_id"
  end

  add_index "rating_answers", ["rating_question_id"], name: "index_rating_answers_on_rating_question_id", using: :btree

  create_table "rating_forms", force: :cascade do |t|
    t.string   "name"
    t.integer  "type_id"
    t.boolean  "is_current"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "rating_people_answers", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "rating_question_id"
    t.integer "rating_answer_id"
    t.integer "sum"
  end

  add_index "rating_people_answers", ["organization_id"], name: "index_rating_people_answers_on_organization_id", using: :btree
  add_index "rating_people_answers", ["rating_answer_id"], name: "index_rating_people_answers_on_rating_answer_id", using: :btree
  add_index "rating_people_answers", ["rating_question_id"], name: "index_rating_people_answers_on_rating_question_id", using: :btree

  create_table "rating_questions", force: :cascade do |t|
    t.text    "body"
    t.integer "rating_form_id"
  end

  add_index "rating_questions", ["rating_form_id"], name: "index_rating_questions_on_rating_form_id", using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "subscribes", force: :cascade do |t|
    t.string   "mail",                                                       null: false
    t.boolean  "email_confirmed",                            default: false
    t.string   "confirm_token"
    t.boolean  "articles",                                   default: false
    t.boolean  "documents",                                  default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.boolean  "consent_to_the_processing_of_personal_data", default: false
    t.boolean  "calendar"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_organizations", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at",    precision: 6
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at",     precision: 6
    t.datetime "last_sign_in_at",        precision: 6
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.boolean  "admin",                                default: false
    t.boolean  "moderator",                            default: false
    t.string   "fio"
    t.string   "hospital"
    t.boolean  "blocks",                               default: false
    t.datetime "created_at",             precision: 6
    t.datetime "updated_at",             precision: 6
    t.string   "organization"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string   "name",                          null: false
    t.string   "pay"
    t.text     "requirements"
    t.text     "responsibility"
    t.text     "contacts"
    t.boolean  "actual",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "video_files", force: :cascade do |t|
    t.string   "video_id",          null: false
    t.text     "description"
    t.integer  "video_playlist_id", null: false
    t.text     "title"
    t.datetime "created_at",        null: false
  end

  create_table "video_playlists", force: :cascade do |t|
    t.string  "playlist_id",                null: false
    t.text    "title"
    t.integer "video_stage_id", default: 0, null: false
  end

  add_index "video_playlists", ["video_stage_id"], name: "index_video_playlists_on_video_stage_id", using: :btree

  create_table "video_stages", force: :cascade do |t|
    t.string  "name",      null: false
    t.integer "parent_id"
  end

end
