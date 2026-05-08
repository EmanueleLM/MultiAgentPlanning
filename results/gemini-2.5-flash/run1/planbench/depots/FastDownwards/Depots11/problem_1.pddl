(define (problem depots11-problem)
  (:domain depots11)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
  )
  (:init
    ;; Crate locations
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot0)
    ;; Hoist locations
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    ;; Truck locations
    (at truck0 distributor0)
    (at truck1 depot0)
    (at truck2 depot0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Stacking relations
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 crate1)

    ;; Clear status
    (clear crate2) ; as nothing is on crate2
    (not (clear crate1)) ; crate2 is on crate1
    (not (clear crate0)) ; crate1 is on crate0
    (not (clear pallet0)) ; crate0 is on pallet0
    (clear pallet1) ; nothing on pallet1
    (clear pallet2) ; nothing on pallet2
    (clear pallet3) ; nothing on pallet3
  )
  (:goal (and
    (on crate0 pallet1)
    (on crate1 crate2)
    (on crate2 pallet0)
  ))
)