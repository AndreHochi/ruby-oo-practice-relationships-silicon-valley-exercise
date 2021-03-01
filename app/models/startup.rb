class Startup
    attr_accessor :name, :domain
    attr_reader :founder
    
    @@all = []

    def self.all
        @@all
    end

    def initialize(founder)
        @founder = founder
        self.class.all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.find_by_founder(founder_name)
        self.class.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        #self.all.map do |startup|
        #    startup.domain
        #end
        return_array = []
        self.all.each do |startup|
            return_array.push(startup.domain)
        end
        return_array
    end

    def sign_contract(venturecapitalist, string, investment)
        FundingRound.new(self, venturecapitalist, string, investment)
    end

    def fundingrounds
        FundingRounds.all.select do |fundinground|
            fundinground.startup == self
        end
    end

    def num_funding_rounds
        fundingrounds.size
    end

    def total_funds
        total = 0
        fundingrounds.each do |fundinground|
            total = total + fundinground.investment
        end
        total
    end

    def investors
        venture_caps = fundingrounds.each do |fundinground|
            fundinground.venture_capitalist
        end
        venture_caps.uniq
    end

    def big_investors
        investors.select do |venturecapitalist|
            venturecapitalist.total_worth > 1000000000
        end
    end

end
