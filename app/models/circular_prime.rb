class CircularPrime < ApplicationRecord
  serialize :primes
  def primes_between(number_start,number_end)
    number_end.primes number_start
  end

  def circular_primes_between(number_start,number_end)
    circular_primes = []
    primes_between(number_start,number_end).each do |x|
      #If the prime has 1 digit is always circular prime
      if x.to_s.size == 1
        circular_primes.push(x)
      elsif is_circular_prime(x)
        circular_primes.push(x)
      end
    end
    puts circular_primes.to_s
    return circular_primes
  end

  def is_circular_prime(x)
    puts 'x = '+x.to_s
    puts 'Permutations = '+digit_permutations(x).to_s
    digit_permutations(x).each do |y|
      puts 'y = '+y.to_s
      if y.prime?
        puts 'is prime'
      else
        puts 'is not prime'
        return false
      end
    end
    return true
  end

  def digit_permutations(number)
    number.to_s.split("").length.times.map{|el| number.to_s.split("").rotate(el).join.to_i }
    #number.to_s.chars.to_a.permutation.map(&:join).map(&:to_i).uniq
  end
end
