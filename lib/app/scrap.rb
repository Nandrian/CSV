class Scrap
    attr_accessor :mairie_list

    def initialize
        @mairie_list = []
    end
    def get_townhall_email(townhall_url)
        @mairie_list = Array.new # This will create a Array
        $url.each do |link|
            page1 = Nokogiri::HTML(URI.open(link))
            page1.xpath('/html').each do |x|
                @collect_info = { # Create hash include mail & city
                    @email = x.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text => 
                    @city = x.xpath('/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a').text
                }
                @mairie_list << @collect_info
                puts "Scrap #{@collect_info[@email]} in progress"
            end
        end
        puts "\n" + "Finish scrapping #{$amount_links}"
    end

    # This will get all link with mail and count all link too
    def get_townhall_urls
        page2 = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
        page2.css('html').each do |x|
            $url = page2.css('a.lientxt').map{ |link| "http://annuaire-des-mairies.com" + link['href'].delete_prefix('.')}
            puts "Finish to store all links"
            puts ""
            $amount_links = $url.count
        end
        puts get_townhall_email($url)
    end
    
    # Saving file as:
    def save_as_csv
        csv = File.open("db/scrap.csv","wb")
        @mairie_list.each do |line|
            line.each do |mairie, email|
                csv.puts ("#{mairie},#{email}")
            end
        end
    end

    def save_as_json
		json_hash = @mairie_list
		File.open("db/scrap.json","w") do |f|
		  f.write(json_hash.to_json)
		end
	end
end