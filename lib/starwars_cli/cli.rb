class Cli
    
    def run
        welcome
        Api.get_people
        main
    end

    def main
        print_all
        print_selection_prompt
        id = valid_id?(prompt_selection)
    end

    def print_all
        Starwars.all.each { |p| puts "#{p.id}. #{p.name}"}
    end

    def print_selection_prompt
        puts 'Select a person you do.'
    end

    def print_error
        puts "Invalid selection you put, choose correctly and the force will be with you!"
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

    def welcome
        puts "Welcome to a galaxy far far away......."
    end
end