class AnimalsController < ApplicationController
	def index
	    @animals = Animal.all.alphabetical.paginate(:page => params[:page], :per_page => 10)
	end

	def new
	end

	def create
		@animal = Animal.new(animal_params)
	    if @animal.save
	      redirect_to @animal, notice: "Successfully created #{@animal.name}"
	    else
	      render action: 'new'
	    end
	end

	def show
	end

	def edit
	end

	def update
	if @animal.update(animal_params)
	  redirect_to animal_path(@animal), notice: "Successfully updated #{@animal.name}"
	else
	  render action: 'edit'
	end
	end

	def destroy
		@animal.destroy
		redirect_to animals_path, notice: "Successfully removed #{@animal.name}"
	end

	private 

	def set_food
		@animal = Animal.find(params[:id])
		if @animal.nil?
		  redirect_to @animal, notice: "No animal with that ID"
		end
	end

	def animal_params
		params.require(:food).permit(:name, :type, :age, :conditions, :weight)
	end

end
