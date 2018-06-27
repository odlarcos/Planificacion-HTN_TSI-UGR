(define (problem zeno-0) (:domain zeno-travel)
(:customization
(= :time-format "%d/%m/%Y %H:%M:%S")
(= :time-horizon-relative 2500)
(= :time-start "05/06/2007 08:00:00")
(= :time-unit :hours))

(:objects
    p1 p2 p3 p4 - person
    almeria barcelona bilbao cadiz cordoba gibraltar granada huelva jaen madrid malaga sevilla - city
    a1 a2 - aircraft
)
(:init

  (= (distance almeria barcelona) 809)
  (= (distance almeria bilbao) 958)
  (= (distance almeria cadiz) 463)
  (= (distance almeria cordoba) 316)
  (= (distance almeria gibraltar) 339)
  (= (distance almeria granada) 162)
  (= (distance almeria huelva) 505)
  (= (distance almeria jaen) 220)
  (= (distance almeria madrid) 547)
  (= (distance almeria malaga) 207)
  (= (distance almeria sevilla) 410)
  (= (distance barcelona almeria) 809)
  (= (distance barcelona bilbao) 620)
  (= (distance barcelona cadiz) 1284)
  (= (distance barcelona cordoba) 908)
  (= (distance barcelona gibraltar) 1124)
  (= (distance barcelona granada) 868)
  (= (distance barcelona huelva) 1140)
  (= (distance barcelona jaen) 804)
  (= (distance barcelona madrid) 621)
  (= (distance barcelona malaga) 997)
  (= (distance barcelona sevilla) 1046)
  (= (distance bilbao almeria) 463)
  (= (distance bilbao barcelona) 1284)
  (= (distance bilbao cadiz) 1058)
  (= (distance bilbao cordoba) 796)
  (= (distance bilbao gibraltar) 1110)
  (= (distance bilbao granada) 829)
  (= (distance bilbao huelva) 939)
  (= (distance bilbao jaen) 730)
  (= (distance bilbao madrid) 395)
  (= (distance bilbao malaga) 939)
  (= (distance bilbao sevilla) 933)

  (= (distance cadiz almeria) 217)
  (= (distance cadiz barcelona) 360)
  (= (distance cadiz bilbao) 183)
  (= (distance cadiz cordoba) 329)
  (= (distance cadiz gibraltar) 499)
  (= (distance cadiz granada) 329)
  (= (distance cadiz huelva) 171)
  (= (distance cadiz jaen) 517)
  (= (distance cadiz madrid) 422)
  (= (distance cadiz malaga) 343)
  (= (distance cadiz sevilla) 286)
  (= (distance cordoba almeria) 435)
  (= (distance cordoba barcelona) 295)
  (= (distance cordoba bilbao) 178)
  (= (distance cordoba cadiz) 241)
  (= (distance cordoba gibraltar) 344)
  (= (distance cordoba granada) 507)
  (= (distance cordoba huelva) 351)
  (= (distance cordoba jaen) 503)
  (= (distance cordoba madrid) 458)
  (= (distance cordoba malaga) 494)
  (= (distance cordoba sevilla) 218)
  (= (distance gibraltar almeria) 440)
  (= (distance gibraltar barcelona) 274)
  (= (distance gibraltar bilbao) 346)
  (= (distance gibraltar cadiz) 480)
  (= (distance gibraltar cordoba) 253)
  (= (distance gibraltar granada) 272)
  (= (distance gibraltar huelva) 416)
  (= (distance gibraltar jaen) 299)
  (= (distance gibraltar madrid) 174)
  (= (distance gibraltar malaga) 351)
  (= (distance gibraltar sevilla) 203)
  (= (distance granada almeria) 327)
  (= (distance granada barcelona) 358)
  (= (distance granada bilbao) 378)
  (= (distance granada cadiz) 283)
  (= (distance granada cordoba) 448)
  (= (distance granada gibraltar) 331)
  (= (distance granada huelva) 385)
  (= (distance granada jaen) 163)
  (= (distance granada madrid) 415)
  (= (distance granada malaga) 364)
  (= (distance granada sevilla) 413)
  (= (distance huelva almeria) 286)
  (= (distance huelva barcelona) 375)
  (= (distance huelva bilbao) 219)
  (= (distance huelva cadiz) 265)
  (= (distance huelva cordoba) 244)
  (= (distance huelva gibraltar) 179)
  (= (distance huelva granada) 251)
  (= (distance huelva jaen) 267)
  (= (distance huelva madrid) 345)
  (= (distance huelva malaga) 255)
  (= (distance huelva sevilla) 154)
  (= (distance jaen almeria) 401)
  (= (distance jaen barcelona) 448)
  (= (distance jaen bilbao) 338)
  (= (distance jaen cadiz) 473)
  (= (distance jaen cordoba) 455)
  (= (distance jaen gibraltar) 232)
  (= (distance jaen granada) 502)
  (= (distance jaen huelva) 516)
  (= (distance jaen madrid) 466)
  (= (distance jaen malaga) 487)
  (= (distance jaen sevilla) 188)
  (= (distance madrid almeria) 494)
  (= (distance madrid barcelona) 451)
  (= (distance madrid bilbao) 247)
  (= (distance madrid cadiz) 421)
  (= (distance madrid cordoba) 378)
  (= (distance madrid gibraltar) 487)
  (= (distance madrid granada) 308)
  (= (distance madrid huelva) 527)
  (= (distance madrid jaen) 547)
  (= (distance madrid malaga) 444)
  (= (distance madrid sevilla) 454)
  (= (distance malaga almeria) 159)
  (= (distance malaga barcelona) 381)
  (= (distance malaga bilbao) 295)
  (= (distance malaga cadiz) 325)
  (= (distance malaga cordoba) 185)
  (= (distance malaga gibraltar) 448)
  (= (distance malaga granada) 292)
  (= (distance malaga huelva) 549)
  (= (distance malaga jaen) 518)
  (= (distance malaga madrid) 162)
  (= (distance malaga sevilla) 410)
  (= (distance sevilla almeria) 507)
  (= (distance sevilla barcelona) 544)
  (= (distance sevilla bilbao) 158)
  (= (distance sevilla cadiz) 545)
  (= (distance sevilla cordoba) 518)
  (= (distance sevilla gibraltar) 463)
  (= (distance sevilla granada) 280)
  (= (distance sevilla huelva) 356)
  (= (distance sevilla jaen) 312)
  (= (distance sevilla madrid) 492)
  (= (distance sevilla malaga) 315)

    ; ------------------

    ;(= (distance c1 c1) 0)
    ;(= (distance c2 c2) 0)
    ;(= (distance c3 c3) 0)
    ;(= (distance c4 c4) 0)
    ;(= (distance c5 c5) 0)

    (= (fuel a1) 500)
    (= (slow-speed a1) 10)
    (= (fast-speed a1) 20)
    (= (slow-burn a1) 1)
    (= (fast-burn a1) 2)
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
    (= (refuel-rate a2) 1)

    (= (tiempo a1) 0)

    (= (tiempo a2) 0)

    (= (max_pasajeros a1) 2)
    (= (pasajeros a1) 0)

    (= (max_pasajeros a2) 2)
    (= (pasajeros a2) 0)

    (destino p1 bilbao)
    (destino p2 bilbao)
    (destino p3 huelva)
    (destino p4 huelva)

    (at p1 granada)
    (at p2 madrid)
    (at p3 jaen)
    (at p4 jaen)

    (at a1 malaga)
    ;(at a2 gibraltar)
    (ultimoAvion a1)

    (= (capacity a1) 5000)
    (= (capacity a2) 5000)
    (= (max_tiempo a1) 3000)
    (= (max_tiempo a2) 3000)

    (= (fuel-limit a1) 15000)
    (= (fuel-limit a2) 15000)
 )

(:tasks-goal
   :tasks(
     (transport-people)
   )
  )
)