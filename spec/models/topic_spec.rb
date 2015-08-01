describe Topic do
  describe "scopes" do
    include TestFactories

    before do 
      @public_topic = Topic.create!(name: 'aasdf', public: true) # default is public
      @private_topic = Topic.create!(name: 'ajgagdkl', public: false)
    end

    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        expect(Topic.publicly_viewable).to eq( [@public_topic] )
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all private topics" do
        expect(Topic.privately_viewable).to eq( [@private_topic])
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = authenticated_user
        expect(Topic.visible_to(user)).to(eq(Topic.all))
      end

      it "returns only public topics if user is nil" do
        user = nil
        expect(Topic.visible_to(user)).to eq( [@public_topic])
      end
    end
  end
end
