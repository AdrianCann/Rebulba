class NotificationsController < ApplicationController
  
  def show
    notification = current_user.notifications.find(params[:id])
    notification.update(is_read: true)
    redirect_to notification.url
  end
  
  def destroy
    notification = current_user.notifications.find(params[:id])
    notification.destroy
    redirect_to(:back)
  end
  
end
