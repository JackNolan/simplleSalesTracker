require 'open-uri'
desc "Scrape the steam search page to generate games"
task :check_prices => [:environment] do

  def page_doc(url, page_elements,i,n)
    begin
      Nokogiri::HTML(open(url))/page_elements
    rescue Exception => e
      puts "#{e} attempt number #{i}"
      sleep(25)
      i += 1
      page_doc(url, page_elements,i,n) unless i == n
    end
  end

  def scrape_page(current_page)
    (current_page/".search_result_row").each do |row|
      name = (row/".search_name > h4").inner_text.gsub(/[^ -~]/i,"")
      price = (row/".search_price").children.last.to_s.gsub(/[^0-9]/, '').to_f / 100.0
      url = row.attr('href')
      game = Game.find_or_initialize_by_name(name)
      game.price = price
      game.url = url 
      game.save 
      Watcher.find_all_by_game_id(game).each do |watcher|
        if price <= watcher.price
          puts "removing"
          WatcherMailer.notify_price_drop(watcher).deliver
          watcher.delete
        end
      end
    end
  end

  base_url = "http://store.steampowered.com/search/results?category1=998&sort_order=ASC&snr=1_7_7_230_7&page="
  index_body_text = page_doc("#{base_url}1",".search_pagination_right",0,3).inner_text      
  last_search_page_number = index_body_text.match(/\d{2}/).to_s
  puts last_search_page_number
  for i in 1..last_search_page_number.to_i
    puts base_url + i.to_s
    current_page = page_doc("#{base_url + i.to_s}","body",0,3)    
    scrape_page(current_page)
  end
end