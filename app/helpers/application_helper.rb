module ApplicationHelper

  def attribute_filter(key, value)
    unless key == "id" || key == "created_at" || key == "updated_at" || key == "meeting_id" || value == ""
      "#{key.gsub(/_/, " ").capitalize}: #{value}"
    end
  end
end
