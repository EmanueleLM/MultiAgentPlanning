(define (problem orchestration-problem)
  (:domain orchestration-domain)

  (:objects
    ;; Agents
    observer1 executor1 auditor1 - agent

    ;; Items to be inventoried, processed, and audited
    item1 item2 - item

    ;; Locations (all placed at the same location for simplicity; movement allowed)
    storage - location

    ;; Phases (explicit time slots)
    p1 p2 p3 - phase
  )

  (:init
    ;; Roles
    (role-observer observer1)
    (role-executor executor1)
    (role-auditor auditor1)

    ;; Agent locations
    (agent-at observer1 storage)
    (agent-at executor1 storage)
    (agent-at auditor1 storage)

    ;; Item locations
    (item-at item1 storage)
    (item-at item2 storage)

    ;; Phase structure and starting phase
    (phase p1)
    (phase p2)
    (phase p3)
    (next p1 p2)
    (next p2 p3)
    (current-phase p1)

    ;; No items are inventoried, processed, or verified at start
    ;; (inventoried item1) absent
    ;; (processed item1) absent
    ;; (verified item1) absent
    ;; same for item2
  )

  (:goal
    (and
      ;; Auditor report mandates every item must be verified and the process must be in final phase p3
      (verified item1)
      (verified item2)
      (current-phase p3)
    )
  )
)