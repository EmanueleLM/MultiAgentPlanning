(define (problem MeetingPlanningProblem24)
  (:domain MeetingPlanningExample24)
  (:objects
    NobHill Presidio - location
    Matthew - person
  )

  (:init
    ;; Start location at 09:00 (time 0)
    (at NobHill)

    ;; Map connectivity (directed edges)
    (connected NobHill Presidio)
    (connected Presidio NobHill)

    ;; Friend locations
    (person_at Matthew Presidio)

    ;; Initially Matthew is not available; TILs will toggle availability at correct times.
  )

  ;; Timed Initial Literals:
  ;; Our time 0 corresponds to 09:00.
  ;; Matthew available_from = 11:00 => 120 minutes after 09:00
  ;; Matthew available_to   = 15:15 => 375 minutes after 09:00
  (:timed-initial-literals
    ;; Availability window opens at 11:00 (time 120)
    (at 120 (available Matthew))
    (at 120 (at_time_available))

    ;; Availability window closes at 15:15 (time 375)
    (at 375 (not (available Matthew)))
    (at 375 (not (at_time_available)))
  )

  (:goal (and
    (met Matthew)
  ))

  (:metric minimize (total-time))
)