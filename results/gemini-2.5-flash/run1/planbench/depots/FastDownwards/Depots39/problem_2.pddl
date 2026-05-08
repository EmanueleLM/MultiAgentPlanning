(define (problem depots39-problem)
  (:domain depots39)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ; Object locations
    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 depot2)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 depot2)

    ; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Crate clear status (nothing on top)
    (clear crate0)
    (clear crate2)
    ; crate1 is NOT clear because crate2 is on it.

    ; Pallet clear status (nothing on top)
    (clear pallet0)
    (clear pallet3)
    ; pallet1 is NOT clear because crate0 is on it.
    ; pallet2 is NOT clear because crate1 is on it.

    ; Crate on surface relations
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 crate1)
  )
  (:goal (and
    (on crate0 pallet1)
    (on crate1 pallet3)
    (on crate2 crate0)
  ))
)