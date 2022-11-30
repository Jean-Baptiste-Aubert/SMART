require "awesome_print"
require "nokogiri"
require "open-uri"
require "json"

# class ScrapLeLouvreService
#   BASE_URL = "https://collections.louvre.fr".freeze

#   def call
#     # 1..10.times do |page_number|
#     #   url = "https://collections.louvre.fr/recherche?page=#{page_number}&q=original"
#     #   scrap(url)
#     # end
#     url = "https://collections.louvre.fr/recherche?page=1q=original"
#     scrap(url)
#   end

#   def scrap(url)
#     html_doc = Nokogiri::HTML(URI(url).read)
#     href = html_doc.search(".h_4").first
#     toto = href["href"]
#     get_data(toto)
#   end

#   def get_data(path)
#     url = "https://collections.louvre.fr#{path}.json"
#     var = "https://collections.louvre.fr/ark:/53355/cl010030415.json"
#     serialized_path = File.read(var)
#     toto = JSON.parse(serialized_path)
#     puts toto


#     # puts data[:title]
#     # puts data
#     # paths.each do |path|
#     #   url = BASE_URL + path + ".json"
#     #   file = URI(url).read
#     #   data = JSON.parse(file)
#     #  #create_ark(data)
#     #   puts data[:title]
#     # end
#   end

#   def get_hrefs(html_doc)
#     html_doc.search(".card__title").map do |element|
#       element[:href]
#     end
#   end

#   # def create_ark(data)
#     # name = data["title"] if data["title"].length < 10
#     # Ark.create!(
#       # name: name,
#     # )
#   # end

# #   def create(data)
# #     Ark.where(name: data[:title]).first_or_create(description: data[:objectHistory], image: data[:urlImage], )
# #   end
# end

require "awesome_print"
require "nokogiri"
require "open-uri"
require "json"

class ScrapLeLouvreService
  BASE_URL = "https://collections.louvre.fr".freeze

  def call
    1..10.times do |page_number|
      url = "https://collections.louvre.fr/recherche?page=#{page_number}&q=original"
      scrap(url)
    end
  end

  def scrap(url)
    html_doc = parse_html(url)
    hrefs = get_hrefs(html_doc)
    get_data(hrefs)
    return "rien"
  end

  def parse_html(url)
    html_file = URI(url).read
    html_doc = Nokogiri::HTML(html_file)
  end

  def get_data(paths)
    paths.each do |path|
      url = BASE_URL + path + ".json"
      file = URI(url).read
      data = JSON.parse(file)
      # create_instrument(data)
      if data["relatedWork"].any?
        if data["relatedWork"].select {|h| h["type"] == "Copie"}.any?
          p  data["relatedWork"]
        end
      end
    end
  end

  def get_hrefs(html_doc)
    paths = html_doc.search(".card__title a").map do |element|
      element[:href]
    end
  end

  # def create_instrument(data)
  #   name = data["title"] if data["title"].length < 10
  #   Ark.create!(
  #     name: name,
  #   )
  # end
end
