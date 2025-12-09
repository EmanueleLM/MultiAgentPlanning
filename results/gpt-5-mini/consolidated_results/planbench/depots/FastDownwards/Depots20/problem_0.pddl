(define (problem multiagent-orch-problem)
  (:domain multiagent-orch)

  (:objects
    ;; agents
    orch1 - orchestrator
    hoist1 - hoist
    driver1 - driver

    ;; physical objects
    crate1 - container
    truck1 - truck

    ;; locations
    dock road yard - location

    ;; tasks
    t_alloc t_hoist_lift t_driver_drive t_hoist_place t_audit - task

    ;; slots (explicit discrete phases)
    s1 s2 s3 s4 s5 - slot
  )

  (:init
    ;; agent typing assertions
    (is-orch orch1)
    (is-hoist hoist1)
    (is-driver driver1)

    ;; initial physical positions
    (at hoist1 dock)
    (at driver1 road)
    (truck-at truck1 road)
    (container-at crate1 dock)

    ;; tasks assigned to explicit slots (hard constraints)
    (task-assigned-slot t_alloc s1)
    (task-assigned-slot t_hoist_lift s2)
    (task-assigned-slot t_driver_drive s3)
    (task-assigned-slot t_hoist_place s4)
    (task-assigned-slot t_audit s5)

    ;; explicit slot order (informative; ordering enforced by task precedences below)
    (slot-successor s1 s2)
    (slot-successor s2 s3)
    (slot-successor s3 s4)
    (slot-successor s4 s5)

    ;; explicit task precedences to enforce ordering (hard constraints)
    (precedes t_alloc t_hoist_lift)
    (precedes t_hoist_lift t_driver_drive)
    (precedes t_driver_drive t_hoist_place)
    (precedes t_hoist_place t_audit)

    ;; no tasks completed yet; no slots used; no allocations yet
    ;; (everything that must hold finally will be enforced in the goal)
  )

  (:goal
    (and
      ;; final physical terminal conditions mandated
      (on-truck crate1 truck1)
      (truck-at truck1 dock)
      ;; hoist no longer holding the container
      (not (hoist-holding hoist1 crate1))
      ;; driver ends up at the dock (co-located with truck)
      (at driver1 dock)

      ;; all tasks must be completed and audit must be done (hard constraints)
      (task-complete t_alloc)
      (task-complete t_hoist_lift)
      (task-complete t_driver_drive)
      (task-complete t_hoist_place)
      (task-complete t_audit)
      (audit-complete)
    )
  )
)