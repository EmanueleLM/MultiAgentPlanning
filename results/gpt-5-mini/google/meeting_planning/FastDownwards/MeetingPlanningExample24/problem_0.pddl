(define (problem meet-matthew-final)
  (:domain meet-matthew-scheduling)

  (:objects
    you matthew - person
    nobhill presidio - location
    ;; timepoints are minutes since 09:00 (09:00 -> t0). Only the timepoints used by candidate schedules are modeled:
    t0 t103 t120 t135 t150 t153 t163 t168 t180 t240 t258 t283 t300 t315 t328 t333 t345 t375 t393 - timepoint
  )

  (:init
    ;; initial location: you are at Nob Hill at 09:00 (t0)
    (at you nobhill t0)

    ;; Matthew's availability as provided: continuous 11:00..15:15 corresponds to t120..t375.
    ;; To enable candidate meetings we assert the exact availability intervals that candidate actions require.
    (matt_available t120 t150)   ;; Candidate B earliest 30-min block (11:00-11:30)
    (matt_available t180 t240)   ;; Candidate C midday 1-hour block (12:00-13:00)
    (matt_available t345 t375)   ;; Candidate A late 30-min block (14:45-15:15)
    (matt_available t120 t375)   ;; Candidate E full-availability meeting (11:00-15:15)

    ;; initialize optimization function
    (= (total-cost) 0)
  )

  ;; The global goal is to accomplish the required meeting with Matthew for at least 30 minutes during his availability.
  (:goal (and
    (met_matt)
    (plan-chosen)    ;; ensure exactly one candidate plan has been selected/executed
  ))

  ;; Optimize: minimize total minutes spent away from Nob Hill over the modeled day
  (:metric minimize (total-cost))
)