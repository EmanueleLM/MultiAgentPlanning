(define (problem meeting_planning_example14)
  (:domain meeting_planning)
  (:objects
    traveler mary - person
    nobhill marina - location
    t09 t19_49 t20 t22 - time
  )

  (:init
    ;; Traveler arrives at Nob Hill at 09:00.
    (at traveler nobhill t09)

    ;; Mary's availability window endpoints: at Marina at 20:00 and at 22:00.
    (at mary marina t20)
    (at mary marina t22)

    ;; Symbolic time ordering (immediate successors).
    (next t09 t19_49)
    (next t19_49 t20)
    (next t20 t22)

    ;; Explicit travel link encoding known travel duration (nobhill -> marina corresponds to the interval t19_49 -> t20).
    (travel_link nobhill marina t19_49 t20)
  )

  ;; Goal: achieve the required meeting span with Mary (presence at start and end of the 120-minute window).
  (:goal (met-with-mary))
)