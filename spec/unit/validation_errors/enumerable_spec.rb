# -*- coding: utf-8 -*-
require 'spec_helper'

describe 'DataMapper::Validations::ValidationErrors' do
  before :each do
    @model = DataMapper::Validations::ValidationErrors.new(Object.new)
    @model.add(:ip_address, "must have valid format")
    @model.add(:full_name, "can't be blank")
  end

  describe "#each" do
    it "iterates over properties and yields error message arrays" do
      params = []
      @model.each do |param|
        params << param
      end

      expect(params).to eq([ [ 'must have valid format' ], [ "can't be blank" ] ])
    end
  end


  describe "#map" do
    before :each do
      @model.add(:ip_address, "must belong to a local subnet")
    end
    it "maps error message arrays using provided block" do
      projection = @model.map { |ary| ary }
      expect(projection).to eq([ [ 'must have valid format', 'must belong to a local subnet' ], [ "can't be blank" ] ])
    end
  end
end
