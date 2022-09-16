class Janken

  def input(call1, call2)
    puts "#{call1}"
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    @input_hand = gets.to_i
    puts "#{call2}"
    puts "--------------------"
  end

  def select_hand
    hands = ["グー", "チョキ", "パー"]
    case @input_hand
    when 0
      @my_hand = hands[0]
    when 1
      @my_hand = hands[1]
    when 2
      @my_hand = hands[2]
    else
      @my_hand = nil
    end

    @rival_hand = hands.sample
  end

  def janken_result
    puts "あなた：#{@my_hand}を出しました"
    puts "相手：#{@rival_hand}を出しました"
    puts "--------------------"
  end

  def hoi
    angles = ["上", "下", "左", "右"]
    puts "あっち向いて"
    puts "0(上)1(下)2(左)3(右)"
    input_angle = gets.to_i
    puts "ほい"
    puts "--------------------"

    case input_angle
    when 0
      @my_angle = angles[0]
    when 1
      @my_angle = angles[1]
    when 2
      @my_angle = angles[2]
    when 3
      @my_angle = angles[3]
    else
      @my_angle = nil
    end

    @rival_angle = angles.sample
  end

  def janken_hoi
    loop do
      input("じゃんけん", "ぽん")
      select_hand
      break if @my_hand == nil
      janken_result

      while @my_hand == @rival_hand
        input("あいこで", "しょ")
        select_hand
        break if @my_hand == nil
        janken_result
      end
      break if @my_hand == nil

      hoi
      break if @my_angle == nil
      puts "あなた：#{@my_angle}"
      puts "相手：#{@rival_angle}"
      puts "--------------------"
      break if @my_angle == @rival_angle
    end

    win = (@my_hand == "グー" && @rival_hand == "チョキ") ||
          (@my_hand == "チョキ" && @rival_hand == "パー") ||
          (@my_hand == "パー" && @rival_hand == "グー")
    lose = (@my_hand == "グー" && @rival_hand == "パー") ||
           (@my_hand == "チョキ" && @rival_hand == "グー") ||
           (@my_hand == "パー" && @rival_hand == "チョキ")
    if @my_hand == nil || @my_angle == nil
      puts "……"
    elsif win
      puts "YOU WIN"
    elsif lose
      puts "YOU LOSE"
    else
      puts "このメッセージが見れるのはおかしいよ"
    end
  end

end

Janken.new.janken_hoi