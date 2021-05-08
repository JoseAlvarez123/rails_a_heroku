# frozen_string_literal: true

module ApplicationHelper # :nodoc:
  def requested?(subject)
    UserRequest.where(user_id: current_user.id, publication_id:
                          subject.id).exists?
  end
end
