module DjsHelper

  def first_tracked
    created_at
  end

  def last_seen
    # updates via spin, belongs_to: :dj, touch: true
    updated_at
  end

end
