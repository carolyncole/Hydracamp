require 'spec_helper'

describe Zombie do
  it "should have a name" do
    subject.name = "Ash"
    subject.name.should == "Ash"
  end
  it "should have a graveyard" do
    subject.graveyard = "Yard"
    subject.graveyard.should == "Yard"
  end
  it "should validate that the name is present" do
    subject.should_not be_valid
    subject.errors[:name].first.should == "can't be blank"
    subject.name = "Ash"
    subject.should be_valid
  end
  it "should validate that the name is unique" do
    subject.name = "Ash"
    subject.save!
    az = Zombie.new(:name=>"Ash")
    az.should_not be_valid
    az.errors[:name].first.should == "has already been taken"
    az.name = "AAsh"
    az.should be_valid
  end
end
