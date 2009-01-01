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
      it "knows available templates" do
        runner = Another::Runner.new(['one-more'])
        runner.should have(3).available_templates
        runner.available_templates.should include('js', 'ruby', 'sinatra')
      end
      
      it "raises error when template invalid" do
        runner = Another::Runner.new(['one-more', '--template', 'FOO'])
        proc {
          runner.perform!
        }.should raise_error(Another::InvalidTemplate)
      end
      
      context "when no option specified" do
        before(:each) do
          @runner = Another::Runner.new(['one-more'])
        end
        
        it "is ruby" do
          runner.template.should == 'ruby'
        end
      end
      
      context "when specified" do
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