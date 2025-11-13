(define (problem TripPlanningExample23)
  (:domain trip-planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 - day
    london bucharest riga - city
  )

  (:init
    ; day and city type markers (optional but explicit)
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6) (day d7) (day d8)
    (city london) (city bucharest) (city riga)

    ; consecutive-day relation
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8)

    ; direct-flight adjacency (both directions)
    (edge london bucharest) (edge bucharest london)
    (edge bucharest riga) (edge riga bucharest)

    ; initially all days unassigned and no city visited
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4)
    (unassigned d5) (unassigned d6) (unassigned d7) (unassigned d8)
    ; (visited ...) are intentionally absent (false)
  )

  ; Goals:
  ;  - Every day must become assigned (represented as "not (unassigned dX)" for each day).
  ;  - Riga must be assigned for days 5,6,7,8 (workshop window fully covered).
  (:goal
    (and
      ; require Riga on workshop days 5..8
      (assigned d5 riga) (assigned d6 riga) (assigned d7 riga) (assigned d8 riga)

      ; require all days to be assigned (no unassigned days remaining)
      (not (unassigned d1)) (not (unassigned d2)) (not (unassigned d3)) (not (unassigned d4))
      (not (unassigned d5)) (not (unassigned d6)) (not (unassigned d7)) (not (unassigned d8))
    )
  )
)