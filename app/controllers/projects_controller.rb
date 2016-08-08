class ProjectsController < ApplicationController
    def index
        if params.has_key?(:name)
            @projects = Project.where("name LIKE :name", {name: "%#{params[:name]}%"})
        else
            @projects = Project.all
        end

        respond_to do |format|
          format.html
          format.json { render :json => @projects }
        end
    end
end
