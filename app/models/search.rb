class Search

  attr_reader :guests, :view

  def initialize(params)
    @check_in = params["check_in"].first
    @check_out = params["check_out"].first
    @guests = params["guests"]
    @view = params["view"]
  end

  def check_in
    Date.parse(@check_in).strftime("%m-%d-%Y")
  end

  def check_out
    Date.parse(@check_out).strftime("%m-%d-%Y")
  end
end
