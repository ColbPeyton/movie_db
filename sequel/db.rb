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



