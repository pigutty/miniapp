json.array! @reactions do |reaction|
  json.stamp_type reaction.stamp_type
  json.user_id reaction.user_id
  json.message_id reaction.message_id
end
