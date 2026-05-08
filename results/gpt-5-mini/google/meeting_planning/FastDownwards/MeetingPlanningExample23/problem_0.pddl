(define (problem bayview-day-planning)
  (:domain bayview-scheduling)

  ; Objects: agents, locations, discrete timepoints used by the candidate schedules,
  ; and a single flag object to mark that a schedule has been chosen.
  (:objects
    traveler john - agent
    bayview russianhill - location

    ; explicit timepoints used in the schedules (all times listed in candidate schedules)
    t0900 t1200 t1300 t1400 t1507 t1530 t1630 t1653 t1707 t1725 t1730 t1845 t1900 t1908 t1915 t1923 t1938 t2100 t2123 - time

    flag1 - flag
  )

  (:init
    ; Day starts with traveler in Bayview at 09:00
    (traveler-at traveler bayview t0900)

    ; John's published availability window (explicit interval)
    (john-available t1730 t2100)

    ; Travel legs that encode the fixed 23-minute transit duration for departures/arrivals used by schedules.
    ; These facts represent the allowed / scheduled transit pairs (no other transit pairs are provided).
    (travel-leg bayview russianhill t1507 t1530) ; Schedule B afternoon arrival leg
    (travel-leg bayview russianhill t1707 t1730) ; common departure to meet John on time
    (travel-leg bayview russianhill t1630 t1653) ; Schedule D depart/arrive in late afternoon

    (travel-leg russianhill bayview t2100 t2123) ; evening return used by A & B
    (travel-leg russianhill bayview t1845 t1908) ; Schedule C return after 75-min meeting
    (travel-leg russianhill bayview t1900 t1923) ; Schedule D1 return after 19:00
    (travel-leg russianhill bayview t1915 t1938) ; Schedule D2 return after 19:15

    ; No schedule chosen initially (absence of (chosen flag1) makes (not (chosen flag1)) true)
  )

  ; Goals: enforce every mandated terminal condition.
  ; - The day plan must include at least one schedule that achieves a continuous meeting of >= 75 minutes.
  ; - A schedule must have been chosen (the flag ensures exactly one atomic schedule action occurred).
  (:goal (and
    (chosen flag1)
    (met-at-least-75)
  ))
)