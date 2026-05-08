(define (problem depots16-problem)
  (:domain depots16-domain)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; Truck locations
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; Crate locations (crates start at places, on surfaces)
    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 depot0)

    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Hoist locations (fixed)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Stacking configuration
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 crate0)

    ;; Clear status
    ; Objects that have nothing on them are clear
    (clear crate1) ; Crate1 is on pallet2, but nothing is on crate1
    (clear crate2) ; Crate2 is on crate0, but nothing is on crate2
    (clear pallet1)
    (clear pallet3)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Initial total cost
    (= (total-cost) 0)
  )
  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
  ))
  (:metric minimize (total-cost))
)