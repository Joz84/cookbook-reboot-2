class View

  def display(recipes)
    puts "-"*20
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? "[x]" : "[ ]"
      puts "#{index + 1}. #{done} #{recipe.name}: #{recipe.description} (#{recipe.prep_time})"
    end
    puts "-"*20
  end


  def ask_to_user(param)
    puts "#{param}?"
    print ">"
    return gets.chomp
  end

  def ask_to_user_index
    puts "index?"
    print ">"
    return gets.chomp.to_i - 1
  end
end
