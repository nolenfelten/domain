require 'whois'

TLD = '.me'

File.open("./en.txt") do |file|
  file.each do |line|
    word = line.strip

    # different requirements for the word
    next if word.length <= 3
    next if word.length >= 7

    # Don't run it too often
    sleep 1 + rand(2)

    domain = "#{word}#{TLD}"
    puts domain if Whois.available?(domain)
  end
end
