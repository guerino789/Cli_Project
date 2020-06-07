class Cli
    
    def run
        print_welcome
        Api.get_people
        main
    end

    def main
        print_all
        print_selection_prompt
        id = valid_id?(prompt_selection)
        updated_people = get_peoples_details(id)
        print_details(updated_people)
        print_continue
        continue?(prompt_selection)
    end

    def print_details(starwars)
        puts "Name: #{starwars.name}"
        puts "Height: #{starwars.height}"
        puts "Mass: #{starwars.mass}"
        puts "Gender: #{starwars.gender}"
    end

    def print_all
        Starwars.all.each { |p| puts "#{p.id}. #{p.name}"}
    end

    def print_welcome
        puts "Welcome to a galaxy far far away......."
    end

    def print_selection_prompt
        puts 'Select a person you do.'
    end

    def print_error
        puts "Invalid selection you put, choose correctly and the force will be with you!"
    end

    def print_continue
        puts "Choose antoher you do? (y/n)"
    end

    def print_end
        puts "May the force be with you!!!!!!!!!!"
    end

    def prompt_selection
        gets.chomp
    end

    def valid_id?(id)
        id = id.to_i
        if id < 1 || id > Starwars.all.size
            print_error
            sleep 3
            main
        end
        id
    end

    def continue?(choice)
        if choice == "y"
            main
        else
            print_end
            exit
        end
    end


    def get_peoples_details(id)
       Api.get_peoples_details(id)
    end




end