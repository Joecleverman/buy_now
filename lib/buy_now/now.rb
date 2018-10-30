

class BuyNow::Buy
  attr_accessor :name, :price, :availability, :url

  def self.buying
    # Scrape shop An U and then return deals based on that data
    self.scrape_buy
  end

  def self.scrape_buy
    buy = []

    buy << self.scrape_shopanu

    buy
  end


  def self.scrape_shopanu
    doc=Nokogiri::HTML(open("https://shopanu.com"))
    #binding.pry
    now = self.new
    now.name = doc.search("h1.product_title entry-title").text.strip
    now.price = doc.search("span.woocommerce-Price-amount amount").text.strip
    now.url = "https://shopanu.com"
    now.availability = true

    now
  end
end
