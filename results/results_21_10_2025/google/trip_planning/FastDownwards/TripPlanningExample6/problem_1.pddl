(define (problem TripPlanningExample6-problem)
  (:domain TripPlanningExample6)
  (:objects
    berlin munich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    ;; day sequencing (consecutive day relationships)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    ;; start location: in Berlin on day 1 (conference day 1)
    (in berlin d1)
    (occupied d1)

    ;; Note: visited predicates are initially false (not listed).
    ;; Travel connectivity is enforced by available actions (only Munich<->Berlin and Munich<->Dubrovnik)
  )

  ;; Goals:
  ;; - Must be in Berlin on day 1 and day 4 (conference constraint)
  ;; - Must visit Munich at least once (visited-munich)
  ;; - Must visit Dubrovnik at least once (visited-dubrovnik)
  ;; These goals do not hard-code which specific days are assigned to Munich/Dubrovnik beyond the conference days,
  ;; but the domain actions and occupancy constraints force a consistent assignment using only direct flights.
  (:goal
    (and
      (in berlin d1)
      (in berlin d4)
      (visited-munich)
      (visited-dubrovnik)
    )
  )
)