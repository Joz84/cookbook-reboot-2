require_relative "controller"
require_relative "router"
require_relative "cookbook"

cookbook = Cookbook.new("recipes.csv")
controller = Controller.new(cookbook)
router = Router.new(controller)

router.run
