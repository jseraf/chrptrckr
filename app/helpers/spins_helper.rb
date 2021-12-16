module SpinsHelper
  def spin_time_with_dj(spin)
    content_tag(:div, "#{spin_time(spin)}", title: "Played by: #{spin.dj.name}")
  end

  def spin_time(spin)
    spin.played_at.strftime("%-m/%-d/%y at %l:%M%P")
  end
end
