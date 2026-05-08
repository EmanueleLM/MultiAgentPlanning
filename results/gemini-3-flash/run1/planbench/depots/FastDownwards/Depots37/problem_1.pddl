(define (problem depots37)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )
  (:init
    ;; Places and connectivity are handled by the drive action between any two places.

    ;; Hoist locations and availability
    (at hoist0 depot0)
    (available hoist0)
    (at hoist1 depot1)
    (available hoist1)
    (at hoist2 depot2)
    (available hoist2)
    (at hoist3 distributor0)
    (available hoist3)

    ;; Pallet locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Truck locations
    (at truck0 depot0)
    (at truck1 distributor0)
    (at truck2 depot1)

    ;; Crate locations and stacking relations
    (at crate0 depot0)
    (on crate0 pallet0)
    (at crate1 depot0)
    (on crate1 crate0)
    (at crate2 distributor0)
    (on crate2 pallet3)

    ;; Surface clearance
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
    ;; (pallet0, pallet3, and crate0 are not clear because something is on them)
  )
  (:goal
    (and
      (on crate0 pallet2)
      (on crate1 pallet0)
      (on crate2 pallet1)
    )
  )
)