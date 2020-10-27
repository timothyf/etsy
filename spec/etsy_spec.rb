require 'spec_helper'


describe Etsy do

  context "The Etsy module" do
    before(:each) do
      Etsy.instance_variable_set(:@protocol, nil)
      Etsy.instance_variable_set(:@environment, nil)
      Etsy.instance_variable_set(:@access_mode, nil)
      Etsy.instance_variable_set(:@callback_url, nil)
      Etsy.instance_variable_set(:@host, nil)
      Etsy.instance_variable_set(:@api_key, nil)
      Etsy.instance_variable_set(:@api_secret, nil)
      Etsy.instance_variable_set(:@permission_scopes, nil)
      Etsy.instance_variable_set(:@silent_errors, nil)
    end

    it "should be able to set and retrieve the API key" do
      Etsy.api_key = 'key'
      expect(Etsy.api_key).to eql('key')
    end

    it "should be able to set and retrieve the API key across threads (global)" do
      Etsy.api_key = 'key'
      Thread.new do
        expect(Etsy.api_key).to eql('key')
      end.join
    end

    it "should be able to set and retrieve the API key inside a thread (thread local)" do
      Etsy.api_key = 'key'
      Thread.new do
        Etsy.api_key = 'thread_local_key'
        expect(Etsy.api_key).to eql('thread_local_key')
      end.join
    end

    it "should be able to set and retrieve the API secret" do
      Etsy.api_secret = 'secret'
      expect(Etsy.api_secret).to eql('secret')
    end

    it "should be able to set and retrieve the API secret across threads (global)" do
      Etsy.api_secret = 'secret'
      Thread.new do
        expect(Etsy.api_secret).to eql('secret')
      end.join
    end

    it "should be able to set and retrieve the API secret inside a thread (thread local)" do
      Etsy.api_secret = 'secret'
      Thread.new do
        Etsy.api_secret = 'thread_local_secret'
        expect(Etsy.api_secret).to eql('thread_local_secret')
      end.join
    end

    # it "should be able to find a user by username" do
    #   user = stub()
    #   Etsy::User.expects(:find).with('littletjane').returns(user)
    #   user('littletjane').should eql(user
    # end

    # it "should use the https protocol by default" do
    #   expect(protocol).to eql("https")
    # end

    it "should be able to set the protocol to a valid value" do
      Etsy.protocol = 'http'
      expect(Etsy.protocol).to eql('http')
    end

    it "should raise an exception when attempting to set an invalid protocol" do
      expect(lambda { Etsy.protocol = :invalid }).to raise_error(ArgumentError)
    end

    it "should use silent errors by default" do
      expect(Etsy.silent_errors).to eql(true)
    end

    it "should be able to set silent errors to a valid value" do
      Etsy.silent_errors = false
      expect(Etsy.silent_errors).to eql(false)
    end

    it "should raise an exception when attempting to set an invalid silent errors value" do
      expect(lambda { Etsy.silent_errors = :invalid }).to raise_error(ArgumentError)
    end

    it "should use the production environment by default" do
      expect(Etsy.environment).to eql(:production)
    end

    it "should be able to set the environment to a valid value" do
      Etsy.environment = :sandbox
      expect(Etsy.environment).to eql(:sandbox)
    end

    it "should raise an exception when attempting to set an invalid environment" do
      expect(lambda { Etsy.environment = :invalid }).to raise_error(ArgumentError)
    end

    it "should know the host for the sandbox environment" do
      Etsy.environment = :sandbox
      expect(Etsy.host).to eql('sandbox.openapi.etsy.com')
    end

    it "should know the host for the production environment" do
      Etsy.environment = :production
      expect(Etsy.host).to eql('openapi.etsy.com')
    end

    it "should default to production host" do
      expect(Etsy.host).to eql('openapi.etsy.com')
    end

    it "should be able to set the callback url" do
      Etsy.callback_url = 'http://localhost'
      expect(Etsy.callback_url).to eql('http://localhost')
    end

    it "should default callback to out of band" do
      expect(Etsy.callback_url).to eql('oob')
    end

    it "should default permission scopes to an empty array" do
      expect(Etsy.permission_scopes).to eql([])
    end

    it "should be able to set the scopes" do
      Etsy.permission_scopes = %w(a_scope another_scope)
      expect(Etsy.permission_scopes).to eql(['a_scope', 'another_scope'])
    end
  end


  context "The Etsy module when set up properly" do
    before(:each) do
      Etsy.instance_variable_set(:@protocol, 'https')
      Etsy.instance_variable_set(:@environment, :sandbox)
      Etsy.instance_variable_set(:@access_mode, :read_write)
      Etsy.instance_variable_set(:@api_key, 'key')
      Etsy.instance_variable_set(:@api_secret, 'secret')
      Etsy.instance_variable_set(:@verification_request, nil)
    end

    # it "should provide a request token" do
    #   request = Etsy.stub(:request_token => 'token')
    #   expect(Etsy::VerificationRequest.stubs(:new)).to returns(request)
    #
    #   expect(Etsy.request_token).to eql('token')
    # end

    # it "should be able to generate an access token" do
    #   Etsy::SecureClient.stubs(:new).with({
    #     :request_token  => 'toke',
    #     :request_secret => 'secret',
    #     :verifier       => 'verifier'
    #   }).returns(stub(:client => 'token'))
    #
    #   expect(Etsy.access_token('toke', 'secret', 'verifier')).to eql('token')
    # end
#
#     it "should provide a verification URL" do
#       request = stub(:url => 'url')
#       Etsy::VerificationRequest.stubs(:new).returns(request)
#
#       verification_url.should eql('url'
#     end
#
#   end
#
  end

end
