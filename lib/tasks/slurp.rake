namespace :slurp do
  desc "TODO"
  task movies: :environment do
    require "csv"
    csv_text = File.read(Rails.root.join("lib", "csvs", "movies.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      m = MovieInfo.new
      m.title         = row["title"]
      m.rating        = row["rating"]
      m.date_watched  = row["date_watched"]
      m.times_watched = row["times_watched"]
      m.genre         = row["genre"]
      m.tv_show       = row["tv_show"]
      m.save
    end
    p "movies added!"
  end

end
