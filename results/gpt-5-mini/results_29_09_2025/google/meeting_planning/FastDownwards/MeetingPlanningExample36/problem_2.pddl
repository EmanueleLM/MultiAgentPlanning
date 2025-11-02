(define (problem meet-barbara-problem)
  (:domain rendezvous)
  (:objects
    traveler - agent
    barbara - friend
    marina embarcadero - location
    t540 t554 t810 t870 t1245 - timepoint
  )
  (:init
    (time t540)
    (at traveler marina)
    (next t540 t554)
    (next t554 t810)
    (next t810 t870)
    (next t870 t1245)
    (route marina embarcadero)
    (route embarcadero marina)
    (available-window barbara embarcadero t810 t870)
    (available-window barbara embarcadero t810 t1245)
    (available-window barbara embarcadero t870 t1245)
    (duration_ok t810 t870)
    (duration_ok t810 t1245)
    (duration_ok t870 t1245)
  )
  (:goal (and (met traveler barbara)))
)