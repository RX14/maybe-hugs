require "spec"
require "../src/maybe_hugs"

private def they(*args, &block)
  it(*args, &block)
end

private def she(*args, &block)
  it(*args, &block)
end

describe Person do
  it "accepts hugs" do
    cutie = Person.new("LUN-4", true, true)
    cutie.offer_support.should eq("LUN-4 accepts your hugs, and your kind words!")
  end

  they "might prefer empathy to contact" do
    cutie = Person.new("Snow", false, true)
    cutie.offer_support.should eq("Snow is comforted by your empathy!")
  end

  she "might prefer a hug only right now" do
    cutie = Person.new("Lis", true, false)
    cutie.offer_support.should eq("Lis accepts your hugs, but would rather not talk right now.")
  end

  she "might prefer some time alone to process" do
    cutie = Person.new("Ashlynn", false, false)
    cutie.offer_support.should eq("Ashlynn needs some time alone right now to process.")
  end

  they "can change names" do
    cutie = Person.new("A", true, true)

    cutie.name.should eq("A")
    cutie.offer_support.should eq("A accepts your hugs, and your kind words!")

    cutie.name = "B"

    cutie.name.should eq("B")
    cutie.offer_support.should eq("B accepts your hugs, and your kind words!")
  end

  she "can change her preferences" do
    cutie = Person.new("Blair", false, true)

    cutie.accepts_hugs?.should be_false
    cutie.wants_to_talk?.should be_true
    cutie.offer_support.should eq("Blair is comforted by your empathy!")

    cutie.accepts_hugs = true
    cutie.wants_to_talk = false

    cutie.accepts_hugs?.should be_true
    cutie.wants_to_talk?.should be_false
    cutie.offer_support.should eq("Blair accepts your hugs, but would rather not talk right now.")
  end
end
