module TimeSpentHelper
  def time_in_hrs(mins)
    hrs = (mins / 60).to_s.concat(' hrs ')
    hrs.concat((mins % 60).to_s.concat(' mins ')) if mins % 60
    hrs
  end
end
