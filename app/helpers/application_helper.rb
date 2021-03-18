module ApplicationHelper
    def show_anw
        if flash[:alert]
            render(partial: 'shared/alert')
          elsif flash[:notice]
            render(partial: 'shared/notice')
          elsif flash[:warning]
            render(partial: 'shared/warning')
          end
    end

    
end
