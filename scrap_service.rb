require_relative "recipe"
require 'nokogiri'
require 'open-uri'

class ScrapService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    scrap_recipes = []
    url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{@keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    cards = doc.search(".recipe-card")
    cards.first(5).each do |card|
      name = card.search(".recipe-card__title").text.strip
      description = card.search(".recipe-card__description").text.strip
      prep_time = card.search(".recipe-card__duration__value").text.strip
      recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
      scrap_recipes << recipe
    end
    return scrap_recipes
  end
end
