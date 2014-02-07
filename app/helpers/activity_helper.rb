module ActivityHelper

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

  def link_to_trackable(object, object_type)
    if object
      case object_type
      when "Topic" then link_title = "question - "
      when "Answer" then link_title = topic_header(object)
      when "Relationship"
        if object.follower == @user
          link_title = object.followed.name
          object = object.followed
        elsif object.followed == @user
          link_title = object.follower.name
          object = object.follower
        end
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

  def following_or_followed(follower, followed)
    if follower == @user
      "is now following"
    elsif followed == @user
      "is now followed by"
    end
  end
end
