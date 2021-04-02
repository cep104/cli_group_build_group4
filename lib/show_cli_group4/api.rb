class API 
   def self.get_data(input) 
    response = RestClient.get("http://api.tvmaze.com/search/shows?q=#{input}")
    shows = JSON.parse(response)
    shows.each do |show|
        new_show = show["show"]
      #   binding.pry
    Show.new(new_show)
   end
   #  binding.pry
   end
end