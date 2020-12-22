class ImageController < ApplicationController
    def update
        current_user.update(image_params)
        redirect_to posts_path,notice: "posts was successfully uploded"
      end
    
      private
      def image_params
        params.require(:user).permit(:image)     
      end 
end
