note
	description: "[
					G�re le syst�me de pointage
					Calcule le pointage du joueur
]"
	author: "Samuel Forcier - David Lafreni�re"
	date: "25 mars 2013"
	revision: "1.0"


class
	SCORE

create
	make
feature
	make -- constructeur de la classe scoore, initialise le pointage � la valeur 0


			do
				point := 0
			end

	point:INTEGER_32 assign set_point
		-- Le pointage

	set_point(a_point:INTEGER_32) -- assignateur de la variable point
		-- Assigne le pointage
		do
			point:=a_point
		end

invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafreni�re"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafreni�re
				�tudiant C�gep de Drummondville		�tudiant C�gep de Drummondville
]"
end
