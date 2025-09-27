(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    traveler barbara - person
    bayview goldengatepark - location
    t480 t540 t562 t652 t585 t690 - time
  )
  (:init
    (= (total-cost) 0)
    (at barbara goldengatepark t480)
    (at traveler bayview t540)
    (travel_bayview_ggp t540 t562)
    (travel_ggp_bayview t562 t585)
    (span t480 t562)
    (span t540 t562)
    (span t562 t652)
    (span t480 t652)
    (span90 t562 t652)
    (available barbara t480 t690)
  )
  (:goal (met traveler barbara))
  (:metric minimize (total-cost))
)