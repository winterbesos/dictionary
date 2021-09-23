class NounsController < ApplicationController

  def index
    keyword = params[:keyword]

    @nouns = Noun.all
    if keyword
      @nouns = @nouns.where("name LIKE '%#{keyword}%'")
    end

    @counters = SearchCounter.includes(:countable).limit(10).order(count: :desc)
    @keyword = keyword
  end

  def new
    default_name = params[:name]
    @noun = Noun.new
    @noun.name = default_name
  end

  def show
    @noun = Noun.find(params[:id])
    @noun.counter_increase
  end

  def edit
    @noun = Noun.find(params[:id])
  end

  def create
    @noun = Noun.new(noun_params)

    if @noun.save
      redirect_to @noun
    else
      render :new
    end
  end

  def update
    @noun = Noun.find(params[:id])

    if @noun.update(update_noun_params)
      redirect_to @noun
    else
      render :edit
    end
  end

  def search
    keyword = params[:keyword]
    if keyword
      Noun.find(:all)
    else
      Noun.find(:all, :conditions => ['name LIKE ?', "%#{keyword}%"])
    end
  end

  private
  def noun_params
    params.required(:noun).permit(:name, :s_name, :description, :en_name, :en_s_name)
  end

  def update_noun_params
    params.required(:noun).permit(:s_name, :description, :en_name, :en_s_name)
  end

end
