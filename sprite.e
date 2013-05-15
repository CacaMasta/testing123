note
	description: "[
					Fait afficher � l'�cran les divers sprites
					Affiche � l'�cran les sprites qui lui sont envoy� par les classes appropri� (megaman,background etc.) et contient aussi les coordonn�es des divers sprites

]"
	author: "Samuel Forcier - David Lafreni�re"
	date: "25 mars 2013"
	revision: "1.0"


deferred class
	SPRITE

inherit
	DISPOSABLE

feature {NONE} -- initialise les parametre par defaut d'un texte
	initialise_text(a_chemin:STRING)
	local
		l_chemin_c:C_STRING
		l_r:NATURAL_8
		l_g:NATURAL_8
		l_b:NATURAL_8

		l_texte_c:C_STRING

			do



			create l_chemin_c.make (a_chemin)

			text_size := 26
			l_r:=255
			l_g:=255
			l_b:=255

			SDL_Color :=SDL_Color.memory_calloc ({RAPPER}.sizeof_SDL_Color,1)

			--Couleur du texte
			{RAPPER}.set_r_from_SDL_Color(SDL_Color,l_r)

			{RAPPER}.set_g_from_SDL_Color(SDL_Color,l_g)

			{RAPPER}.set_b_from_SDL_Color(SDL_Color,l_b)

			ttf_font := {RAPPER}.TTF_OpenFont(l_chemin_c.item,text_size)

			create l_texte_c.make (texte)

			ptr := {RAPPER}.TTF_RenderText_Blended(ttf_font,l_texte_c.item,SDL_Color)

			x:=0
			y:=0
			x_rect:=0
			y_rect:=0
			w_rect:={RAPPER}.get_w_from_SDL_Surface(ptr)
			h_rect:={RAPPER}.get_h_from_SDL_Surface(ptr)


		end

feature {NONE} -- modifie le texte d'un object texte
	modifie_texte(a_texte:STRING)

	local
		l_texte_c:C_STRING
		do

			create l_texte_c.make (a_texte)

			ptr := {RAPPER}.TTF_RenderText_Blended(ttf_font,l_texte_c.item,SDL_Color)
			w_rect:={RAPPER}.get_w_from_SDL_Surface(ptr)
			h_rect:={RAPPER}.get_h_from_SDL_Surface(ptr)
		end

feature {NONE}-- Initialise les parametre par defaut d'un sprite
	initialize(a_chemin:STRING)
		-- Initialise les parametre par defaut d'un sprite	

	local
	l_chemin_c:C_STRING

	do


		create l_chemin_c.make (a_chemin)

		ptr := {RAPPER}.SDL_LoadBMP(l_chemin_c.item)

		x :=0
		y:=0
		x_rect:=0
		y_rect:=0
		w_rect:={RAPPER}.get_w_from_SDL_Surface(ptr)
		h_rect:={RAPPER}.get_h_from_SDL_Surface(ptr)
	end

feature  --Affiche un sprite
	sprite_affiche (a_screen:POINTER)
		--Affiche un sprite
	local

			l_screen, l_targetarea, l_null:POINTER
			l_inutile:INTEGER
			l_chemin_c:C_STRING
			l_rect_src:POINTER

		do

			l_screen := a_screen

			l_targetarea:=l_targetarea.memory_calloc ({RAPPER}.sizeof_SDL_Rect,1)
			l_rect_src :=l_targetarea.memory_calloc ({RAPPER}.sizeof_SDL_Rect,1)

			--Coordonnees de l'image dans la fenetre
			{RAPPER}.set_x_from_SDL_Rect(l_targetarea,x.truncated_to_integer.as_integer_16)

			{RAPPER}.set_y_from_SDL_Rect(l_targetarea,y.truncated_to_integer.as_integer_16)

			{RAPPER}.set_w_from_SDL_Rect(l_targetarea,0)

			{RAPPER}.set_h_from_SDL_Rect(l_targetarea,0)

			--Coordonnes de l'image src

			{RAPPER}.set_x_from_SDL_Rect(l_rect_src,x_rect.as_integer_16)

			{RAPPER}.set_y_from_SDL_Rect(l_rect_src,y_rect.as_integer_16)

			{RAPPER}.set_w_from_SDL_Rect(l_rect_src,w_rect.as_natural_16)

			{RAPPER}.set_h_from_SDL_Rect(l_rect_src,h_rect.as_natural_16)

			--Place l'image sur la fenetre

			l_inutile := {RAPPER}.SDL_BlitSurface(ptr,l_rect_src,l_screen,l_targetarea)

			l_targetarea.memory_free

			end

			set_transparency
					-- Defini la transparence d'un image
				local
					l_RGB:NATURAL_32
					l_Format:POINTER
					l_inutile:INTEGER
				do
					l_Format := {RAPPER}.get_Format_from_SDL_Surface(ptr)

					l_RGB := {RAPPER}.SDL_MapRGB(l_Format,255,0,255)

					l_inutile := {RAPPER}.SDL_SetColorKey(ptr,{RAPPER}.SDL_SRCCOLORKEY,l_RGB)
				end

			dispose
					-- Lib�re un image de la m�moire
				do
					{RAPPER}.SDL_FreeSurface(ptr)
				end


		set_x_rect(nouveaux:INTEGER_32) -- assignateur de la variable x_rect
		do
			x_rect:=nouveaux
		end

		mr_collision(sprite:SPRITE):BOOLEAN -- gestionnaire de collision entre 2 sprites. Retourne une valeur boolean true si il y a collision

		do
			if (x>sprite.x+25) and (x<sprite.x+sprite.w_rect-15)
			and (y>sprite.y+10)and (y<sprite.y+sprite.h_rect-20)
			then result:= TRUE
			end

			if ((x+w)>sprite.x+25) and ((x+w)<(sprite.x+sprite.w_rect-15))
			and (y>sprite.y+10)and (y<sprite.y+sprite.h_rect-20)
			then result:= TRUE
			end

			if ((x+w)>sprite.x+25) and ((x+w)<(sprite.x+sprite.w_rect-15))
			and ((y+h)>sprite.y+10)and ((y+h)<sprite.y+sprite.h_rect-20)
			then result:= TRUE
			end

			if (x>sprite.x+25) and (x<sprite.x+sprite.w_rect-15)
			and ((y+h)>sprite.y+10)and ((y+h)<sprite.y+sprite.h_rect-20)
			then result:= TRUE
			end

		end






			x:REAL -- X d'un sprite
			y:REAL -- Y d'un sprite
			w:REAL -- Largeur d'un sprite
			h:REAL-- Hauteur d'un sprite
			ptr:POINTER -- pointeur vers l'image d'un sprite
			x_rect:INTEGER 	assign set_x_rect-- Coordonn�e X du rectangle � afficher
			y_rect:INTEGER -- Coordonn�e X du rectangle � afficher
			w_rect:INTEGER -- Largeur du rectangle � afficher
			h_rect:INTEGER -- Hauteur du rectangle � afficher
			text_size:INTEGER -- taille du texte
			ttf_font:POINTER -- pointeur TTF_Font
			texte:STRING -- String contenant le texte d'un sprite text � afficher
			SDL_Color:POINTER -- pointeur vers la structure SDL_Color

invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafreni�re"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafreni�re
				�tudiant C�gep de Drummondville		�tudiant C�gep de Drummondville
]"

end
