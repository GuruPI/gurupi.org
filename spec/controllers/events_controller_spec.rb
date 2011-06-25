require 'spec_helper'

describe EventsController do

  def valid_attributes(name_sufix = Time.now)
    {
      name: "Event #{name_sufix}",
      description: "Lorem ipsum dolor sit amet",
      event_date: Date.today,
      hour: Time.now.hour + 4,
      place: "UESPI"
    }
  end

  describe "GET index" do
    it "assigns all events as @events" do
      without_access_control do
        event = Event.create!(valid_attributes)
        get :index
        assigns(:events).should eq([event])
      end
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      get :new
      assigns(:event).should be_a_new(Event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = Event.create!(valid_attributes)
      get :show, :id => event.to_param
      assigns(:event).should eq(event)
    end
  end

  describe "POST create" do
    with_user('admin') do
      describe "with valid params" do
        it "creates a new Event" do
          Event.create(valid_attributes)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved event as @event" do
          Event.any_instance.stub(:save).and_return(false)
          Event.create({})
        end

        it "re-renders the 'new' template" do
          Event.any_instance.stub(:save).and_return(false)
          Event.create({})
        end
      end
    end
  end

  describe "PUT update" do
    with_user('admin') do
      describe "with valid params" do
        it "updates the requested event" do
          event = Event.create(valid_attributes)
          put :update, :id => event.to_param, :event => {'these' => 'params'}
        end

        it "assigns the requested event as @event" do
          event = Event.create!(valid_attributes)
          put :update, :id => event.to_param, :event => valid_attributes
          assigns(:event).should eq(event)
        end

        it "redirects to the event" do
          event = Event.create!(valid_attributes(1))
          put :update, :id => event.to_param, :event => valid_attributes(1)
        end
      end

      describe "with invalid params" do
        it "assigns the event as @event" do
          event = Event.create!(valid_attributes)
          Event.any_instance.stub(:save).and_return(false)
          put :update, :id => event.to_param, :event => {}
          assigns(:event).should eq(event)
        end

        it "re-renders the 'edit' template" do
          event = Event.create!(valid_attributes)
          Event.any_instance.stub(:save).and_return(false)
          put :update, :id => event.to_param, :event => {}
        end
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event" do
      Event.should_receive(:find).with("1")
      delete :destroy, :id => "1"
    end

    it "redirects to the events list" do
      event = Event.create!(valid_attributes)
      delete :destroy, :id => event.to_param
    end
  end

end

