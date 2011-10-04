require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Sinatra::IndexTankExtension" do
  before(:each) do
    @app = Sinatra.new
    @app.register Sinatra::IndexTankExtension
  end

  describe "#indextank" do
    before do
      @app.indextank = "http://:private_api@private.api.indextank.com"
    end

    it "returns an IndexTank client" do
      @app.indextank.should be_kind_of(IndexTank::Client)
    end

    it "sets the indextank_url" do
      @app.indextank_url.should == "http://:private_api@private.api.indextank.com"
    end
  end

  describe "#indextank=" do
    before(:each) do
      @indextank_url = "http://:public_api@public.api.indextank.com"
      @app.stub!(:indextank).and_return(mock('indextank'))
    end

    it "sets indextank_url" do
      @app.indextank = @indextank_url
      @app.indextank_url.should == @indextank_url
    end

    it "calls #indextank to instantiate an IndexTank::Client" do
      @app.should_receive(:indextank)
      @app.indextank = @indextank_url
    end
  end
end

describe "register the extension" do
  before do
    @app = Sinatra.new
  end

  it "sets indextank_url from the environment variable" do
    @indextank_url = "http://:public_api@public.api.indextank.com"
    ENV['INDEXTANK_API_URL'] = @indextank_url
    @app.register(Sinatra::IndexTankExtension)

    @app.indextank_url.should == @indextank_url
  end
end

describe "Sinatra::IndexTankHelper" do
  before do
    @app = Sinatra.new
  end

  it "registers the helpers" do
    @app.should_receive(:helpers).with(Sinatra::IndexTankHelper)
    @app.register(Sinatra::IndexTankExtension)
  end
end