json.extract! visitor_message, :id, :email, :message, :created_at, :updated_at
json.url visitor_message_url(visitor_message, format: :json)
