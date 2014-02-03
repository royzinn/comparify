module ActivityHelper
  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

  # Shortcut for outputing proper ownership of objects,
  # depending on who is looking
  def whose?(user, object)
    case object
      when Topic, Answer
        owner = object.user
      else
        owner = nil
    end
    if user and owner
      if user.id == owner.id
        "his"
      else
        "#{owner.name}'s"
      end
    else
      ""
    end
  end

  # Check if object still exists in the database and display a link to it,
  # otherwise display a proper message about it.
  # This is used in activities that can refer to
  # objects which no longer exist, like removed posts.
  def link_to_trackable(object, object_type)
    if object
      case object_type
        when "Topic" then link_title = "question - "
        when "Answer" then link_title = topic_header(object)
      end
      link_to link_title, object
    else
      "a #{object_type.downcase} which does not exist anymore"
    end
  end

  def activities_title(user)
    if user == current_user
      "My Activities"
    else
      "#{@user.name.capitalize}'s Activities"
    end
  end
end
