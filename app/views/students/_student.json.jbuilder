json.extract! student, :id, :name, :lastname, :code, :email, :cel, :created_at, :updated_at
json.url student_url(student, format: :json)
