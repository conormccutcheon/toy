p "What's 15*63?" 
gets.chomp
p "... sorry too slow. No job at Goldman for you." 
gets.chomp
p "Want to get faster?"
gets.chomp
p "Welcome to the Times Tables Trainer." 
p "Press enter to begin"
gets.chomp



@game = Proc.new do

p "We're now going to discuss the range of tables you want to do"
p "Lower limit: If you're pretty confident on your ones, but need to work on your twos, enter '2'. You get the idea."
@low = gets.chomp.to_i

p "Upper limit: if you don't care to learn anything above 99*99, enter '99'. I suggest something lower though"
@high = gets.chomp.to_i

p "How many questions do you want?"
@qnum = gets.chomp.to_i

p "Alright, Let's go!"
p "Press enter to begin"
gets.chomp

@wrongarray = []
@wrongarray2 = []

@end = Proc.new do
	puts"____________________________________________________"
	puts
	puts "A 'Conor Wishes He Could Do His Tables' production"
	puts"____________________________________________________"
end

@qgen = Proc.new do
	@starttime = Time.now
	n = @qnum.to_i
	for i in 1..n do 
		@start = Time.now
			a1 = rand(@low...@high)
			a2 = rand(@low...@high)

			p "#{a1} x #{a2}"
			ans = gets.chomp.to_i
			if ans == a1 * a2
			else 
				@wrongarray += [a1]
				@wrongarray += [a2]
			end
			@fin = Time.now
		p "Done in #{@fin - @start} seconds"
		if ans == a1 * a2
			p "And Correct!"
		else p "...Wrong though"
		end
	end
	@endtime = Time.now
	@totalwrong = @wrongarray.length/2
	@report.call
end

@incorrect = Proc.new do
	@totalwrong = @wrongarray.length/2
	@starttime = Time.now
	p "Ready? Press Enter to have another go at the ones you got wrong."
	gets.chomp
	i=0
	while i <= (@totalwrong+2)
		@start=Time.now
		a1 = @wrongarray[i]
		a2 = @wrongarray[i+1]

		p "#{a1} x #{a2}"
			ans = gets.chomp.to_i
		if ans == a1 * a2
		else 
			@wrongarray2 += [a1]
			@wrongarray2 += [a2]
		end
		@fin=Time.now
		i = i + 2
		p "Done in #{@fin - @start} seconds"
		if ans == a1 * a2
			p "And Correct!"
		else p "...Wrong though"
		end
	end
	@endtime = Time.now
	p "Done in #{@fin - @start} seconds"
	@qnum = @totalwrong
	@totalwrong = @wrongarray.length/2
	@report.call
end

@report = Proc.new do
	p 
	p "__________REPORT__________"
	p "You got  #{@qnum - (@totalwrong)} out of #{@qnum}  correct"
	p "You took  #{@endtime - @starttime}  to complete the exercise."
	p "That's an average of #{(@endtime - @starttime)/@qnum} seconds."
	if @wrongarray.length==0
		p "Do you want play again? Type 'yes' if so. Press any key otherwise"
		ans = gets.chomp
		if ans == "yes"
			@game.call
		else "Peace out nigga!"
			@end.call
		end
	else
		p "If you want to have another go at the answers you got wrong, type 'yes'. Otherwise press any key."
		keypressed = gets.chomp

		if keypressed == "yes"
			@incorrect.call

		else p "Peace out nigga!"
			@end.call
		end
	end
end

@qgen.call
end





@game.call

