require 'spec_helper'

describe LecturesController do

  def valid_attributes
    {
      name: "Lecture Ruby on Rails in Action",
      description: "Lorem ipsum dolor sit amet",
      positive_vote: 1,
      negative_vote: 1,
      user_id: 1,
      event_id: 1
    }
  end

  describe "GET index" do
    it "assigns all lectures as @lectures" do
      lecture = Lecture.create! valid_attributes
      get :index
      assigns(:lectures).should eq([lecture])
    end
  end

  describe "GET show" do
    it "assigns the requested lecture as @lecture" do
      lecture = Lecture.create! valid_attributes
      get :show, :id => lecture.to_param
      assigns(:lecture).should eq(lecture)
    end
  end

  describe "GET edit" do
    it "assigns the requested lecture as @lecture" do
      lecture = Lecture.create(valid_attributes)
      get :edit, :id => lecture.to_param
      assigns(:lecture).should eq(lecture)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Lecture" do
        expect {
          Lecture.create(valid_attributes)
        }.to change(Lecture, :count).by(1)
      end

      it "assigns a newly created lecture as @lecture" do
        Lecture.create(valid_attributes)
        be_a(Lecture)
        be_persisted
      end

      it "redirects to the created lecture" do
        Lecture.create(valid_attributes)
        redirect_to(Lecture.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lecture as @lecture" do
        Lecture.any_instance.stub(:save).and_return(false)
        Lecture.create(valid_attributes{})
        be_a_new(Lecture)
      end

      it "re-renders the 'new' template" do
        Lecture.any_instance.stub(:save).and_return(false)
        Lecture.create(valid_attributes{})
        render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested lecture" do
        lecture = Lecture.create! valid_attributes
        Lecture.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => lecture.to_param, :lecture => {'these' => 'params'}
      end

      it "assigns the requested lecture as @lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, :id => lecture.to_param, :lecture => valid_attributes
        assigns(:lecture).should eq(lecture)
      end

      it "redirects to the lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, :id => lecture.to_param, :lecture => valid_attributes
        response.should redirect_to(lecture)
      end
    end

    describe "with invalid params" do
      it "assigns the lecture as @lecture" do
        lecture = Lecture.create! valid_attributes
        Lecture.any_instance.stub(:save).and_return(false)
        put :update, :id => lecture.to_param, :lecture => {}
        assigns(:lecture).should eq(lecture)
      end

      it "re-renders the 'edit' template" do
        lecture = Lecture.create! valid_attributes
        Lecture.any_instance.stub(:save).and_return(false)
        put :update, :id => lecture.to_param, :lecture => {}
        render_template("edit")
      end
    end
  end

end

