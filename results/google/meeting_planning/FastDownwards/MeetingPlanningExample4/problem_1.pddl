(define (problem meeting-problem)
  (:domain meeting-planning)
  (:objects
    you jessica orchestrator - agent
    presidio marina - location
  )
  (:init
    (at you presidio)
    (= (meeting-time) 0)
    ;; Jessica will become present and available at marina at 09:15 (15 minutes after start)
    ;; and will stop being present and available at 17:45 (525 minutes after start).
    (at 15 (at jessica marina))
    (at 525 (not (at jessica marina)))
    (at 15 (available jessica))
    (at 525 (not (available jessica)))
  )
  (:goal (and
    (>= (meeting-time) 60)
  ))
  (:metric maximize (meeting-time))
)