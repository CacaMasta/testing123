note
	description: "[
					S'occupe des effets sonores produits par Megaman
					Contient le chemin d'acc�s pour le fichier sonore, et initiliase en utilisant sound_manager
]"
	author: "Samuel Forcier - David Lafreni�re"
	date: "25 mars 2013"
	revision: "1.0"



class
	SON_MEGAMAN

inherit
	SOUND_MANAGER

create
make

feature{NONE}

	make -- constructeur de la classe son_megaman. Initiliase les valeurs du son produit par megaman.

	local
		l_chemin:STRING
	do

		l_chemin := "pew.wav"

		initialise_son(l_chemin)

	end


note
	copyright:"Copyright - Samuel Forcier - David Lafreni�re"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafreni�re
				�tudiant C�gep de Drummondville		�tudiant C�gep de Drummondville
]"

end
