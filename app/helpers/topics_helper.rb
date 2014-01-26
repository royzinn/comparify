module TopicsHelper

  def new_answer_link(topic, subject)
    title = subject == :first ? topic.first_subject.titleize : topic.second_subject.titleize
    link_class = subject == :first ? 'btn btn-primary' : 'btn btn-success'
    tooltip_placement = subject == :first ? 'left' : 'right'
    if current_user
      link_to "Your Argument For #{title}",
              '#answer-modal',
              {:remote => true, 'data-toggle' =>  "modal", 'data-target' => '#answer-modal', 'data-subject' => subject.to_s, :class => link_class}
    else
      link_to "Your Argument For #{title}", new_user_session_path, {id: "#{subject.to_s}_subject_button", 'data-placement' => tooltip_placement, 'data-title' => 'Click to Login first!', :class => link_class}
    end
  end

end
