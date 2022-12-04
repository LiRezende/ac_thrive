# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_04_214436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "street"
    t.integer "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "cep"
    t.string "city"
    t.string "state"
    t.uuid "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_adresses_on_person_id"
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.string "legal_representative"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "identity"
    t.string "expeditor"
    t.string "cpf"
    t.string "nacionality"
    t.string "father_name"
    t.string "mother_name"
    t.uuid "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_documents_on_person_id"
  end

  create_table "financial_responsibles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.string "cpf"
    t.uuid "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_financial_responsibles_on_person_id"
  end

  create_table "idiom_levels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idioms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.date "birthdate"
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country_code"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "motivation"
    t.text "hobby"
    t.text "country"
    t.text "culture"
    t.text "work"
    t.uuid "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "course"
    t.string "period"
    t.string "end_period"
    t.string "level"
    t.index ["person_id"], name: "index_questions_on_person_id"
  end

  create_table "roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "schedules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "day"
    t.time "hour"
    t.uuid "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_schedules_on_person_id"
  end

  create_table "statuses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "status_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "occupation"
    t.string "position"
    t.boolean "financial_responsible"
    t.uuid "person_id"
    t.uuid "idiom_id"
    t.uuid "idiom_level_id"
    t.uuid "teacher_id"
    t.uuid "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_students_on_company_id"
    t.index ["idiom_id"], name: "index_students_on_idiom_id"
    t.index ["idiom_level_id"], name: "index_students_on_idiom_level_id"
    t.index ["person_id"], name: "index_students_on_person_id"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "fee"
    t.uuid "person_id"
    t.uuid "idiom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["idiom_id"], name: "index_teachers_on_idiom_id"
    t.index ["person_id"], name: "index_teachers_on_person_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.uuid "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status_id"], name: "index_users_on_status_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "adresses", "people"
  add_foreign_key "documents", "people"
  add_foreign_key "financial_responsibles", "people"
  add_foreign_key "people", "users"
  add_foreign_key "questions", "people"
  add_foreign_key "schedules", "people"
  add_foreign_key "students", "companies"
  add_foreign_key "students", "idiom_levels"
  add_foreign_key "students", "idioms"
  add_foreign_key "students", "people"
  add_foreign_key "students", "teachers"
  add_foreign_key "teachers", "idioms"
  add_foreign_key "teachers", "people"
  add_foreign_key "users", "statuses"
  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
