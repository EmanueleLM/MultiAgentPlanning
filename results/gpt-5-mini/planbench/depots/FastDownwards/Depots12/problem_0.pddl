(define (problem transport-hoist-mission)
  (:domain multiagent-transport-hoist)

  (:objects
    ;; agents
    truck1 - truck
    hoist1 - hoist

    ;; items to move
    crate1 - item

    ;; locations
    depot pickup_loc drop_loc - location

    ;; explicit ordered steps: s0 is initial completed sentinel, s1..s6 are mission steps
    s0 s1 s2 s3 s4 s5 s6 - step
  )

  (:init
    ;; initial positions
    (at-truck truck1 depot)
    (at-hoist hoist1 pickup_loc)

    ;; item initial location
    (on-ground crate1 pickup_loc)

    ;; availability
    (truck-free truck1)
    (hoist-free hoist1)

    ;; connectivity (bidirectional where needed)
    (connected depot pickup_loc)
    (connected pickup_loc depot)
    (connected pickup_loc drop_loc)
    (connected drop_loc pickup_loc)

    ;; sequencing: s0 completed initially; no other step completed
    (step-complete s0)
    ;; s1..s6 are not true initially (omitted from init to remain false)
  )

  (:goal (and
    ;; final terminal conditions mandated by the specification/auditor:
    ;; crate must be on the ground at the drop location
    (on-ground crate1 drop_loc)

    ;; both agents must be at the drop location at termination
    (at-truck truck1 drop_loc)
    (at-hoist hoist1 drop_loc)

    ;; both agents free (hoist not holding, truck empty)
    (truck-free truck1)
    (hoist-free hoist1)

    ;; all ordered steps must be completed in sequence
    (step-complete s1)
    (step-complete s2)
    (step-complete s3)
    (step-complete s4)
    (step-complete s5)
    (step-complete s6)
  ))