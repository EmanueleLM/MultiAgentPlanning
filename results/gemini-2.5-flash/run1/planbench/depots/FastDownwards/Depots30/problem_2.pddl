(define (problem depots30-problem)
  (:domain depots30)
  (:objects
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
  )
  (:init
    ; Crate locations
    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 depot2)

    ; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ; Truck locations
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot1)

    ; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Clear surfaces (explicitly stated)
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet3)

    ; Crate on surface relations
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 crate1)

    ; Infer negative clear conditions from 'on' relations (for completeness and consistency)
    (not (clear pallet1)) ; because crate0 is on it
    (not (clear pallet2)) ; because crate1 is on it
    (not (clear crate1))  ; because crate2 is on it
  )
  (:goal (and
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet2)
  ))
)