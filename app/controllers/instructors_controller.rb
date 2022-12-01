class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    

    def index
        render json: Instructor.all, status: :ok
    end

    def show
        instructor = find_instructor
        render json: instructor, status: :ok
    end

    def update
        instructor = find_instructor
        instructor.update(name: params[:name])

        render json: instructor, status: :ok
    end
    def create
        render json: Instructor.create!(instructor_params), status: :created
    end

    def destroy
        instructor =find_instructor 
        instructor.destroy
        head :no_content
    end

    private
    def instructor_params
        params.permit(:name)
    end

    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}
    end

    def record_not_found
        render json: {error: "Record not found"}, status: :not_found
    end
    def find_instructor
        Instructor.find_by(id: params[:id])
    end

end
