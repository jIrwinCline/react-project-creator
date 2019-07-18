require 'pry'
require('prime')

describe('prime') do
  it("returns 5 prime numbers when counting to 11") do
    
    expect(prime.prime_counter).to(eq(5))
  end

end
