note
	description: "[
		Initialise les projectiles lanc�s par megaman.
		Initialise les coordonn�es initiales de chaque projectiles lanc�s par megaman ainsi que le chemin d'acc�s a l'image du sprite.
	]"
	author: "Samuel Forcier - David Lafreni�re"
	date: "25 mars 2013"
	revision: "1.0"

class
	GENTILPROJECTILE

inherit

	PROJECTILE

create
	maker


feature {NONE} -- Implementation

		son_megaman:SON_MEGAMAN

		maker (megaman: MEGAMAN) -- Constructeur de la classe gentilprojectile, n�cessite un objet megaman pour d�terminer l'emplacement initial d'un nouveau projectile





		do
			chemin_gentil_droite := "projectile1.bmp"
			chemin_gentil_gauche := "projectile2.bmp"
			create chemin_gentil_droite_c.make (chemin_gentil_droite)
			create chemin_gentil_gauche_c.make (chemin_gentil_gauche)
			create son_megaman.make
			son_megaman.play_son(0)
			if megaman.l_direction_droite then
				initialize("projectile1.bmp")

			x := megaman.x + 112
			direction_projectile_droite := true
			else
				initialize("projectile2.bmp")
			x := megaman.x - 20
			direction_projectile_droite := false
			end
			set_transparency
			y := megaman.y + 26
			w := 26
			h := 20
		end



note
	copyright: "Copyright - Samuel Forcier - David Lafreni�re"
	licence: "GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source: "[
		Samuel Forcier						David Lafreni�re
		�tudiant C�gep de Drummondville		�tudiant C�gep de Drummondville
	]"

end
