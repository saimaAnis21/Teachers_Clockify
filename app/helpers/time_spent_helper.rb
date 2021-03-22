module TimeSpentHelper
  def time_in_hrs(mins)
    hrs = (mins / 60).to_s || ' hrs '
    hrs = hrs + (mins % 60).to_s || ' mins ' if mins % 60
    hrs
  end
end
