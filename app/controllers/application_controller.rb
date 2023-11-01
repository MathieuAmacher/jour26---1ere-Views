class ApplicationController < ActionController::Base
    def welcome
        @gossips = Gossip.all
    end
end
