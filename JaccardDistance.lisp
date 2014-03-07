(PRINT "Début du programme.")

 ;Prise des données dans le fichier JaccardVecteur.data : un espace sépare les dimensions un point virgule termine la prise du vecteur.
(let ((in (open "JaccardVecteur.data")))
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



;En entrée deux listes binaires.
;En sortie un réel représentant la distance de Jaccard. 
(defun dJaccard(s-list u-list)
	(setq d 0)
	(setq nbUn 0)
	(loop for x in s-list for y in u-list
		do
		(if(= x 1)(setq nbUn(+ nbUn 1)))
		(if(= y 1)(setq nbUn(+ nbUn 1)))
	)
(setq nbZero(- (* 2 (length v-list)) nbUn))
(if (= nbZero nbUn)(+ 0 0)
(- 1 (/ nbUn (- (length v-list) nbZero)))
)
)

(PRINT (format NIL "Distance de Jaccard entre v et w :~A" (dJaccard v-list w-list)))
(PRINT "Fin du programme")
