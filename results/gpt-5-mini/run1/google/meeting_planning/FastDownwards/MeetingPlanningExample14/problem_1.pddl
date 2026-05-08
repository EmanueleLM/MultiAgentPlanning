(define (problem meeting_planning_example14)
  (:domain meeting_planning)
  (:objects
    traveler mary - agent
    nobhill marina - location
    ;; Named timepoints used in this instance. They are symbolic; specific minute offsets are
    ;; encoded by the travel_link facts in the init.
    t09 t19_49 t20 t21 t22 - time
  )

  (:init
    ;; Hard constraint: you arrive at Nob Hill at 09:00 (t09).
    (at traveler nobhill t09)
    (free traveler t09)

    ;; For planning the evening travel leg, the traveler is available at Nob Hill at 19:49
    ;; and may depart then to arrive at Marina at 20:00 (11-minute travel).
    (at traveler nobhill t19_49)
    (free traveler t19_49)

    ;; The traveler must be free for the meeting slots (20:00 and 21:00).
    (free traveler t20)
    (free traveler t21)

    ;; Mary is available at Marina from 20:00 to 22:00 (two hourly slots: t20 and t21).
    (at mary marina t20)
    (at mary marina t21)
    (free mary t20)
    (free mary t21)

    ;; Explicit travel links encode asymmetric travel durations for the named timepoints.
    ;; Nob Hill -> Marina: depart at t19_49, arrive at t20  (11 minutes)
    (travel_link nobhill marina t19_49 t20)
    ;; Marina -> Nob Hill: depart at t21, arrive at t22 (12 minutes) - provided for completeness.
    (travel_link marina nobhill t21 t22)
  )

  (:goal (and
    ;; Enforce the arrival-at-Nob-Hill-at-09:00 hard constraint in the goal as well
    ;; (it is already present in the init, kept explicit to preserve the requirement).
    (at traveler nobhill t09)
    ;; Must have met Mary for at least 120 minutes between 20:00 and 22:00:
    ;; meeting action requires presence at both t20 and t21, so met-with-mary encodes that.
    (met-with-mary)
  ))
)