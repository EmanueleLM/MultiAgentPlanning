(define (problem meet-barbara-problem)
  (:domain rendezvous)
  (:objects
    traveler - agent
    barbara - friend
    marina embarcadero - location
    t540 t554 t810 t870 - timepoint
  )

  (:init
    (time t540)
    (at traveler marina)
    (next t540 t554)
    (next t554 t810)
    (next t810 t870)
    (route marina embarcadero)
    (route embarcadero marina)
    (available barbara embarcadero)
  )

  (:goal (and (met traveler barbara)))
)