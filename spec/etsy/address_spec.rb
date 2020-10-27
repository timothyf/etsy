require 'spec_helper'


describe Etsy::Address do


  context "The Address class" do

    # it "should be able to find a user's addresses" do
    #   addresses = mock_request('/users/littletjane/addresses', {}, 'Address', 'getUserAddresses.json')
    #   Address.find('littletjane').should == addresses
    # end

  end

  context "An instance of the Address class" do

    context "with response data" do
      before(:each) do
        data = read_fixture('address/getUserAddresses.json')
        @address = Etsy::Address.new(data.first)
      end

      it "should have a value for :id" do
        expect(@address.id).to eql(123)
      end

      it "should have a value for :name" do
        expect(@address.name).to eql("Tinker Bell")
      end

      it "should have a value for :first_line" do
        expect(@address.first_line).to eql("123 Fake St.")
      end

      it "should have a value for :second_line" do
        expect(@address.second_line).to eql(nil)
      end

      it "should have a value for :city" do
        expect(@address.city).to eql('BigCity')
      end

      it "should have a value for :state" do
        expect(@address.state).to eql('XX')
      end

      it "should have a value for :zip" do
        expect(@address.zip).to eql('12345')
      end

      it "should have a value for :country" do
        expect(@address.country).to eql('United States')
      end

      it "should have a value for :country_id" do
        expect(@address.country_id).to eql(209)
      end
    end
  end
end
