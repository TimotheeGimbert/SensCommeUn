json.extract! stakeholder_request, :id, :user_id, :organization_id, :message, :validation, :created_at, :updated_at
json.url stakeholder_request_url(stakeholder_request, format: :json)
