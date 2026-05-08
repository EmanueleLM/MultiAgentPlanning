(define (problem move-container-instance)
  (:domain multiagent-logistics)
  (:objects
    truck1 - truck
    hoist1 - hoist
    container1 - container
    load - location
    unload - location
  )

  (:init
    ;; initial positions
    (truck-at truck1 load)
    (hoist-at hoist1 load)
    (container-at container1 load)

    ;; No initial safety checks, engagements, locks, or secured flags are asserted.
    ;; (Absence of a predicate denotes false in the initial state.)
  )

  ;; Goal: container moved to unload location, on ground (not on truck/hoist),
  ;; truck and hoist at unload location, and all safety-critical devices disengaged/ unlocked.
  (:goal
    (and
      (container-at container1 unload)
      (truck-at truck1 unload)
      (hoist-at hoist1 unload)
      (not (container-on-truck container1 truck1))
      (not (container-on-hoist container1 hoist1))
      (not (hoist-engaged hoist1))
      (not (truck-locked truck1))
    )
  )
)