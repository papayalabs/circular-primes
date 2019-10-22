require 'prime'

class Euler35
  def is_circular?(num)
    circulars_for(num).all?{ |el| ::Prime.instance.prime?(el) }
  end

  def circulars_for(a)
    a.to_s.split("").length.times.map{|el| a.to_s.split("").rotate(el).join.to_i }
  end

  def how_many
    circulars = []
    ::Prime.each(10_000_000) do |num|
      continue if circulars.include?(num)
      if is_circular?(num)
        circulars << circulars_for(num)
      end
    end
    circulars.count
  end
end
puts Euler35.new.how_many
