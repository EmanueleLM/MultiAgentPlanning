(define (problem depots23_problem)
  (:domain depots23_domain)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet
  )
  (:init
    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Truck locations
    (at truck0 distributor0)
    (at truck1 depot1)
    (at truck2 distributor0)

    ;; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Pallet locations (pallets are treated as static infrastructure in terms of movement actions by hoists/trucks)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Crate locations
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 distributor0)

    ;; Stacking relations
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet3)

    ;; Clear surfaces based on initial stacking and explicit clear statements
    ;; (clear crate1) because nothing is on it
    ;; (clear crate2) because nothing is on it
    ;; (clear pallet1) because nothing is on it
    ;; (clear pallet2) because nothing is on it
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    ;; Implied NOT clear: pallet0 (has crate0), crate0 (has crate1), pallet3 (has crate2)
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)