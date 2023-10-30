class StaticPagesController < ApplicationController
  def home
    @random_name = Faker::Superhero.power
    "#{@random_name}"

    @gossips = Gossip.all
  end

  
  def team
  end

  def contact
  end

  def gossip
  end

end
