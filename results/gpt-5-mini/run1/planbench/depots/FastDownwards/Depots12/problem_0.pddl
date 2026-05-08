(define (problem multiagent-logistics-problem)
  (:domain multiagent-logistics)

  (:objects
    truck1 - truck
    hoist1 - hoist
    depot site dest - location
    container1 - container
    s1 s2 s3 s4 s5 s6 s7 s8 s9 - step
  )

  (:init
    ;; initial positions
    (at-truck truck1 depot)
    (at-hoist hoist1 site)
    (at-container container1 site)

    ;; states
    (truck-empty truck1)
    (hoist-idle hoist1)

    ;; sequencing: start at step 1
    (current-step s1)
  )

  (:goal (and
    ;; final required terminal conditions (auditor mandated)
    (at-container container1 dest)   ;; container must be at destination on ground
    (at-truck truck1 dest)           ;; truck must be at destination
    (truck-empty truck1)             ;; truck unloaded
    (hoist-idle hoist1)              ;; hoist idle at end
    (current-step s9)                ;; enforced phase completion
  ))
)