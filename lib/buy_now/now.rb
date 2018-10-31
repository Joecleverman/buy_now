class BuyNow::Buy
  attr_accessor :name, :price, :availability, :url

  def self.buying
    # Scrape shop An U and then return deals based on that data
    self.scrape_buy
  end

  def self.scrape_buy
    buy = []

    buy << self.scrape_shopanu
    buy << self.scrape_shopanu1
    buy << self.scrape_shopanu2

    buy
  end


  def self.scrape_shopanu
    doc = Nokogiri::HTML(open("https://www.watchshop.com/unisex-casio-classic-leisure-alarm-chronograph-watch-a168wg-9ef-p99932788.html"))
    #binding.pry
    now = self.new
    now.name = doc.css("h1.product-indi-title.heading-font").text.strip
    now.price = doc.css("div.newprice").text.strip
    now.url = "https://www.watchshop.com/mens-watches.html"
    now.availability = true

    now
  end

  def self.scrape_shopanu1
    doc = Nokogiri::HTML(open("https://www.watchshop.com/mens-emporio-armani-chronograph-watch-ar2434-p99933242.html"))
    #binding.pry
    now = self.new
    now.name = doc.css("h1.product-indi-title.heading-font").text.strip
    now.price = doc.css("div.newprice").text.strip
    now.url = "https://www.watchshop.com/mens-watches.html"
    now.availability = true

    now
  end
  def self.scrape_shopanu2
    doc = Nokogiri::HTML(open("https://www.watchshop.com/mens-hugo-boss-governor-watch-1513484-p100013048.html"))
    #binding.pry
    now = self.new
    now.name = doc.css("h1.product-indi-title.heading-font").text.strip
    now.price = doc.css("div.newprice").text.strip
    now.url = "https://www.watchshop.com/mens-watches.html"
    now.availability = true

    now
  end
end
