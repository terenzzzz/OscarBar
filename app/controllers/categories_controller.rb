class CategoriesController < ApplicationController 
    def new 
        @category = Category.new 
    end 
    
    def create 
        category_params = params.require(:category).permit(:code, :name) 
        @category = Category.new(category_params) 
        if @category.save 
            redirect_to new_category_path, notice: 'Category was created.' 
        else
            render :new 
        end 
    end
    
end