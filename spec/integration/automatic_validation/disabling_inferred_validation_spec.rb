require 'spec_helper'
require 'integration/automatic_validation/spec_helper'

describe "A class with inferred validations disabled for all properties with an option" do
  before :all do
    @klass = Class.new do
      include DataMapper::Resource

      def self.name
        'InferredValidation'
      end

      property :id,   DataMapper::Property::Serial,                     :auto_validation => false
      property :name, String,                        :required => true, :auto_validation => false
      property :bool, DataMapper::Property::Boolean, :required => true, :auto_validation => false
    end

    @model = @klass.new
  end

  describe "when instantiated w/o any attributes" do
    include_examples "valid model"
  end
end


describe "A class with inferred validations disabled for all properties with a block" do
  before :all do
    @klass = Class.new do
      include DataMapper::Resource

      def self.name
        'InferredValidation'
      end

      without_auto_validations do
        property :id,   DataMapper::Property::Serial
        property :name, String,                        :required => true
        property :bool, DataMapper::Property::Boolean, :required => true
      end
    end

    @model = @klass.new
  end

  describe "when instantiated w/o any attributes" do
    include_examples "valid model"
  end
end
