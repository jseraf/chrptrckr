class SpinDecorator < Draper::Decorator
  delegate_all

  def spin_time
    h.content_tag(:div,
        object.played_at.strftime("%-m/%-d/%y at %l:%M%P"),
        title: "Played by: #{object.dj.name}")
  end

end
