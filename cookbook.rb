require 'csv'
require_relative "recipe"

class Cookbook
  def initialize(csv_path)
    @recipes = []
    @csv_path = csv_path
    load_csv
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    write_csv
  end

  def destroy(id)
    @recipes.delete_at(id)
    write_csv
  end

  def mark_as_done(id)
    recipe = @recipes[id]
    recipe.done!
    write_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:done] = row[:done] == "true"
      @recipes << Recipe.new(row)
    end
  end

  def write_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ["name", "description", "done", "prep_time"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.done?, recipe.prep_time]
      end
    end
  end

end
