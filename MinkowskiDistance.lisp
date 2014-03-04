(PRINT "Début du programme.")
 ;Prise des données dans le fichier MinkowskiVecteur.data un espace sépare les dimensions un point virgule termine la prise du vecteur.
(let ((in (open "MinkowskiVecteur.data")))
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
;En sortie un réel représentant la distance de minkowski. 
(defun dMinkowski(s-list u-list)
(setq d 0)
(loop for x in s-list for y in u-list
      do
      (setq d (+ (expt (abs (- x y))(length s-list)) d))
)
(expt d (/ 1 (length s-list)))
)

(PRINT (format NIL "Distance de Minkowski entre v et w :~A" (dMinkowski v-list w-list)))
(PRINT "Fin du programme")
