class Api
    BASE_URL = 'https://swapi.dev/api/people/'

    def self.get_people
        res = RestClient.get(BASE_URL)
        data = JSON.parse(res.body)
        data['results'].each do |element|
            name = element["name"]
            id = element['url'].split('/')[-1]
            height = element["height"]
            mass = element["mass"]
            gender = element["gender"]
            Starwars.new(name, id, height, mass, gender)
        end 
    end

    def self.get_peoples_details(id)
        selected_people = Starwars.find_by_id(id)
        res = RestClient.get("#{BASE_URL}""#{id}")
        data = JSON.parse(res.body) 
        name = data["name"]
        height = data["height"]
        mass = data["mass"]
        gender = data["gender"]
        selected_people.update(height, mass, gender)
        selected_people
    end

end