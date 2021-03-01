class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def self.all
        @@all
    end

    def initialize
        self.class.all << self
    end

    def self.tres_commas_club
        self.class.all.select do |venturecapitalist|
            venturecapitalist.total_worth > 1000000000
        end
    end

    def offer_contract(startup, string, investment)
        FundingRound.new(startup, self, string, investment)
    end

    def fundingrounds
        FundingRounds.all.select do |fundinground|
            fundinground.venture_capitalist == self
        end
    end

    def portfolio
        startups = fundingrounds.each do |fundinground|
            fundinground.startup
        end
        startups.uniq
    end

    def biggest_investment
        returning_amount = 0
        fundingrounds.each do |fundinground|
            if fundinground.investment > returning_amount
                returning = fundinground
            end
        end
        fundinground
    end

    def invested(domain_string)
        returning = 0
        fundingrounds.each do |fundinground|
            if fundinground.startup.domain == domain_string
                returning = returning + fundinground.investment
            end
        end
    end

end
