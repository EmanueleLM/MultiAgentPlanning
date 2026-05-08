(define (problem meeting_planning_example15-prob)
  (:domain meeting_planning_example15)
  (:objects
    traveler john auditor orchestrator - agent
    russian_hill golden_gate_park - location
    t0 t21 t240 t330 t555 - time
  )

  (:init
    ;; Traveler arrives at Russian Hill at 09:00 (t0)
    (at traveler russian_hill t0)

    ;; John will be at Golden Gate Park starting at 13:00 (t240)
    (at john golden_gate_park t240)

    ;; Explicit routes (no self-route is declared, so travel cannot be used to "wait")
    (route russian_hill golden_gate_park)

    ;; Discrete ordered time links (symbolic representation of feasible time advances)
    ;; t0 -> t21 represents the 21-minute travel from Russian Hill to Golden Gate Park
    ;; t21 -> t240 represents waiting/advancing to John's availability window (9:21 -> 13:00)
    ;; t240 -> t330 is a 90-minute interval (13:00 -> 14:30)
    ;; t330 -> t555 is the remainder up to John's latest availability (14:30 -> 18:15)
    (time_link t0 t21)
    (time_link t21 t240)
    (time_link t240 t330)
    (time_link t330 t555)

    ;; John's availability intervals encoded explicitly so meeting durations that
    ;; respect the "minimum 90 minutes" constraint are structural.
    ;; These entries make available the 90-minute block starting at 13:00 and
    ;; also permit longer meetings that extend to 18:15.
    (available john golden_gate_park t240 t330)
    (available john golden_gate_park t240 t555)
    (available john golden_gate_park t330 t555)
  )

  ;; Hard goal: meet John (the meet action ensures at least one allowed interval is used)
  (:goal (met traveler john))
)