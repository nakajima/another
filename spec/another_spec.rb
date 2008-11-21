require 'spec/spec_helper'

describe Another do
  it "runs" do
    mock(Another::Runner).new(['one-more'])
    Another.run(['one-more'])
  end
  
  describe Another::Runner do
    attr_reader :runner
    
    before(:each) do
      @runner = Another::Runner.new(['one-more'])
    end
    
    it "gets project_name" do
      runner.project_name.should == 'one-more'
    end
    
    it "gets module name" do
      runner.module_name.should == 'OneMore'
    end
    
    it "get target_directory" do
      stub(Dir).pwd { '/User/foo' }
      runner.target_directory.should == '/User/foo/one-more'
    end
    
    describe "confirmation" do
      context "when yes" do
        it "is confirmed" do
          stub($stdin).gets { "y" }
          runner.should be_confirmed
        end
      end
      
      context "when no" do
        it "is not confirmed" do
          stub($stdin).gets { "n" }
          runner.should_not be_confirmed
        end
      end
      
      context "when blank" do
        it "it is not confirmed" do
          stub($stdin).gets { '' }
          runner.should_not be_confirmed
        end
      end
    end
  end
end