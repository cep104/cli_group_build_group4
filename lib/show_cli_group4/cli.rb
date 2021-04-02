class CLI
    def start 
        puts "Welcome! What is your name?"
        input = user_input
        greeting(input)
    end

    def user_input
        gets.strip
    end

    def greeting(name)
        puts "Hello #{name}! Enter a name of a show or keyword to get a list of shows! Or if you would like to exit enter exit"
        menu
    end

    def menu 
        selection = user_input
        API.get_data(selection)
        if selection == "exit"
           exit
        elsif Show.all.length != 0
            print_shows 
            #print out list of shows 
        else 
            invalid
        end
    
    end

    def exit 
        puts "thank you for coming!"
    end

    def invalid 
        puts "hhhmmmmm... I don't recognize that please try again."
        menu
    end

    def print_shows 
        Show.all.each.with_index(1) do |show, index|
            puts "#{index}. #{show.name}"
        end
        get_show_info
    end

    def get_show_info 
        puts "Enter the name of the show you would like to learn more about"
        selection = user_input
        if Show.find_show(selection)
            input = Show.find_show(selection)
            show_details(input)
        elsif selection == "exit"
            exit 
        else  
            invalid
        end
    end

    def show_details(show)
        puts "#{show.name}"
        puts "#{show.rating['average']}"
        show_details_menu
    end

    def show_details_menu
        puts "enter y to see the list of shows again or enter the name of the show you want more info about."
        selection = user_input 
        if selection == "y"
            print_shows 
        elsif selection == exit
            exit
        else 
            invalid
        end
    end
    # API.get_data(input)
end