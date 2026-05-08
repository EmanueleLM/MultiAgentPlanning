(define (problem place-crates)
  (:domain multiagent-hoist-driver)
  (:objects
    d1 - driver
    h1 - hoist
    crate1 crate2 - crate
    pallet1 pallet3 - pallet
    locA locB locC - location
  )
  (:init
    ;; initial agent and equipment placement
    (at d1 locA)
    (at h1 locA)
    (hoist-free h1)

    ;; initial crate and pallet locations (none of the crates are on pallets)
    (at crate1 locA)
    (at pallet1 locB)

    (at crate2 locC)
    (at pallet3 locC)
  )
  (:goal (and
           (on crate1 pallet1)
           (on crate2 pallet3)
         ))
)