require 'spec/spec_helper'

describe Another do
  it "runs" do
    mock(runner = Object.new).perform!
    mock(Another::Runner).new(['one-more']).returns(runner)
    Another.run(['one-more'])
  end
  
  describe Another::Runner do
    attr_reader :runner
    
    describe "basics" do
      before(:each) do
        @runner = Another::Runner.new(['one-more'])
      end      
      
      it "gets project_name" do
        runner.project_name.should == 'one-more'
      end

      it "gets module name" do
        runner.module_name.should == 'OneMore'
      end

      it "get target_path" do
        stub(Dir).pwd { '/User/foo' }
        runner.target_path.should == '/User/foo/one-more'
      end
    end
    
    describe "template options" do
      context "when no option specified" do
        before(:each) do
          @runner = Another::Runner.new(['one-more'])
        end
        
        it "is ruby" do
          runner.template.should == 'ruby'
        end
      end
      
      context "when --sinatra" do
        before(:each) do
          @runner = Another::Runner.new(['one-more', '--template', 'sinatra'])
        end
        
        it "is ruby" do
          runner.template.should == 'sinatra'
        end
      end
    end
    
    describe "confirmation" do
      before(:each) do
        @runner = Another::Runner.new(['one-more'])
      end
      
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