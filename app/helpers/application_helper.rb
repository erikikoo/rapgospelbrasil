module ApplicationHelper

	def sub_texto(texto, qnt)
		 if texto.length <= qnt
		 	raw(texto)
		 else 
		  	raw(texto[0..qnt]+" ... ")
		end
	end

	def get_artist_current
    	 @artist_data = ArtistData.find(current_artist.id)
  	end

  	def get_administrador
    	@adm = Artist.find_by(admin: true)
  	end

	def get_day(date)
		(((Time.now - date)/3600)/24).to_i
	end
	
	def add_video(video)
		video_desc = video.split('/watch?v=')
		video = video_desc[0] + '/embed/' + video_desc[1]	
	    raw("<iframe width='330' height='225' src='#{video}' frameborder='0' allowfullscreen></iframe>")      
    end

	
end
