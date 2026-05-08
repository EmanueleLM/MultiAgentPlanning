(define (problem depots0)
  (:domain multiagent_hoist_driver)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations of pallets
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; hoist locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; trucks locations
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 distributor0)

    ;; hoists available
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; stacking: crate0 on pallet1 at depot1; crate1 on crate0 at depot1; crate2 on pallet0 at depot0
    (on-pallet crate0 pallet1)
    (at-crate crate0 depot1)

    (on-crate crate1 crate0)
    (at-crate crate1 depot1)

    (on-pallet crate2 pallet0)
    (at-crate crate2 depot0)

    ;; clear-ness
    (clear-crate crate1)
    (clear-crate crate2)
    (clear-pallet pallet2)
    (clear-pallet pallet3)

    ;; note: pallet1 not clear (crate0 on it), pallet0 not clear (crate2 on it), crate0 not clear (crate1 on it)
  )

  (:goal (and
           (on-pallet crate1 pallet1)
           (on-pallet crate2 pallet3)
         ))
)