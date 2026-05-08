(define (problem depots26-problem)
  (:domain depots)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    ; Crate locations
    (at crate0 depot0)
    (at crate1 depot1)
    (at crate2 distributor0)

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
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)

    ; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Initial clearance status for crates
    (clear crate0)
    (clear crate1)
    (clear crate2)

    ; Initial clearance status for pallets
    (clear pallet2) ; Pallet2 is explicitly stated as clear (nothing on it)
    (not (clear pallet0)) ; Crate0 is on pallet0
    (not (clear pallet1)) ; Crate1 is on pallet1
    (not (clear pallet3)) ; Crate2 is on pallet3

    ; Initial crate on pallet relations
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)

    ; Implicitly: No crates are in trucks, and no hoists are lifting crates initially.
  )
  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)