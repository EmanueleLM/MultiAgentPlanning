(define (problem scenario1)
  (:domain multi-agent-scheduling)
  (:objects
    analyst_a analyst_b - agent
    s1 s2 s3 - slot
  )
  (:init
    (free s2)
    (allowed s2)
    (available analyst_a s2)
    (available analyst_b s2)
  )
  (:goal (meeting-scheduled))
)