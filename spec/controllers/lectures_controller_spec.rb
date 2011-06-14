require 'spec_helper'

describe LecturesController do

  def valid_attributes
    {}
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
      get :show, :id => lecture.id.to_s
      assigns(:lecture).should eq(lecture)
    end
  end

  describe "GET new" do
    it "assigns a new lecture as @lecture" do
      get :new
      assigns(:lecture).should be_a_new(Lecture)
    end
  end

  describe "GET edit" do
    it "assigns the requested lecture as @lecture" do
      lecture = Lecture.create! valid_attributes
      get :edit, :id => lecture.id.to_s
      assigns(:lecture).should eq(lecture)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Lecture" do
        expect {
          post :create, :lecture => valid_attributes
        }.to change(Lecture, :count).by(1)
      end

      it "assigns a newly created lecture as @lecture" do
        post :create, :lecture => valid_attributes
        assigns(:lecture).should be_a(Lecture)
        assigns(:lecture).should be_persisted
      end

      it "redirects to the created lecture" do
        post :create, :lecture => valid_attributes
        response.should redirect_to(Lecture.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved lecture as @lecture" do
        Lecture.any_instance.stub(:save).and_return(false)
        post :create, :lecture => {}
        assigns(:lecture).should be_a_new(Lecture)
      end

      it "re-renders the 'new' template" do
        Lecture.any_instance.stub(:save).and_return(false)
        post :create, :lecture => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested lecture" do
        lecture = Lecture.create! valid_attributes
        Lecture.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => lecture.id, :lecture => {'these' => 'params'}
      end

      it "assigns the requested lecture as @lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, :id => lecture.id, :lecture => valid_attributes
        assigns(:lecture).should eq(lecture)
      end

      it "redirects to the lecture" do
        lecture = Lecture.create! valid_attributes
        put :update, :id => lecture.id, :lecture => valid_attributes
        response.should redirect_to(lecture)
      end
    end

    describe "with invalid params" do
      it "assigns the lecture as @lecture" do
        lecture = Lecture.create! valid_attributes
        Lecture.any_instance.stub(:save).and_return(false)
        put :update, :id => lecture.id.to_s, :lecture => {}
        assigns(:lecture).should eq(lecture)
      end

      it "re-renders the 'edit' template" do
        lecture = Lecture.create! valid_attributes
        Lecture.any_instance.stub(:save).and_return(false)
        put :update, :id => lecture.id.to_s, :lecture => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested lecture" do
      lecture = Lecture.create! valid_attributes
      expect {
        delete :destroy, :id => lecture.id.to_s
      }.to change(Lecture, :count).by(-1)
    end

    it "redirects to the lectures list" do
      lecture = Lecture.create! valid_attributes
      delete :destroy, :id => lecture.id.to_s
      response.should redirect_to(lectures_url)
    end
  end

end

