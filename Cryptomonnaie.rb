require 'open-uri'
require 'nokogiri'


def get_all_the_cryptomoneys(page_url)

    doc = Nokogiri::HTML(open(page_url))
    cours_cryptomonnnaies = []
    tableau = doc.css("#currencies-all tbody tr") # recupere dans tableau tous les fichiers dans <tr> </tr>
    for i in 0...tableau.length do # parcoure chaque fichier dans tableau
        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ") # pusher chaque element deja filtré dans cours_cryptomonnai
        cours_cryptomonnnaies.push({ 
            :name => x[2],
            :symbol => x[1],
            :market_cap => x[4],
            :price => x[5],
            :circulating_supply => x[6],
            :volume => x[7],
            :percent_1_h => x[8],
            :percent_24_h => x[9],
            :percent_7_d =>x[10]
        }) 
        puts cours_cryptomonnnaies
        puts "\nVEUILLEZ PATIENTEZ --------------- VEUILLEZ PATIENTEZ ---------VEUILLEZ PATIENTEZ\n"
    end
    cours_cryptomonnnaies
end


while 0 < 1 do
    puts get_all_the_cryptomoneys("https://coinmarketcap.com/all/views/all/")
    sleep 3600
end