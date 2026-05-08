(define (problem meeting-instance)
  (:domain meeting-planning)
  (:objects
    betty alice - person
    home_betty home_alice office - location
    t0 t1 t2 t3 t4 - time
  )

  (:init
    ;; Initial locations at time t0
    (at betty home_betty t0)
    (at alice home_alice t0)

    ;; Temporal structure (successor links)
    (consecutive t0 t1)
    (consecutive t1 t2)
    (consecutive t2 t3)
    (consecutive t3 t4)

    ;; Travel possibilities (precomputed intervals matching travel durations)
    ;; Betty needs 2 time steps to go from home_betty to office.
    (can-travel home_betty office t0 t2)
    (can-travel home_betty office t1 t3)
    (can-travel home_betty office t2 t4)

    ;; Alice needs 1 time step to go from home_alice to office.
    (can-travel home_alice office t1 t2)
    (can-travel home_alice office t2 t3)
    (can-travel home_alice office t3 t4)

    ;; Location availability windows (hard constraints)
    ;; Office is available for meetings covering the interval t2 -> t4 (i.e., occupying t2 and t3).
    (loc-available office t2 t4)

    ;; Betty's minimum meeting-duration constraint: meetings involving Betty must be at least 2 time steps.
    ;; We encode the allowed interval(s) for which that minimum holds.
    (beth-min t2 t4)
  )

  ;; The goals fix the mandated terminal conditions:
  ;; - the meeting at the office spanning t2 -> t4 must have been held,
  ;; - both agents must be located at the office at the terminal time t4.
  (:goal (and
    (meeting-held office t2 t4)
    (at betty office t4)
    (at alice office t4)
  ))
)