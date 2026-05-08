(define (problem meeting_planning_example14)
  (:domain meeting_planning)
  (:objects
    traveler mary - agent
    nobhill marina - location
    t09 t19_49 t20 t21 t22 - time
  )

  (:init
    (at traveler nobhill t09)
    (free traveler t09)

    (at traveler nobhill t19_49)
    (free traveler t19_49)

    (free traveler t20)
    (free traveler t21)

    (at mary marina t20)
    (at mary marina t21)
    (free mary t20)
    (free mary t21)

    (travel_link nobhill marina t19_49 t20)
    (travel_link marina nobhill t21 t22)

    (is-mary mary)
    (next t20 t21)
  )

  (:goal (and
    (at traveler nobhill t09)
    (met-with-mary)
  ))
)