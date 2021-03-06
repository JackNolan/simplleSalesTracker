class WatcherMailer < ActionMailer::Base
  default from: "y@gemifyjs.com"
  def notify_price_drop(watcher)
    @watcher = watcher
    mail(to: "jack@jacknolan.com", subject: "#{watcher.game.name} price has dropped")
  end
end
