(define (problem zeno-0) (:domain zeno-travel)
(:customization
(= :time-format "%d/%m/%Y %H:%M:%S")
(= :time-horizon-relative 2500)
(= :time-start "05/06/2007 08:00:00")
(= :time-unit :hours))

(:objects
    p1 p2 p3 p4 - person
    c1 c2 c3 c4 c5 - city
    a1 a2 - aircraft
)
(:init

    (= (fuel-limit a1) 1500)
    (= (fuel-limit a2) 1500)

    (= (distance c1 c2) 100)
    (= (distance c1 c3) 150)
    (= (distance c1 c4) 150)
    (= (distance c1 c5) 100)

    (= (distance c2 c1) 100)
    (= (distance c2 c3) 100)
    (= (distance c2 c4) 150)
    (= (distance c2 c5) 150)

    (= (distance c3 c1) 150)
    (= (distance c3 c2) 150)
    (= (distance c3 c4) 100)
    (= (distance c3 c5) 150)

    (= (distance c4 c1) 150)
    (= (distance c4 c2) 150)
    (= (distance c4 c3) 100)
    (= (distance c4 c5) 100)

    (= (distance c5 c1) 100)
    (= (distance c5 c2) 150)
    (= (distance c5 c3) 150)
    (= (distance c5 c4) 100)

    ; ------------------

    (= (fuel a1) 200)
    (= (slow-speed a1) 10)
    (= (fast-speed a1) 20)
    (= (slow-burn a1) 1)
    (= (fast-burn a1) 2)
    (= (capacity a1) 300)
    (= (refuel-rate a1) 1)
    (= (total-fuel-used a1) 0)
    (= (boarding-time) 1)
    (= (debarking-time) 1)

    (= (fuel a2) 200)
    (= (slow-speed a2) 10)
    (= (fast-speed a2) 20)
    (= (slow-burn a2) 1)
    (= (fast-burn a2) 2)
    (= (total-fuel-used a2) 0)
    (= (capacity a2) 300)
    (= (refuel-rate a2) 1)

    (= (max_tiempo a1) 25)
    (= (tiempo a1) 0)

    (= (max_tiempo a2) 10)
    (= (tiempo a2) 0)

    (= (max_pasajeros a1) 2)
    (= (pasajeros a1) 0)

    (= (max_pasajeros a2) 2)
    (= (pasajeros a2) 0)

    (destino p1 c5)
    (destino p2 c5)
    (destino p3 c5)
    (destino p4 c5)

    (at p1 c2)
    (at p2 c2)
    (at p4 c2)
    (at p3 c3)

    (at a1 c4)
    (ultimoAvion a1)
    ;(at a2 c2)
 )

(:tasks-goal
   :tasks(
     (transport-people)
   )
  )
)
