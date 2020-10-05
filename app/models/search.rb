class Search

  attr_reader :check_in, :check_out, :guests, :view

  def initialize(params)
    @check_in = params["check_in"].first
    @check_out = params["check_out"].first
    @guests = params["guests"]
    @view = params["view"]
  end

  def check_in_formatted
    Date.parse(@check_in).strftime("%m-%d-%Y")
  end

  def check_out_formatted
    Date.parse(@check_out).strftime("%m-%d-%Y")
  end

  def num_nights
    (Date.parse(@check_out) - Date.parse(@check_in)).to_i
  end

  def total_cost(price)
    num_nights * price
  end
end
