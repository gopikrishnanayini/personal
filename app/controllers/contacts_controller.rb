class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
	end
	def new
		@contact = Contact.new
	end
	def create
		@contact = Contact.new(contact_params)
		respond_to do |format|
			if @contact.save
			ExampleMailer.sample_email(@contact).deliver
				format.html { redirect_to @contact, notice: "Contact was successflly created."}
				format.json { render json: show, :status => :created, location: @contacts}
			else
				format.html { render action: 'new'}
				format.json { render json: @contact.errors, :status => :unprocessable_entity}
			end
		end
	end
	def show
		@contact = Contact.find(params[:id])
	end
	private
	def contact_params
		params.require(:contact).permit(:name, :email, :comment)
	end
end
