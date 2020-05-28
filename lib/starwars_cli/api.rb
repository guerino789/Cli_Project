class Api
    BASE_URL = 'https://swapi.dev/api/people/'

    def self.get_people
        res = RestClient.get(BASE_URL)
        data = JSON.parse(res.body)
        data['results'].each do |people|
            name = people['name']
            id = people['url'].split('/')[-1]
            Starwars.new(name, id)
        end 
    end
end