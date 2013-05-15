note
	description: "[
					Gestionnaire des fonctions musical du programme.
					Initialise divers fichier sonore, ouvre des caneaux audio sur le syst�me, ferme des caneaux audio sur le syst�me et joue des son sur ces caneaux sonore
]"
	author: "Samuel Forcier - David Lafreni�re"
	date: "25 mars 2013"
	revision: "1.0"


deferred class
	SOUND_MANAGER

inherit
	DISPOSABLE

feature{NONE}


	open_audio -- Ouvre l'audio, n�cessaire a la lecture de son et de musique

	local
		l_inutilise:INTEGER

	do

		l_inutilise:={RAPPER}.Mix_OpenAudio(22050,{RAPPER}.MIX_DEFAULT_FORMAT,2,4096)

	end

	initialise_son(a_chemin:STRING) -- Initialise un son

	local
		l_chemin_c:C_STRING

	do

	create l_chemin_c.make (a_chemin)

		ptr := {RAPPER}.Mix_LoadWAV(l_chemin_c.item)

	end

feature

	play_son(a_loop:INTEGER) -- ex�cute la lecture d'un son


	do

		channel_number := {RAPPER}.Mix_PlayChannel(-1,ptr,a_loop)

	end

	stop_son -- arr�te la lecture d'un son

	local
		l_inutilise:INTEGER
	do
		l_inutilise:= {RAPPER}.Mix_HaltChannel(channel_number)


	end

	feature {NONE}

				dispose
					-- Lib�re un son de la m�moire
				do
					stop_son
					{RAPPER}.Mix_FreeChunk(ptr)
				end

	feature
				stop_audio -- ferme les canneaux audio en vue de la fermeture du jeu

				do

					{RAPPER}.Mix_CloseAudio()

				end


	ptr:POINTER -- pointeur vers un son/musique
	channel_number:INTEGER -- nombre de canal audio � utiliser






invariant
note
	copyright:"Copyright - Samuel Forcier - David Lafreni�re"
	licence:"GPL 3.0 (see http://www.gnu.org/licences/gpl-3.0.txt)"
	source:"[
				Samuel Forcier						David Lafreni�re
				�tudiant C�gep de Drummondville		�tudiant C�gep de Drummondville
]"

end
