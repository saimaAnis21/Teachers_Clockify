module TimeSpentHelper

    def time_in_hrs(a)
        hrs=""
        hrs= (a/60).to_s + " hrs "
        if a%60
            hrs = hrs + (a%60).to_s + " mins "
            
        end
        hrs
    end
end
