(define (problem depots33-problem)
  (:domain depots33)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    truck0 truck1 truck2 - truck
    crate0 crate1 crate2 - crate
  )
  (:init
    ; Locations of hoists, trucks, crates, and pallets
    (at crate0 distributor0)
    (at crate1 distributor0)
    (at crate2 depot2)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    ; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Stacking relations
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet2)

    ; Clear status based on stacking and explicit statements
    (clear crate1) ; Stated: nothing on crate1
    (clear crate2) ; Stated: nothing on crate2
    (clear pallet0) ; Stated: nothing on pallet0
    (clear pallet1) ; Stated: nothing on pallet1
    ; Implied not clear:
    ; (not (clear crate0)) because crate1 is on it
    ; (not (clear pallet2)) because crate2 is on it
    ; (not (clear pallet3)) because crate0 is on it
  )
  (:goal (and
    (on crate0 crate2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)