class Watcher < ActiveRecord::Base
  attr_accessible :email, :game_name, :price
  belongs_to :game
  validates :game_id , :numericality => { :only_integer => true, :message => "not found" }
  validates :price , :numericality => { :greater_than_or_equal_to => 0 }
  validates :email , :format => { :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i }
  def send_notification
  end
  def game_name=(game_name)
    self.game = Game.find_by_name(game_name)
  end
  def game_name
  end
end
