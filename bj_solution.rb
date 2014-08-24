# bj_solution.rb

def calculate_total(cards)

arr = cards.map { |e| e[1] }

total = 0 

arr.each do |value|
	if value == "A"
		total += 11
	elsif value.to_i == 0 # for cards "J", "Q", "K"
		total += 10
	else
		total += value.to_i
	
	end
end

# correct for Aces

arr.select{|e| e == "A"}.count.times do

	total -=10 if total > 21
	end

total
end

# Variables definition:

suits = ["H", "D", "S", "C"] # stands for Hearts, Diamonds, Spades, Clubs

cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

deck = suits.product(cards) #p deck.count => 52 cards

deck.shuffle! # mutates the deck

# Testing dealing the player's 1 cards and dealer cards....

d_cards = []
p1_cards = []      

p d_cards << deck.pop 
p p1_cards << deck.pop
p d_cards << deck.pop
p p1_cards << deck.pop

p	dtotal = calculate_total(d_cards)
p "Dealer has #{dtotal}."

p p1total = calculate_total(p1_cards)
p "Player 1 has #{p1total}."

# Verify if Dealer has black jack.

	if 
	dtotal == 21 && p1total < 21 
	puts "Black Jack - Dealer wins!" 
	exit
	
	elsif 

		p1total == 21 && dtotal <21 
		puts "Black Jack - Player 1 wins!!!! "
		exit
	
	else
	puts "What would you like to do? 1) hit 2) stay"
	
end
	
	while p1total < 21
 	
 	hit_or_stay = gets.chomp

	if !['1', '2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end

  ######   Player 1 - hit
  
  new_card = deck.pop
  puts "Dealing card to player: #{new_card}"
  p1_cards << new_card
  p1total = calculate_total(p1_cards)
  puts "Your total is now: #{p1total}"

  if p1total == 21
    puts "Congratulations, you hit blackjack! You win!"
    exit
  elsif p1total > 21
    puts "Sorry, it looks like you busted!"
    exit
  end
end

	###### Dealer's turn

while dtotal < 17
	

	new_card = deck.pop
  puts "Dealing card to dealer: #{new_card}"
  d_cards << new_card
  dtotal = calculate_total(d_cards)
  p dtotal
  p "Dealer sums #{dtotal} now..."

	if dtotal == 21
    puts "Aww...dealer wins!!"
    exit
  elsif dtotal > 21

    puts "Dealer busted! You won!!!!"
    exit

 		end
	end

 # Now we must compare hands

	if p1total > dtotal
		p "Player 1 wins!!"
		
	else
	p "Dealer wins!!"
		
	end
	
