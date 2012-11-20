class WatcherMailer < ActionMailer::Base
  default from: "services@flatironschool.com"
  def notify_price_drop(watcher)
    @watcher = watcher
    mail(to: "#{watcher.email}", subject: "#{watcher.game.name} price has dropped")
  end
end
