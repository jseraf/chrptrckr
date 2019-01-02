class SpinDecorator < Draper::Decorator
  delegate_all

  def spin_time_with_dj
    h.content_tag(:div,
        "#{spin_time}",
        title: "Played by: #{object.dj.name}")
  end

  def spin_time
    object.played_at.strftime("%-m/%-d/%y at %l:%M%P")
  end
end
