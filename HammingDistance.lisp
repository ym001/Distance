(PRINT "Début du programme.")
 ;Prise des données dans le fichier HammingVecteur.data un espace sépare les dimensions un point virgule termine la prise du vecteur.
(let ((in (open "HammingVecteur.data")))
  (setq v (read-line in))
  (setq w (read-line in))
  (close in)
)
(setf v-list (list ))

;Fabrication de la liste représentant le vecteur v.
(loop do 
		(setf v-list (append v-list (list (read-from-string (subseq v 0 (search " " v))))))
		(setf v(subseq v (+ 1 (search " " v))(length v)))
		until(string-equal v ";")
)
(PRINT (format NIL "Le premier vecteur v:~A" v-list))

;Fabrication de la liste représentant le vecteur w.
(setf w-list (list ))
  (loop do 
		(setf w-list (append w-list (list (read-from-string (subseq w 0 (search " " w))))))
		(setf w(subseq w (+ 1 (search " " w))(length w)))
		until(string-equal w ";")
	)
(PRINT (format NIL "Le deuxième vecteur w:~A" w-list))

;En entrée deux valeurs binaires.
;En sortie un entier de valeur un si a différent de zéro sinon.  
(defun xorBin(a b)
	(if(= a b)(setq c 0)(setq c 1))
)

;En entrée deux listes de valeur binaire.
;En sortie un réel représentant la distance de Hamming. 
(defun dHamming(s-list u-list)
	(setq d 0)
	(loop for x in s-list for y in u-list
		do
		(setq d (+ (xorBin x y) d))
	)
	(+ d 0)
)

(PRINT (format NIL "Distance de Hamming entre v et w :~A" (dHamming v-list w-list)))
(PRINT "Fin du programme")
