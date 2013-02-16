class TrackedCardDecorator < Draper::Decorator
  delegate_all

  def effort_spent(since_date)
    model.effort_spent(since_date).to_s
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
