(define (problem depots46)
  (:domain depots46)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot2)
    (at-truck truck2 depot2)

    ;; hoists locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; pallets locations
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; crates locations (when on a pallet they are also at the same place)
    (at-crate crate0 depot0)
    (at-crate crate1 depot2)
    (at-crate crate2 depot1)

    ;; crate on pallet relations
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet1)

    ;; clearance: crates have nothing on top
    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)

    ;; pallet3 is empty initially (others are occupied by crates above)
    (clear-pallet pallet3)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet3)
    (on crate2 pallet2)
  ))
)