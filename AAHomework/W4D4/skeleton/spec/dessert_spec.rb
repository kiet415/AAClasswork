require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef"), name: "Kiet" }
  let(:cake) { Dessert.new("cake",100, chef)}
  describe "#initialize" do
    it "sets a type" do
      expect (dessert.type).to eq ("cake")

    it "sets a quantity"
      expect (dessert.quantity).to eq (100)
    it "starts ingredients as an empty array"
      expect (dessert.quantity).to be_empty
    it "raises an argument error when given a non-integer quantity"
      expect {Dessert.new ("cake", "one", chef )}
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
    cake.add_ingredient("vanilla")
      expect (cake.ingredients) to include("vanilla"))
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["vanilla","icing", "chocolate", "strawberries"]
      ingredients.each do |ingredient|
        cake.ingredients << ingredient
      end
      expect(cake.ingredients).not_to eq(ingredients)
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
      cake.eat(20)
      expect (cake.quantity)to eq(80)
    it "raises an error if the amount is greater than the quantity"
      expect { cake.eat(500)}.to raise_error("Invalid number")
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
    allow(chef).to receive(:titleize).and_return("Chef Kiet the Great Baker")
      expect(brownie.serve).to eq("Chef Kiet the Great Baker has made 100 cake!")
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
  end
end
