class API 
   def self.get_data 
    response = RestClient.get('http://api.tvmaze.com/search/shows?q=friends')
    shows = JSON.parse(response)
    shows.each do |show|
        new_show = show["show"]
    Show.new(new_show["name"], new_show["genres"], new_show["rating"])
    
   end
#    binding.pry
   end
end