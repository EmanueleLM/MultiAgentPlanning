(define (problem scenario1)
  (:domain multi-agent-scheduling)
  (:objects
    analyst_A analyst_B - agent
    s1 s2 s3 - slot
  )

  (:init
    ; Only s2 is marked free and allowed so the planner must choose the earliest slot that satisfies the constraints.
    (free s2)
    (allowed s2)

    ; Assumed availabilities (from analyst reports, assumed here): both analysts available at s2.
    (available analyst_A s2)
    (available analyst_B s2)
  )

  ; Hard goal: meeting must be scheduled (finalize-meeting must be executed).
  (:goal (meeting-scheduled))
)