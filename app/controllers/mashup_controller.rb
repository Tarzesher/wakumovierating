class MashupController < ApplicationController
  
def search
	if params[:search]
		@search = params[:search]
	else
		@search = nil
	end
end

end
