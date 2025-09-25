(define (problem meet-matthew-scheduling)
  (:domain multi-agent-meetings)

  (:objects
    you matthew - agent
    nobhill presidio - location
  )

  ;; Reference time: 0 == 9:00 AM
  ;; Matthew is available from 11:00 AM to 3:15 PM -> 120 to 375 minutes after 9:00
  (:init
    ;; locations at time 0 (9:00AM)
    (you-at nobhill)
    (matthew-at presidio)

    ;; meet counter starts at 0
    (= (meet-count) 0)

    ;; Timed initial literals to model Matthew's availability window:
    ;; Matthew becomes available at t=120 (11:00AM)
    ;; Matthew becomes unavailable at t=375 (3:15PM)
    (at 120 (matthew-available))
    (at 375 (not (matthew-available)))
  )

  ;; Goal: meet Matthew for at least 30 minutes.
  (:goal (met-you-matthew))

  ;; Also attempt to maximize total meetings (meet-count). With the available information
  ;; the planner can schedule at most one meeting with Matthew; still we include metric.
  (:metric maximize (meet-count))
)