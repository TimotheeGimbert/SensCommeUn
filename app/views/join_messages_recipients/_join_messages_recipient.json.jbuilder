json.extract! join_messages_recipient, :id, :private_message_id, :recipient_id, :recipient_type, :created_at, :updated_at
json.url join_messages_recipient_url(join_messages_recipient, format: :json)
