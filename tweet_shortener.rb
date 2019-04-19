require 'pry'
def word_substituter(tweet)
  dictionary = {
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
    }

  #   words = tweet.split(" ")
  #
  #   words.map{|word|
  #     if dictionary[word]
  #       dictionary[word]
  #     else
  #       word
  #     end
  #   }.join(" ")
  #
  # end

  tweet.split.collect do |word|
    if dictionary.keys.include?(word.downcase)
      word = dictionary[word.downcase]
    else
      word
    end
  end.join(" ")
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

#if tweet is over 140 characters AFTER shortening
#only display the first 130 characters and then show "..."

def shortened_tweet_truncator(tweet)
  if word_substituter(tweet).length > 140
        puts "#{(word_substituter(tweet)[0...140])} + '...'"
  elsif word_substituter(tweet).length < 140
    tweet
  end
end
binding.pry
