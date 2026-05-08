(define (problem deliver-crates)
  (:domain multiagent-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (pallets/crates are also surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; surfaces (pallets and crates are typed as surfaces via their types above)
  )

  (:init
    ;; roads: fully connected among listed places (directed)
    (road depot0 depot1)
    (road depot0 depot2)
    (road depot0 distributor0)
    (road depot1 depot0)
    (road depot1 depot2)
    (road depot1 distributor0)
    (road depot2 depot0)
    (road depot2 depot1)
    (road depot2 distributor0)
    (road distributor0 depot0)
    (road distributor0 depot1)
    (road distributor0 depot2)

    ;; initial truck locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot1)

    ;; hoist locations and availability
    (at-hoist hoist0 depot0)
    (hoist-available hoist0)
    (at-hoist hoist1 depot1)
    (hoist-available hoist1)
    (at-hoist hoist2 depot2)
    (hoist-available hoist2)
    (at-hoist hoist3 distributor0)
    (hoist-available hoist3)

    ;; pallets: locations and clear flags
    (surface-at pallet0 depot0)
    (clear pallet0)
    (surface-at pallet1 depot1)
    (clear pallet1)   ;; target for crate1
    (surface-at pallet2 depot2)
    (clear pallet2)   ;; target for crate2
    (surface-at pallet3 distributor0)
    ;; pallet3 is not clear because crate0 is on it (see below)

    ;; crate stack at distributor0:
    ;; pallet3 <- crate0 <- crate1 <- crate2 (crate2 is top and clear)
    (crate-at crate0 distributor0)
    (surface-at crate0 distributor0)
    (on crate0 pallet3)
    (not (clear pallet3))  ;; pallet3 occupied by crate0

    (crate-at crate1 distributor0)
    (surface-at crate1 distributor0)
    (on crate1 crate0)
    ;; crate1 not clear initially (crate2 on top)

    (crate-at crate2 distributor0)
    (surface-at crate2 distributor0)
    (on crate2 crate1)
    (clear crate2)

    ;; hoist-busy synchronization token: no hoist busy at all places initially
    (no-hoist-busy depot0)
    (no-hoist-busy depot1)
    (no-hoist-busy depot2)
    (no-hoist-busy distributor0)
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))