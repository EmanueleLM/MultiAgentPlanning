(define (problem depots17-instance)
  (:domain depots-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets and crates (crates are also surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; hoist locations and availability
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; truck locations
    (at-truck truck0 distributor0)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)

    ;; pallet locations
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; crate initial locations (also reflect stacking via 'on')
    (at-crate crate0 distributor0)
    (at-crate crate1 distributor0)
    (at-crate crate2 depot1)

    ;; stacking relations (crate1 on crate0; crate0 on pallet3; crate2 on pallet1)
    (on crate1 crate0)
    (on crate0 pallet3)
    (on crate2 pallet1)

    ;; clear/top-status: surfaces with nothing on top
    ;; Given initial: crate1 and crate2 are clear; pallet0 and pallet2 clear.
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)

    ;; implicit negatives (not listed): pallet1 and pallet3 and crate0 are not clear
    ;; (they have something on top in init: pallet3 has crate0; crate0 has crate1; pallet1 has crate2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)
  ))
)