require 'spec_helper'
require 'integration/numeric_validator/spec_helper'

describe 'DataMapper::Validations::Fixtures::BasketballCourt' do
  before :all do
    DataMapper::Validations::Fixtures::BasketballCourt.auto_migrate!

    @model = DataMapper::Validations::Fixtures::BasketballCourt.valid_instance
    @model.valid?
  end

  include_examples "valid model"


  describe "with length of 15.24" do
    before :all do
      @model.length = 15.24
      @model.valid?
    end

    include_examples "valid model"
  end


  describe "with length of 20.0" do
    before :all do
      @model.length = 20.0
      @model.valid?
    end

    include_examples "invalid model"

    it "has a meaningful error message" do
      expect(@model.errors.on(:length)).to eq([ 'Length must be less than or equal to 15.24' ])
    end
  end
end
