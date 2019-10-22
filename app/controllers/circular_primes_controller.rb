class CircularPrimesController < ApplicationController
  def index
  end

  def calculate
    if params[:number].present?
      number = params[:number].to_i

      #We look for the record with the maximum number 
      max = CircularPrime.all.order(:number).last

      if max.present?
        #If the maximum number is greater than the number we want to process, we only cut the circular primes ​​already saved in this register.
        #This way we save processing power.
        if max.number.to_i > number
          @primes = max.primes.reject {|x| x > number}
        #If the maximum number is less than the number we want to process, we only look for the circular prime numbers from the maximum number and not from 1. 
        #And we concatenate it with the circular primes ​​saved in the register.
        #Also we this way we save processing power.
        else
          @primes = max.primes.concat max.circular_primes_between(max.number.to_i,number)
          new_record = CircularPrime.new
          new_record.number = number
          new_record.primes = @primes
          new_record.save
        end
      #If there is no record we create ths first one
      else
        new_record = CircularPrime.new
        @primes = new_record.circular_primes_between(1,number)
        new_record.number = number
        new_record.primes = @primes
        new_record.save
      end
    end
    render 'index'
  end
end
