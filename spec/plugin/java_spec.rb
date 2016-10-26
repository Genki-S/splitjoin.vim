require 'spec_helper'

describe "java" do
  let(:filename) { 'test.java' }

  before :each do
    vim.set(:expandtab)
    vim.set(:shiftwidth, 2)
  end

  specify "function arguments" do
    set_file_contents <<-EOF
      void myFunction(final int a, final int b, final int c, @Value(1) final int d) {
        System.out.println("Hello, World");
      }
    EOF

    vim.search 'int a'
    split

    assert_file_contents <<-EOF
      void myFunction(
          final int a,
          final int b,
          final int c,
          @Value(1) final int d
      ) {
        System.out.println("Hello, World");
      }
    EOF
  end
end
