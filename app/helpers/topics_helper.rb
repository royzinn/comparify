module TopicsHelper

  def new_answer_link(topic, subject)
    title = subject == :first ? topic.first_subject.titleize : topic.second_subject.titleize
    link_class = subject == :first ? 'btn btn-primary' : 'btn btn-success'
    link_to "Your Argument For #{title}",
            new_topic_answer_path(topic.id),
            {:remote => true, 'data-toggle' =>  "modal", 'data-target' => '#answer-modal', 'data-subject' => subject.to_s, :class => link_class}
  end

end
