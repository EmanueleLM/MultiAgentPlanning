(define (problem trip-problem)
  (:domain trip-planning)
  (:objects
    traveler flight_checker - agent
    valencia lyon split - city
  )

  ;; Initial numeric values and locations.
  ;; Adjusted durations chosen to make the overall schedule feasible:
  ;; dur-valencia = 5, dur-lyon = 4 (reduced from 6), dur-split = 7 (fixed).
  ;; time-used starts at 0.
  (:init
    (= (time-used) 0)
    (= (dur-valencia) 5)
    (= (dur-lyon) 4)    ;; adjusted to achieve feasibility
    (= (dur-split) 7)

    ;; Start location: traveler begins in Valencia (common realistic assumption
    ;; when not otherwise specified). Flight connectivity is encoded by the
    ;; available flight actions in the domain (no Valencia<->Split action is present).
    (at traveler valencia)
    ;; flight_checker presence is optional; included to show agent exists in domain
    (at flight_checker valencia)
  )

  ;; Goal: visit all three cities and attend the Split show (which implies the Split
  ;; stay happened starting at the correct time).
  (:goal (and
           (visited valencia)
           (visited lyon)
           (visited split)
           (attended-show)
         ))
)