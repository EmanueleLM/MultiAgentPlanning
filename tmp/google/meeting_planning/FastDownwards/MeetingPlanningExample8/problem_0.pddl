(define (problem meet-stephanie-traveler)
  (:domain meeting-orchestration)

  (:objects
    stephanie traveler - person
    marina chinatown - location

    ;; timepoints (minutes from midnight)
    t480 t540 t552 t556 t657 t900 - time
  )

  (:init
    ;; Stephanie is available at Marina from 08:00 to 15:00.
    (at stephanie marina t480)
    (at stephanie marina t540)
    (at stephanie marina t552)
    (at stephanie marina t657)
    (at stephanie marina t900)

    ;; Traveler arrives at Chinatown at 09:00.
    (at traveler chinatown t540)

    ;; Travel times (directional)
    ;; Chinatown -> Marina: 12 minutes (09:00 -> 09:12)
    ;; Marina -> Chinatown: 16 minutes (09:00 -> 09:16)
    (can-travel chinatown marina t540 t552)
    (can-travel marina chinatown t540 t556)

    ;; Meeting requirement: must last at least 105 minutes.
    ;; Feasible meeting window modeled: start at t552 (09:12), end at t657 (10:57)
    (can-meet t552 t657)
  )

  (:goal (met stephanie traveler))
)