class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Student.all, status: :ok
    end

    def show
        student = find_student
        render json: student, status: :ok
    end

    def create
        render json: Student.create!(student_params), status: :created
    end

    def update
        student = find_student
        student.update(student_params)

        render json: student, status: :ok
    end

    def destroy
        student = find_student
        student.destroy
        head :no_content
    end

    private
    def find_student
        Student.find_by(id: params[:id])
    end
    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

    def record_invalid(invalid)
        render json: {error: invalid.record.errors.full_messages}
    end

    def record_not_found
        render json: {error: "Record not found"}, status: :not_found
    end
end
