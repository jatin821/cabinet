class DocsController < ApplicationController
 before_action :find_doc, only: [:show, :edit, :update, :destroy]


	def index
		@docs = Doc.all.order("created_at DESC")
	end

	def show
	end


	 def new
	 	@doc = Doc.new
	 end


	 def create
       @doc = Doc.new(doc_params)

       if @doc.save
       	redirect_to @doc
       else
       	render 'new'
       end

	 end


# no view for edit
	 def edit

	 end


# no view for update 
	 def update  
	 	if @doc.update(doc_params)
	 		redirect_to @doc
	 	else 
	 	#redirect is new http request we dont want it and iit delete evertjig on the page 
	 		render 'edit' 
	 	end
	 end


	 def destroy
	 	@doc.destroy
	 	redirect_to docs_path
	 end



	 private
# used in edit update and destroy so keep it in private bcz it is used agai and again
	 def find_doc
		@doc = Doc.find(params[:id])
	 end

	 def doc_params
	     params.require(:doc).permit(:title, :content)
	 end
end
