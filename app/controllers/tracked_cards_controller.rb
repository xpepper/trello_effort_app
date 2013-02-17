class TrackedCardsController < ApplicationController
  # GET /tracked_cards
  # GET /tracked_cards.json
  def index
    #TODO introduce named scope in model?
    @tracked_cards = TrackedCardDecorator.all.reject(&:no_tracking?).sort_by(&:first_activity_date).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tracked_cards }
    end
  end

  # GET /tracked_cards/1
  # GET /tracked_cards/1.json
  def show
    @tracked_card = TrackedCardDecorator.decorate(TrackedCard.find(params[:id]))

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tracked_card }
    end
  end

  # GET /tracked_cards/new
  # GET /tracked_cards/new.json
  def new
    @tracked_card = TrackedCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tracked_card }
    end
  end

  # GET /tracked_cards/1/edit
  def edit
    @tracked_card = TrackedCard.find(params[:id])
  end

  # POST /tracked_cards
  # POST /tracked_cards.json
  def create
    @tracked_card = TrackedCard.new(params[:tracked_card])

    respond_to do |format|
      if @tracked_card.save
        format.html { redirect_to @tracked_card, notice: 'Tracked card was successfully created.' }
        format.json { render json: @tracked_card, status: :created, location: @tracked_card }
      else
        format.html { render action: "new" }
        format.json { render json: @tracked_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tracked_cards/1
  # PUT /tracked_cards/1.json
  def update
    @tracked_card = TrackedCard.find(params[:id])

    respond_to do |format|
      if @tracked_card.update_attributes(params[:tracked_card])
        format.html { redirect_to @tracked_card, notice: 'Tracked card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tracked_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracked_cards/1
  # DELETE /tracked_cards/1.json
  def destroy
    @tracked_card = TrackedCard.find(params[:id])
    @tracked_card.destroy

    respond_to do |format|
      format.html { redirect_to tracked_cards_url }
      format.json { head :no_content }
    end
  end
end
