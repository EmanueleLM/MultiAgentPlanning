(define (problem meeting_planning_example14)
  (:domain meeting_planning)
  (:objects
    traveler - traveler
    mary - person
    nobhill marina - location
    t09 t19_49 t20 t22 - time
  )

  (:init
    ;; Traveler arrives at Nob Hill at 09:00 (start of day).
    (at traveler nobhill t09)

    ;; Mary's declared availability: at Marina at 20:00 and at 22:00 (the window endpoints).
    (at mary marina t20)
    (at mary marina t22)

    ;; Explicit time ordering (symbolic timepoints). These are the only timepoints used in the instance.
    (next t09 t19_49)
    (next t19_49 t20)
    (next t20 t22)

    ;; Explicit travel link encoding the known travel duration from Nob Hill -> Marina:
    ;; traveling from nobhill at t19_49 to marina at t20 corresponds to the 11-minute travel interval.
    (travel_link nobhill marina t19_49 t20)
  )

  ;; Goal: accomplish the required meeting span with Mary (120 minutes between 20:00 and 22:00).
  (:goal (met-with-mary))
)