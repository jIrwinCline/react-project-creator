require 'pry'
require('prime')

describe('prime') do
  it("returns 5 prime numbers when counting to 11") do
    prime = Primes.new(11)
    expect(prime.prime_counter).to(eq(5))
  end
  it("returns 29 prime numbers when counting to 110") do
    prime = Primes.new(110)
    expect(prime.prime_counter).to(eq(29))
  end
end
