class Person
  property name : String
  property? accepts_hugs : Bool
  property? wants_to_talk : Bool

  def initialize(@name, @accepts_hugs, @wants_to_talk)
  end

  def offer_support
    case {accepts_hugs?, wants_to_talk?}
    when {true, true}
      "#{name} accepts your hugs, and your kind words!"
    when {true, false}
      "#{name} accepts your hugs, but would rather not talk right now."
    when {false, true}
      "#{name} is comforted by your empathy!"
    when {false, false}
      "#{name} needs some time alone right now to process."
    end
  end
end
