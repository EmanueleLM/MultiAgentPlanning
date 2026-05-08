(define (problem depots17-instance)
  (:domain depots-hoist-truck)

  (:objects
    depot0 depot1 depot2 distributor0
    pallet0 pallet1 pallet2 pallet3
    crate0 crate1 crate2
    hoist0 hoist1 hoist2 hoist3
    truck0 truck1 truck2
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

    ;; crate locations (also stacking via 'on')
    (at-crate crate0 distributor0)
    (at-crate crate1 distributor0)
    (at-crate crate2 depot1)

    ;; stacking relations
    (on crate1 crate0)
    (on crate0 pallet3)
    (on crate2 pallet1)

    ;; clear/top-status (explicitly given)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet3)
  ))
)