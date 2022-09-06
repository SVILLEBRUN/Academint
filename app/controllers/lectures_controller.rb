class LecturesController < ApplicationController
  def new
    @lecture = Lecture.new
    authorize @lecture
  end

  def create
    @lecture = Lesson.new
    @lecture.user = current_user
    @lesson = Lesson.find(params[lesson_id])
    @lecture.lesson = @lesson
    authorize @lecture
  end

  def show
    @lecture = Lecture.find(params[:id])
    @classroom = Classroom.find(params[:classroom_id])
    @course = Course.find(params[:course_id])
    @last_course = @classroom.lectures.last == @lecture
    @last_lecture = @classroom.lectures.last
    @skip_footer = true
    authorize @lecture
  end

  def quizz
    @lecture = Lecture.find(params[:id])
    @classroom = @lecture.classroom
    @course = @classroom.course
    authorize @lecture
  end

  def quizz_submit
    @lecture = Lecture.find(params[:id])
    @classroom = @lecture.classroom
    @course = @classroom.course
    @user_answers = params[:user_answers].values.map { |hash| hash.key("1") }.join(',')
    @lecture.update!(user_answers: @user_answers)
    @lesson = @lecture.lesson
    authorize @lecture
    compare_answers(@course, @classroom, @lecture)
  end

  def compare_answers(course, classroom, lecture)
    if success_rate < 90
      redirect_to quizz_course_classroom_lecture_path, notice: "Vous n'avez obtenu que #{success_rate}% de bonnes réponses. Essayez encore pour atteindre les 90% de bonnes réponses et valider le quizz!"
    else
      @lecture.done!
      redirect_to course_classroom_lecture_path(course, classroom, classroom.lectures.last), notice: "Félicitations, vous avez obtenu #{success_rate}% de bonnes réponses!"
    end
  end

  def success_rate
    user_answers_array = @lecture.user_answers.split(",")
    quizz_answers_array = @lesson.quizz_answers.split(",")
    @counter = 0
    user_answers_array.each_with_index do |user_answer, index|
      if user_answers_array[index] == quizz_answers_array[index]
        @counter += 1
      end
    end
    @success_rate = (@counter * 100) / user_answers_array.length
  end

end
