require 'sequel'

DB = Sequel.sqlite 

DB.create_table :movies do
    primary_key :id
    String :title
    Number :rating
    String :date_watched
    Number :times_watched
end

movies = DB[:movies]

# ratings: 
=begin
 5 - best
 4 - Good
 3 - overall good
 2 - okay
 1 - bad
 0 - didn't finish   
=end


total_movies = [
    {:title => "WNUF Halloween Special", :rating => 5 , :date_watched => "10/2/2021", :times_watched => 1},
    {:title => "RiffTrax: Blood Theater", :rating => 5, :date_watched => "10/4/2021", :times_watched => 1},
    {:title => "RiffTrax: Astro-Zombies", :rating => 1, :date_watched => "10/5/2021", :times_watched => 1},
    {:title => "Killer Sofa", :rating => 3, :date_watched => "10/5/2021", :times_watched => 1},
    {:title => "A Chinese Ghost Story", :rating => 3, :date_watched => "10/6/2021", :times_watched => 1},
    {:title => "Drive Thru", :rating => 2, :date_watched => "10/7/2021", :times_watched => 1},
    {:title => "Death Machine", :rating => 3, :date_watched => "10/8/2021", :times_watched => 1},
    {:title => "Dolls", :rating => 4, :date_watched => "10/8/2021", :times_watched => 1},
    {:title => "V/H/S/94", :rating => 4, :date_watched => "10/9/2021", :times_watched => 1},
    {:title => "Z-O-M-B-I-E (Japanese dubs / no subs)", :rating => 5, :date_watched => "10/9/2021", :times_watched => 1 }
]

def generate_db_items(db, total_movies)
    for movie in total_movies
        db.insert(movie)
    end
end

generate_db_items(movies, total_movies)

puts "movie count: #{movies.count}"

puts "avg movie rating #{movies.avg(:rating)}"



# passed: database, rating direction 
# return: db in order based on direction 
def order_by_rating(db, direction)
    if direction == 'min'
        return db.order(:rating, :title)
    else
        return db.order(Sequel.desc(:rating), :title)
    end
end

puts "\n"
puts "MIN:"
order_by_rating(movies, 'min').each{|row| puts "#{row[:title]} #{row[:rating]}"}

puts "\n"
puts "MAX:"
order_by_rating(movies, 'max').each{|row| puts "#{row[:title]} #{row[:rating]}"}

    
puts "\n"


# passed: database, rating
# returned: rows from db that match passed rating value
def get_all_of_rating(db, rating)
    return db.where(Sequel.like(:rating, rating))
end

puts "\n"
puts "1* Movies: "
get_all_of_rating(movies, 1).each{|row| puts "#{row[:title]} #{row[:rating]}"}

puts "\n"
puts "2* Movies: "
get_all_of_rating(movies, 2).each{|row| puts "#{row[:title]} #{row[:rating]}"}

puts "\n"
puts "3* Movies: "
get_all_of_rating(movies, 3).each{|row| puts "#{row[:title]} #{row[:rating]}"}

puts "\n"
puts "4* Movies: "
get_all_of_rating(movies, 4).each{|row| puts "#{row[:title]} #{row[:rating]}"}

puts "\n"
puts "5* Movies: "
get_all_of_rating(movies, 5).each{|row| puts "#{row[:title]} #{row[:rating]}"}
