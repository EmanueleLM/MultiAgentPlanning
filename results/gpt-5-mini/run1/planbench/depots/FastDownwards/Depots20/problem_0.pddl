(define (problem orchestrator-problem)
  (:domain orchestrator)
  (:objects
    ;; agents
    h1 - hoist
    d1 - driver

    ;; items
    c1 - container
    t1 - truck

    ;; locations
    yard dock final - location

    ;; single task
    load1 - task

    ;; time slots modeled explicitly and chained
    s0 s1 s2 s3 - slot

    ;; report object
    r1 - report
  )

  (:init
    ;; agent and capability declarations
    (hoist h1)
    (hoist-available h1)
    (driver d1)
    (driver-available d1)

    ;; physical initial state
    (container c1)
    (truck t1)

    (container-at c1 yard)
    (truck-at t1 dock)

    ;; task specification (must be allocated before execution)
    (task load1)
    (task-for-container load1 c1)
    (task-target-truck load1 t1)

    ;; slot ordering enforces contiguous sequence: pick(s0) -> place(s1) -> attach(s2) -> drive(s3)
    (slot s0)
    (slot s1)
    (slot s2)
    (slot s3)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
  )

  (:goal
    (and
      ;; terminal conditions required by the specification:
      ;; container must be loaded onto the truck, the truck must be at the final location,
      ;; the task must be completed, and an audit report for the task must exist.
      (container-loaded c1 t1)
      (truck-at t1 final)
      (task-completed load1)
      (audit-produced load1)
      (report-generated r1)
      (audit-reports r1 load1)
    )
  )
)