class ProjectsController < ApplicationController
    def index
        if params.has_key?(:name)
            @projects = Project.where("name LIKE ? ", "%#{params[:name]}%")
        elsif params.has_key?(:category)
            @projects = Project.where("category = ?", params[:category])
        else
            @projects = Project.all
        end

        respond_to do |format|
          format.html
          format.json { render :json => @projects }
        end
    end

    # def category
    #     #@projects = Project.where("category = ?", params[:category])
    #     @projects = Project.all.last(10)
    #     render :json => @projects

    # end


end
