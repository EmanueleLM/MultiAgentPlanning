(define (problem meet-stephanie-traveler)
  (:domain meeting-orchestration)
  (:objects
    t480 t540 t552 t556 t657 t900 - time
  )
  (:init
    (at stephanie marina t480)
    (at stephanie marina t540)
    (at stephanie marina t552)
    (at stephanie marina t657)
    (at stephanie marina t900)
    (at traveler chinatown t540)
    (can-travel chinatown marina t540 t552)
    (can-travel marina chinatown t540 t556)
    (can-meet t552 t657)
  )
  (:goal (met stephanie traveler))
)