class WatcherMailer < ActionMailer::Base
  default from: "services@flatironschool.com"
  def notify_price_drop(watcher)
    @watcher = watcher
    mail(to: "jack@jacknolan.com", subject: "#{watcher.game.name} price has dropped")
  end
end
