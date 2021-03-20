module TimeSpentHelper

    def time_in_hrs
        hrs=""
        hrs= (@ts.Amount/60).to_s + " hrs "
        if @ts.Amount%60
            hrs = hrs + (@ts.Amount%60).to_s + " mins "
            
        end
        hrs
    end
end
