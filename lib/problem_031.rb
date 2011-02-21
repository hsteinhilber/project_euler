class Problem031

  def compute_value(two_pound=0, one_pound=0, fifty_pence=0, twenty_pence=0, ten_pence=0, five_pence=0, two_pence=0, one_pence=0)
    two_pound*200 + one_pound*100 + fifty_pence*50 + twenty_pence*20 + ten_pence*10 + five_pence*5 + two_pence*2 + one_pence
  end

  def run
    count = 0
    max_two_pound = 200 / 200
    (0..max_two_pound).each do |two_pound|
      max_one_pound = (200 - compute_value(two_pound)) / 100
      (0..max_one_pound).each do |one_pound|
        max_fifty_pence = (200 - compute_value(two_pound,one_pound)) / 50
        (0..max_fifty_pence).each do |fifty_pence|
          max_twenty_pence = (200 - compute_value(two_pound,one_pound,fifty_pence)) / 20
          (0..max_twenty_pence).each do |twenty_pence|
            max_ten_pence = (200 - compute_value(two_pound,one_pound,fifty_pence,twenty_pence)) / 10
            (0..max_ten_pence).each do |ten_pence|
              max_five_pence = (200 - compute_value(two_pound,one_pound,fifty_pence,twenty_pence,ten_pence)) / 5
              (0..max_five_pence).each do |five_pence|
                max_two_pence = (200 - compute_value(two_pound,one_pound,fifty_pence,twenty_pence,ten_pence,five_pence)) / 2
                (0..max_two_pence).each do |two_pence|
                  count += 1 # Number of one pence pieces must be the remainder, so only one possiblity
                end
              end
            end
          end
        end
      end
    end
    return count
  end
end

if $0 == __FILE__
  puts "Result: #{Problem031.new.run}"
end
