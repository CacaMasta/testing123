note
	description: "[
		G�re l'affichage de texte
		Sert a initialis� un objet texte et � le mettre � jour pour l'afficher � l'�cran dans la classe Sprite
	]"
	author: "Samuel Forcier - David Lafreni�re"
	date: "25 mars 2013"
	revision: "1.0"

class
	TEXTE
inherit
	SPRITE

create
	make

feature {NONE} -- Initialization

	make

		do

			texte:="texte par d�fault"
			initialise_text("comic.ttf")


		end

feature -- mise a jour du texte

		update_texte(text:STRING)

		do
			modifie_texte(text)
		end


note
	copyright: "Copyright - Samuel Forcier - David Lafreni�re"
	licence: "GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source: "[
		Samuel Forcier						David Lafreni�re
		�tudiant C�gep de Drummondville		�tudiant C�gep de Drummondville
	]"

end
