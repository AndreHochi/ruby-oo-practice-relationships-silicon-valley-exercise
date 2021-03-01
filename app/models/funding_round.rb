class FundingRound

    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist, :investment

    @@all = []

    def self.all
        @@all
    end

    def initialize(startup, venturecapitalist, type, investment)
        @startup = startup
        @venture_capitalist = venturecapitalist
        @type = type
        @investment = investment
        self.class.all << self
    end

    def investment=(amount)
        @investment = amount
    end

end
