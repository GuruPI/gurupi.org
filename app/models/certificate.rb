# encoding: UTF-8
class Certificate < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :event
  validates :user_id, :presence => true
  validates :event_id, :presence => true
  before_save :generate_token
  
  PDF_OPTIONS = {
    :page_size => "A4",
		:page_layout => :landscape,
		:background  => "public/images/background.png",
		:margin => [40, 75]
  }
  
  def	generate
    attested = self
		Prawn::Document.new(PDF_OPTIONS) do
			move_down 50
      text "Certificado de Participação", :size => 36, :style => :bold, :align => :center
			move_down 30
			text "Certificamos que", :size => 20, :align => :center
			move_down 15
			text "<b>#{attested.user.identities.first.name}</b>", :inline_format => true, :size => 30, :align => :center
			move_down 15
		  text "participou do <b>#{attested.event.name}</b>, realizado no(a) #{attested.event.place.upcase} em #{I18n.l(attested.event.event_date, :format => :long)} às #{attested.event.hour}, perfazendo uma carga horária total de <b>4 horas</b>.", 
		        :inline_format => true, :size => 20, :align => :center
	    move_down 30
			text "Teresina(PI), #{I18n.l(Date.current, :format => :long)}.", :size => 20, :align => :center
      move_down 50
      text "Realização", :size => 16, :style => :bold, :align => :center
      move_down 10
      image "#{Rails.root}/public/images/logo.png", :position => :center
    end
	end
	
	private
	
	def generate_token
	  self.token = Digest::MD5.hexdigest("#{self.user.identities.first.name}-
	                                      #{self.user.email}-
	                                      #{self.event.name}-
	                                      #{self.event.event_date}")
  end
  
  
end
