(define (problem move-crates-and-audit)
  (:domain multi-agent-orchestration)

  (:objects
    ;; Agents
    H1 - hoist
    D1 - driver

    ;; Crates and tasks
    crateA crateB - crate
    t1 t2 - task

    ;; Locations
    storage truck_loc destination - location

    ;; Phases
    ph0 ph_alloc1 ph_load ph_unload ph_done - phase
  )

  (:init
    ;; Initial positions
    (hoist-at H1 storage)
    (driver-at D1 truck_loc)
    (crate-at crateA storage)
    (crate-at crateB storage)

    ;; Task -> crate mapping
    (task-of t1 crateA)
    (task-of t2 crateB)

    ;; Phase progression facts (static)
    (phase-succ ph0 ph_alloc1)
    (phase-succ ph_alloc1 ph_load)
    (phase-succ ph_load ph_unload)
    (phase-succ ph_unload ph_done)

    ;; Start phase
    (phase-is ph0)

    ;; No assignments, no on-truck, no unloads yet (these are simply absent)
  )

  (:goal
    (and
      ;; Final mandated terminal conditions
      (crate-at crateA destination)
      (crate-at crateB destination)
      (task-completed t1)
      (task-completed t2)
      (audit-report-done)
      (driver-at D1 destination)
    )
  )
)