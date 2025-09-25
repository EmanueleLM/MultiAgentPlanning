(define (problem meeting-example)
  (:domain meeting-orchestration)
  (:objects
    visitor william - agent
    nobhill thecastro - location
  )
  (:init
    ;; You arrive at Nob Hill at 09:00 -> total-time = 0
    (at visitor nobhill)
    (at william thecastro)
    (= (total-time) 0)
  )
  (:goal (meeting-scheduled))
)