(define (problem depots17)
  (:domain depots-hoist-truck)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; supports: pallets, crates, trucks (note: pallet/crate/truck are subtypes of support)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ;; locations of pallets (supports)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; initial positions of trucks (trucks are supports so use same 'at')
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 distributor0)

    ;; initial positions of hoists
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; stacking relations (crates on supports)
    (on crate0 pallet3)
    (on crate1 crate0)
    (on crate2 pallet1)

    ;; hoists available
    (free-hoist hoist0)
    (free-hoist hoist1)
    (free-hoist hoist2)
    (free-hoist hoist3)

    ;; clear status: nothing on top of these supports
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