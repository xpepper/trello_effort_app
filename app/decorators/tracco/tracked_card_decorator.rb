module Tracco
  class TrackedCardDecorator < Draper::Decorator
  delegate_all

  def effort_spent(since_date)
    model.effort_spent(since_date).to_s
  end

  def link_to_trello_card
    h.link_to model.name, model.url, target: "_blank"
  end

  def created_at
    model.created_at.strftime("%d.%m.%Y")
  end

  def updated_at
    model.updated_at.strftime("%d.%m.%Y")
  end

  def link_to_delete_effort(effort)
    h.link_to "delete", h.tracked_card_effort_path(model, effort), :method => :delete, :confirm => "Are you sure?"
  end

  def link_to_edit_effort(effort)
    h.link_to "edit", controller: "efforts", action: "edit", tracked_card_id: model, id: effort
  end

  def trello_notifications
    model.trello_notifications.map {|n| "#{n.date}: #{n.data['text']}" }
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
end
