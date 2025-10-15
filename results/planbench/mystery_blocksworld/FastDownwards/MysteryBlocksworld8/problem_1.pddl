(define (problem schedule-six-actions)
  (:domain multi-agent-scheduling)
  (:objects
    observer manipulator - agent
    s1 s2 s3 - slot
  )
  (:init
    (agent-available observer)
    (agent-available manipulator)
    (slot-free s1)
    (slot-unavailable s2)
    (slot-unavailable s3)
  )
  (:goal (and
    (done-paltry)
    (done-sip)
    (done-clip)
    (done-wretched)
    (done-memory)
    (done-tightfisted)
  ))
)