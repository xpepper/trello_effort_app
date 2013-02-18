class MembersController < ApplicationController

  # DELETE /tracked_cards/:tracked_card_id/efforts/:effort_id/members/:id(.:format)
  def destroy
    tracked_card = TrackedCard.find(params[:tracked_card_id])
    effort = tracked_card.efforts.find(params[:effort_id])
    effort.members.where(id: params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to edit_tracked_card_effort_path(tracked_card, effort), notice: 'Tracked card was successfully updated.'}
      format.json { head :no_content }
    end
  end
end
