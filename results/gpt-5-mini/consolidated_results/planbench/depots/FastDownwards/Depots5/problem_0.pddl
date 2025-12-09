(define (problem deliver-crates)
  (:domain multiagent-hoist-truck)

  ;; Objects
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; crates
    crate0 crate1 crate2 - crate

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; --- place connectivity (roads exist between any pair of depots/distributors; bidirectional)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

    ;; --- initial locations: trucks
    (at truck0 depot0)
    (at truck1 depot0)
    (at truck2 depot1)

    ;; --- initial locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; --- hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; --- trucks idle
    (truck-idle truck0)
    (truck-idle truck1)
    (truck-idle truck2)

    ;; --- pallets and crates location at places (presence)
    (at pallet3 distributor0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet0 depot0)

    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 distributor0)

    ;; --- stacking relationships (the stack at distributor0: pallet3 <- crate0 <- crate1 <- crate2)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; --- clear predicates
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    (clear pallet2)
    ;; pallet3, crate0, crate1 are not clear initially (no clear facts for them)

    ;; --- explicit transport assignments to enforce routing and ordering
    ;; As provided by the orchestrator:
    ;; crate2 must be transported by truck0 from distributor0 to depot2
    ;; crate1 must be transported by truck2 from distributor0 to depot1
    (assigned crate2 truck0 distributor0 depot2)
    (assigned crate1 truck2 distributor0 depot1)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)