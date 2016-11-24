module ApplicationHelper

  def attribute_filter(key, value)
    unless key == "id" || key == "created_at" || key == "updated_at" || key == "meeting_id" || key == "user_id" || key == "name" || value == ""
      "#{key.gsub(/_/, " ").capitalize}: #{value}"
    end
  end

  def multisearch_result_filter(result)
    if result.searchable_type == "Meeting"
      #return meeting data
      meeting = Meeting.find(result.searchable_id)
      "#{meeting.name}"
    elsif result.searchable_type == "Individual"
      #return individual data
      individual = Individual.find(result.searchable_id)
      meeting = Meeting.find(individual.meeting_id)
      "#{individual.first_name} #{individual.last_name}"
    elsif result.searchable_type == "Group"
      #return group data
      group = Group.find(result.searchable_id)
      meeting = Meeting.find(group.meeting_id)
      "#{group.name}"
    end
  end
end
