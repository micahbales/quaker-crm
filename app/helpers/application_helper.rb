module ApplicationHelper

  def multisearch_link_generator(result)

    if result.searchable_type == "Meeting"
      @meeting = Meeting.find(result.searchable_id)
      link_to "#{@meeting.name}", meeting_path(@meeting)
    elsif result.searchable_type == "Individual"
      individual = Individual.find(result.searchable_id)
      @meeting = Meeting.find(individual.meeting_id)
      link_to "#{individual.first_name} #{individual.last_name}", meeting_individual_path(@meeting, individual)
    elsif result.searchable_type == "Group"
      group = Group.find(result.searchable_id)
      @meeting = Meeting.find(group.meeting_id)
      link_to "#{group.name}", meeting_group_path(@meeting, group)
    end
  end
end
