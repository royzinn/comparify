module TopicsHelper

  def new_answer_link(subject)
    title = subject == :first ? @topic.first_subject.titleize : @topic.second_subject.titleize
    link_class = subject == :first ? 'btn btn-primary' : 'btn btn-info'
    tooltip_placement = subject == :first ? 'left' : 'right'
    if current_user && current_user.topics.include?(@topic)
      link_to "Your Argument For #{title}", '#', {id: "#{subject.to_s}_subject_button", 'data-placement' => tooltip_placement, 'data-title' => 'Well, you can\'t answer your own question!', :class => link_class}
    elsif current_user
      link_to "Your Argument For #{title}",
              '#answer-modal',
              {:remote => true, 'data-toggle' =>  "modal", 'data-target' => '#answer-modal', 'data-subject' => subject.to_s, :class => link_class}
    else
      link_to "Your Argument For #{title}", new_user_session_path, {id: "#{subject.to_s}_subject_button", 'data-placement' => tooltip_placement, 'data-title' => 'Click to Login first!', :class => link_class}
    end
  end

  def voters_for_subjects
    unless @first_subject_answers.empty? && @first_subject_answers.empty?
      capture_haml do
        haml_tag :p do
          unless @first_subject_answers.empty?
            haml_tag :span, pluralize("#{@first_subject_answers.count}", "voter"), {:class => 'label label-primary pull-left'}
          end
          unless @second_subject_answers.empty?
            haml_tag :span, pluralize("#{@second_subject_answers.count}", "voter"), {:class => 'label label-info pull-right'}
          end
        end
      end
    end
  end

  def first_subject_answers_count(topic)
    topic.answers.supports_first_subject.count
  end

  def second_subject_answers_count(topic)
    topic.answers.supports_second_subject.count
  end

  def topic_owner
    if @topic.user == current_user
      link_to "Me", @topic.user
    else
      link_to @topic.user.name, @topic.user
    end
  end

  def topic_header(topic)
    "#{topic.first_subject} Versus #{topic.second_subject}"
  end
end
