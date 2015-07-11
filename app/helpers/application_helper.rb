module ApplicationHelper

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def up_vote_path(vote)
    if vote.persisted? && vote.value == 1
      post_delete_vote_path(vote.post)
    else
      post_up_vote_path(vote.post)
    end
  end

  def down_vote_path(vote)
    if vote.persisted? && vote.value == -1
      post_delete_vote_path(vote.post)
    else
      post_down_vote_path(vote.post)
    end
  end

end
