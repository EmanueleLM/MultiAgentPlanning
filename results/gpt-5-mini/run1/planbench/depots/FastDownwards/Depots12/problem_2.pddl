(define (problem depots12)
  (:domain depots-instance)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (crates are also surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations: trucks
    (at truck0 depot1)
    (at truck1 depot0)
    (at truck2 depot1)

    ;; locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; locations: pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; crates initial places (consistent with 'on' facts)
    (at crate0 depot2)
    (at crate1 distributor0)
    (at crate2 distributor0)

    ;; stacking (on)
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 crate1)

    ;; clear predicates (surfaces/ crates with nothing on them)
    (clear crate0)
    (clear crate2)
    (clear pallet0)
    (clear pallet1)
    ;; note: pallet2 and pallet3 are not clear initially (they have crates on them),
    ;; crate1 is not clear (crate2 is on it)

    ;; hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)