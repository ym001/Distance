(PRINT "Début du programme.")
 ;Prise des données dans le fichier ManhattanVecteur.data un espace sépare les dimensions un point virgule termine la prise du vecteur.
(let ((in (open "ManhattanVecteur.data")))
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

;En entrée deux listes de réel.
;En sortie un réel représentant la distance de Manhattan. 
(defun dManhattan(s-list u-list)
(setq d 0)
(loop for x in s-list for y in u-list
      do
      (setq d (+ (abs (- x y)) d))
)
(+ d 0)
)

(PRINT (format NIL "Distance de Manhattan entre v et w :~A" (dManhattan v-list w-list)))
(PRINT "Fin du programme")
