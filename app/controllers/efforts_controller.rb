class EffortsController < ApplicationController

  # GET /tracked_cards/:tracked_card_id/efforts/:id/edit(.:format)
  def edit
    @tracked_card = TrackedCard.find(params[:tracked_card_id])
    @effort = @tracked_card.efforts.where(id: params[:id]).first
  end

  # PUT /tracked_cards/:tracked_card_id/efforts/:id(.:format)
  def update
    @tracked_card = TrackedCard.find(params[:tracked_card_id])
    @effort = @tracked_card.efforts.where(id: params[:id]).first

    respond_to do |format|
      if @effort.update_attributes(params[:effort])
        format.html { redirect_to tracked_card_path(@tracked_card), notice: 'Tracked card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracked_cards/:tracked_card_id/efforts/:id(.:format)
  def destroy
    tracked_card = TrackedCard.find(params[:tracked_card_id])
    tracked_card.efforts.where(id: params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to tracked_card_path(tracked_card), notice: 'Tracked card was successfully updated.' }
      format.json { head :no_content }
    end
  end
end
