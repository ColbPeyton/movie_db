require 'sequel'
require 'csv'


DB = Sequel.sqlite 

DB.create_table :movies do
    primary_key :id
    String :title
    Number :rating
    String :date_watched
    Number :times_watched
    String :genre
end

movies = DB[:movies]

# ratings: 
=begin
 5 - best
 4 - Good
 3 - overall good
 2 - okay
 1 - bad
 0 - very bad  
 -1 - didn't finish   
=end

# get data from csv, store in hash
def get_data(path)
    data = []
    CSV.foreach(path, headers: true, col_sep: ",", header_converters: :symbol) do |row|
        data << row.to_h
    end
    return data
end

total_movies = get_data("db/movies.csv")


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
def order_by_prop(db, direction, prop)
    if direction == 'desc'
        return db.order(prop.to_sym, :title)
    else
        return db.order(Sequel.desc(prop.to_sym), :title)
    end
end

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


puts "\n"
def get_all_movies(db)
    db.all
end


puts get_all_movies(movies)
# {:id=>1, :title=>"WNUF Halloween Special", :rating=>5, :date_watched=>"10/2/2021", :times_watched=>1, :genre=>"horror"}
# {:id=>2, :title=>"RiffTrax: Blood Theater", :rating=>5, :date_watched=>"10/4/2021", :times_watched=>1, :genre=>"horror"}
# ...


puts "\n"

def get_all_of_genre(db, genre_name)
    db.where(genre: genre_name)
end

get_all_of_genre(movies, 'horror').each{|row| puts "#{row[:title]} #{row[:genre]}"}
=begin
WNUF Halloween Special horror
RiffTrax: Blood Theater horror
Rifftrax: Frankenstein Island horror
RiffTrax: Astro Zombies horror
Killer Sofa horror
A Chinese Ghost Story horror
Drive Thru horror
=end

puts "\n"

puts "get all of genre and rating"
get_all_of_genre(get_all_of_rating(movies, 2), 'horror').each{|row| puts "#{row[:title]} #{row[:genre]}  #{row[:rating]}"}
=begin
Killer Sofa horror  2
Drive Thru horror  2
RiffTrax: Bloody Pit of Horror horror  2
RiffTrax: MANOS The Hands of Fate horror  2
The VelociPastor horror  2
=end

puts "\n"
puts "alphabetical order"
def order_alphabetical(db)
    db.order(:title)
end

order_alphabetical(movies).each{|row| puts "#{row[:title]}"}


puts "\n"
puts "return only titles"
# select only title column
def get_all_titles(db)
    db.select(:title)
end

get_all_titles(movies).each{|row| puts "#{row[:title]}"}


puts "\n"
puts "titles alphabetical order"
get_all_titles(order_alphabetical(movies)).each{|row| puts "#{row[:title]}"}



puts "Desc Rating:"
order_by_prop(movies, 'desc', 'rating').each{|row| puts "#{row[:title]} #{row[:rating]}"}
puts "\n"
puts "Acc Rating:"
order_by_prop(movies, 'acc', 'rating').each{|row| puts "#{row[:title]} #{row[:rating]}"}  
puts "\n"

puts "Min Watched:"
order_by_prop(movies, 'desc', 'times_watched').each{|row| puts "#{row[:title]} #{row[:times_watched]}"}
puts "\n"
puts "Max Watched:"
order_by_prop(movies, 'acc', 'times_watched').each{|row| puts "#{row[:title]} #{row[:times_watched]}"}  
puts "\n"


def get_random(db)
    movies = get_all_movies(db)
    random = rand(db.count) - 1
    movies[random]
end

puts "Random Movie"
puts get_random(movies)[:title]


def update_prop(db, title, prop_type, prop_value )
    db.where(Sequel[:title], title ).update(prop_type.to_sym, => prop_value)
end

