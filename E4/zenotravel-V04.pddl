(define (domain zeno-travel)


(:requirements
  :typing
  :fluents
  :derived-predicates
  :negative-preconditions
  :universal-preconditions
  :disjuntive-preconditions
  :conditional-effects
  :htn-expansion

  ; Requisitos adicionales para el manejo del tiempo
  :durative-actions
  :metatags
 )

(:types aircraft person city - object)
(:constants slow fast - object)
(:predicates (at ?x - (either person aircraft) ?c - city)
             (in ?p - person ?a - aircraft)
             (different ?x ?y) (igual ?x ?y)
             (hay-fuel-rapido ?a - aircraft ?c1 ?c2 - city)
             (hay-fuel-lento ?a - aircraft ?c1 ?c2 - city)
             (no-excede-fuel-lento ?a - aircraft ?c1 ?c2 - city)
             (no-excede-fuel-rapido ?a - aircraft ?c1 ?c2 - city)
             (destino ?p - person ?c - city)
             (ultimoAvion ?a - aircraft)

             (DaTiempoAEmbarcar ?a - aircraft)
             (DaTiempoAMoverseRapido ?a - aircraft ?c1 ?c2 - city)
             (DaTiempoAMoverseLento ?a - aircraft ?c1 ?c2 - city)
             (DaTiempoADesmbarcar ?a - aircraft)

             (DepositoSuficienteRapido ?a - aircraft ?c1 - city ?c2 - city)
             (DepositoSuficienteLento ?a - aircraft ?c1 - city ?c2 - city)

             )
(:functions (fuel ?a - aircraft)
            (distance ?c1 - city ?c2 - city)
            (slow-speed ?a - aircraft)
            (fast-speed ?a - aircraft)
            (slow-burn ?a - aircraft)
            (fast-burn ?a - aircraft)
            (capacity ?a - aircraft)
            (refuel-rate ?a - aircraft)
            (total-fuel-used ?a - aircraft)
            (boarding-time)
            (debarking-time)
            (fuel-limit ?a - aircraft)

            (tiempo ?a - aircraft)
            (max_tiempo ?a - aircraft)

            (max_pasajeros ?a - aircraft)
            (pasajeros ?a - aircraft)
            )

;; el consecuente "vac�o" se representa como "()" y significa "siempre verdad"
(:derived
  (igual ?x ?x) ())

(:derived
  (different ?x ?y) (not (igual ?x ?y)))

;; este literal derivado se utiliza para deducir, a partir de la información en el estado actual,
;; si hay fuel suficiente para que el avión ?a vuele de la ciudad ?c1 a la ?c2
;; el antecedente de este literal derivado comprueba si el fuel actual de ?a es mayor que 1.
;; En este caso es una forma de describir que no hay restricciones de fuel. Pueden introducirse una
;; restricción más copleja  si en lugar de 1 se representa una expresión más elaborada (esto es objeto de
;; los siguientes ejercicios).
(:derived
  (hay-fuel-lento ?a - aircraft ?c1 - city ?c2 - city)
  (> (fuel ?a) (* (distance ?c1 ?c2) (slow-burn ?a)) )
)

(:derived
  (hay-fuel-rapido ?a - aircraft ?c1 - city ?c2 - city)
  (> (fuel ?a) (* (distance ?c1 ?c2) (fast-burn ?a)) )
)

(:derived
  (no-excede-fuel-rapido ?a - aircraft ?c1 - city ?c2 - city)
  (< (+ (total-fuel-used ?a) (* (distance ?c1 ?c2) (fast-burn ?a))) (fuel-limit ?a))
)

(:derived
  (no-excede-fuel-lento ?a - aircraft ?c1 - city ?c2 - city)
  (< (+ (total-fuel-used ?a) (* (distance ?c1 ?c2) (slow-burn ?a))) (fuel-limit ?a))
)

(:derived
  (DaTiempoAEmbarcar ?a - aircraft)
  (< (+ (tiempo ?a) (boarding-time)) (max_tiempo ?a))
)

(:derived
  (DaTiempoADesmbarcar ?a - aircraft)
  (< (+ (tiempo ?a) (debarking-time)) (max_tiempo ?a))
)

(:derived
  (DaTiempoAMoverseLento ?a - aircraft ?c1 - city ?c2 - city)
  ;(when ( no-excede-fuel-rapido ?a ?c1 ?c2 )
  ;  (< (+ (tiempo ?a) (/ (distance ?c1 ?c2) (fast-speed ?a) )) (max_tiempo ?a))
  ;)
  ;(when ( no-excede-fuel-lento ?a ?c1 ?c2)
    (< (+ (tiempo ?a) (/ (distance ?c1 ?c2) (slow-speed ?a) )) (max_tiempo ?a))
  ;)
)

(:derived
  (DaTiempoAMoverseRapido ?a - aircraft ?c1 - city ?c2 - city)
  (< (+ (tiempo ?a) (/ (distance ?c1 ?c2) (fast-speed ?a) )) (max_tiempo ?a))
)

(:derived
  (DepositoSuficienteRapido ?a - aircraft ?c1 - city ?c2 - city)
  (>= (capacity ?a) (* (distance ?c1 ?c2) (fast-burn ?a)))
)

(:derived
  (DepositoSuficienteLento ?a - aircraft ?c1 - city ?c2 - city)
  (>= (capacity ?a) (* (distance ?c1 ?c2) (slow-burn ?a)))
)


(:task transport-people
	:parameters ()

   (:method Embarcar
	  :precondition (and (at ?p - person ?c1 - city)
			                 (at ?a - aircraft ?c1 - city)
                       (destino ?p - person ?c2 - city)
                       ;(different ?c1 ?c2)
                       (not (= ?c1 ?c2))
                       (or
                         (not(in ?p2 ?a))
                         (and
                           (in ?p3 ?a)
                           (destino ?p3 ?c2)
                         )
                       )
                       (< (pasajeros ?a) (max_pasajeros ?a))
                       (DaTiempoAEmbarcar ?a)
                  )

  	  :tasks (
  	  	      (board ?p ?a ?c1)
              (transport-people)
      )
    )

    (:method Mover
      :precondition (and
                    (at ?a ?c1)
                    (in ?p ?a)
                    (destino ?p ?c2)
                    ;(different ?c1 ?c2)
                    (not (= ?c1 ?c2))
                    ;(or
                    ;  (= (pasajeros ?a) (max_pasajeros ?a))
                    ;  (and
                    ;    (at ?p1 - person ?c1)
                    ;    (not (destino ?p1 ?c2))
                    ;  )
                    ;  (not (at ?p1 - person ?c1))
                    ;)
                    ;(DaTiempoAMoverse ?a ?c1 ?c2)
                    )
      :tasks(
        (mover-avion ?a ?c1 ?c2)
        (transport-people)
        )
    )

    (:method Desembarcar
      :precondition (and
                    (at ?a - aircraft ?c)
                    (in ?p ?a)
                    (destino ?p ?c)
                    (DaTiempoADesmbarcar ?a)
                    )
      :tasks(
        (debark ?p ?a ?c1)
        (transport-people)
        )
    )

    (:method IrARecoger ; avion y persona en ciudades distintas
      :precondition (and
                      (at ?p - person ?c1 - city)
                      (destino ?p - person ?c3 - city)
                      (at ?a - aircraft ?c2 - city)
                      ;(not(in ?p2 ?a))
                      ;(different ?c1 ?c2)
                      (not (= ?c1 ?c2))
                      ;(different ?c1 ?c3)
                      (not (= ?c1 ?c3))
                      ;(at ?a2 - aircraft ?c4)
                      ;(not(= ?a ?a2))
                      ;(< (tiempo ?a) (tiempo ?a2))
                    )
      :tasks(
        (mover-avion ?a ?c2 ?c1)
        (transport-people)
      )
    )

    (:method caso-base ;; método caso base de la recursión
     :precondition(and
                    ( at ?a - aircraft ?c2 - city)
                    (ultimoAvion ?a2)
                    (= ?a ?a2)
                  )
     :tasks()
    )

	)

;;----------------------
;;----------------------
;; Mover-avion
;;----------------------
;;----------------------

(:task mover-avion
 :parameters (?a - aircraft ?c1 - city ?c2 -city)

  (:method fuel-suficiente-rapido
  :precondition (and
                (hay-fuel-rapido ?a ?c1 ?c2)
                (no-excede-fuel-rapido ?a ?c1 ?c2)
                (DaTiempoAMoverseRapido ?a ?c1 ?c2)
                )
  :tasks (
          (zoom ?a ?c1 ?c2)
         )
   )

  (:method no-fuel-suficiente-rapido
    :precondition (and
                  ;(not(hay-fuel-rapido ?a ?c1 ?c2))
                  (no-excede-fuel-rapido ?a ?c1 ?c2)
                  (DaTiempoAMoverseRapido ?a ?c1 ?c2)
                  (DepositoSuficienteRapido ?a ?c1 ?c2)
                  )
    :tasks(
         (refuel ?a ?c1)
         (zoom ?a ?c1 ?c2)
      )
   )

   (:method fuel-suficiente-lento
    :precondition (and
                    (hay-fuel-lento ?a ?c1 ?c2)
                    (no-excede-fuel-lento ?a ?c1 ?c2)
                    (DaTiempoAMoverseLento ?a ?c1 ?c2)
                  )
    :tasks (
            (fly ?a ?c1 ?c2)
           )
    )

   (:method no-fuel-suficiente-lento
    :precondition (and
                  ;(not(hay-fuel-lento ?a ?c1 ?c2))
                  (no-excede-fuel-lento ?a ?c1 ?c2)
                  (DaTiempoAMoverseLento ?a ?c1 ?c2)
                  (DepositoSuficienteLento ?a ?c1 ?c2)
                  )
    :tasks(
        (refuel ?a ?c1)
        ;(mover-avion ?a ?c1 ?c2)
        (fly ?a ?c1 ?c2)
     )
   )

)

(:import "Primitivas-Zenotravel4.pddl")

)
