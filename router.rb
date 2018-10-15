require_relative "controller"

class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      print_menu
      print ">"
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_menu
    puts "="*20
    puts "1. Lister nos recettes"
    puts "2. Ajouter des recettes"
    puts "3. Effacer des recettes"
    puts "4. Marquer la recette comme faite"
    puts "5. Importer des recettes de marmiton"
    puts "="*20
  end

  def dispatch(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add_recipe
    when 3 then @controller.remove_task
    when 4 then @controller.mark_recipe_as_done
    when 5 then @controller.import
    else
      puts "I don't understand your choice, try again"
    end
  end
end
