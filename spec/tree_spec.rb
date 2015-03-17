require_relative '../lib/tree'

describe Node do
  describe "initialization" do
    it "should be initializable with a value" do
      expect(Node.new(2)).to be_a Node
    end

    it "should have a value after initialization" do
      expect(Node.new(2).value).to eq(2)
    end

    it "should have a nil left node" do
      expect(Node.new(2).left).to be_nil
    end

    it "should have a nil right node" do
      expect(Node.new(2).right).to be_nil
    end

    it "should not have a writable value" do
      expect{Node.new(2).value=(3)}.to raise_error(NoMethodError)
    end
  end
end

describe Tree do
  describe "initialization" do
    it "should be initializable with a value" do
      expect(Tree.new(2)).to be_a Tree
    end

    it "should have a root node" do
      expect(Tree.new(2).root).to be_a Node
    end

    it "should have a root node value with which tree was initialized" do
      expect(Tree.new(2).root.value).to eq(2)
    end
  end

  describe "insertion" do
    before do
      @tree = Tree.new(2)
    end
    
    it "should insert a node whose value is lt root to the left" do
      @tree.insert(0)
      expect(@tree.root.left.value).to eq(0)
    end

    it "should insert a node whose value is gt root to the right" do
      @tree.insert(4)
      expect(@tree.root.right.value).to eq(4)
    end

    it "should insert more than one node to the left" do
      @tree.insert(0)
      @tree.insert(-2)
      @tree.insert(-4)

      expect(@tree.root.left.left.left.value).to eq(-4)
    end

    it "should insert more than one node to the right" do
      @tree.insert(4)
      @tree.insert(6)
      @tree.insert(8)

      expect(@tree.root.right.right.right.value).to eq(8)
    end

    it "should insert more than one node to the left or right" do
      @tree.insert(0)
      @tree.insert(-2)
      @tree.insert(4)
      @tree.insert(-3)
      @tree.insert(6)
      @tree.insert(3)
      @tree.insert(5)
      @tree.insert(-1)

      # left subtree
      expect(@tree.root.left.left.left.value).to eq(-3)
      expect(@tree.root.left.left.value).to eq(-2)
      expect(@tree.root.left.left.right.value).to eq(-1)
      expect(@tree.root.left.value).to eq(0)

      # right subtree
      expect(@tree.root.right.right.left.value).to eq(5)
      expect(@tree.root.right.right.value).to eq(6)
      expect(@tree.root.right.left.value).to eq(3)
      expect(@tree.root.right.value).to eq(4)

      # root
      expect(@tree.root.value).to eq(2)
    end
  end
end