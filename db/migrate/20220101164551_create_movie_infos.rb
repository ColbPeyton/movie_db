class CreateMovieInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_infos do |t|
      t.string :title
      t.integer :rating
      t.date :date_watched
      t.string :times_watched
      t.string :genre
      t.boolean :tv_show

      t.timestamps
    end
  end
end
