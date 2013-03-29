class CertificatesController < ApplicationController
  respond_to :html
  filter_resource_access
  
  def index
    @certificates = Certificate.joins(:event).where("user_id = ? and confirmed = ? and events.event_date <= ?", current_user.id, true, Date.current)
    @breadcrumb = "Meus Certificados"
  end
  
  def create
    @certificate = Certificate.where("user_id = ? and event_id = ? and go = ?", current_user.id, params[:certificate][:event_id], true)
    unless @certificate.present?  
      @certificate = Certificate.create(params[:certificate].merge(:go => true))
      redirect_to(event_path(@certificate.event))
    else
      flash[:error] = "Sorry."
      redirect_to events_url
    end
  end
  
  def update
    @certificate = Certificate.find_by_token(params[:token])
    if @certificate.update_attributes(:confirmed => true)
      flash[:notice] = 'Certificate was successfully updated.'
      respond_with @certificate.event
    else
      flash[:error] = "Sorry, certificate not found."
      redirect_to events_url
    end
  end
  
  def show
    @certificate = Certificate.find(params[:id])
    if @certificate
      respond_to do |format|
        format.pdf do
          send_data @certificate.generate.render, 
            filename: "certificate_#{@certificate.event.to_param}_#{@certificate.user.identities.first.name}.pdf",
            type: "application/pdf"
        end
      end
    else
      flash[:error] = "Sorry, certificate not found."
      redirect_to root_url
    end
  end
end
