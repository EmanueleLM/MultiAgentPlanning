(define (problem scenario-1)
  (:domain orchestration)
  (:objects
    a1 a2 - agent
    t1 t2 - task
    r1 - resource
    l1 l2 - location
  )
  (:init
    ;; agent locations
    (at a1 l1)
    (at a2 l2)

    ;; task locations
    (task-at t1 l1)
    (task-at t2 l2)

    ;; agent capabilities
    (capable a1 t1)
    (capable a2 t2)

    ;; resources initial availability
    (available r1)
  )
  (:goal
    (and
      (completed t1)
      (completed t2)
    )
  )
)