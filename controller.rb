require_relative 'view'
require_relative 'recipe'
require_relative "scrap_service"
require 'byebug'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end


  def list
    display_recipes
  end

  def add_recipe
    name = @view.ask_to_user("name")
    description = @view.ask_to_user("description")
    recipe = Recipe.new(name: name, description: description)
    @cookbook.add(recipe)
  end

  def remove_task
    display_recipes
    index = @view.ask_to_user_index
    @cookbook.destroy(index)
  end

  def mark_recipe_as_done
    display_recipes
    index = @view.ask_to_user_index
    @cookbook.mark_as_done(index)
    display_recipes
  end

  def import
    keyword = @view.ask_to_user("keyword")
    scrap_recipes = ScrapService.new(keyword).call
    @view.display(scrap_recipes)
    index = @view.ask_to_user_index
    select_recipe = scrap_recipes[index]
    @cookbook.add(select_recipe)
  end


  private

  def display_recipes
    @recipes = @cookbook.all
    @view.display(@recipes)
  end



end
