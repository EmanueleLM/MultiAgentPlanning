(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; Connectivity: roads connect every distinct pair of places (symmetric)
    (connected depot0 depot1)
    (connected depot1 depot0)
    (connected depot0 depot2)
    (connected depot2 depot0)
    (connected depot0 distributor0)
    (connected distributor0 depot0)
    (connected depot1 depot2)
    (connected depot2 depot1)
    (connected depot1 distributor0)
    (connected distributor0 depot1)
    (connected depot2 distributor0)
    (connected distributor0 depot2)

    ;; Initial locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; Initial locations: trucks
    (at truck0 depot0)
    (at truck1 depot2)
    (at truck2 distributor0)

    ;; Initial locations: pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Initial locations: crates (note: crates on surfaces imply same-place invariants)
    (at crate0 depot0)
    (at crate1 depot0)
    (at crate2 depot2)

    ;; Stacking relationships (on)
    (on crate0 pallet0)
    (on crate1 crate0)
    (on crate2 pallet2)

    ;; Hoists initially available
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear facts: topmost surfaces/crates
    ;; crate1 has nothing on top of it (it is topmost in current stack)
    (clear crate1)
    ;; crate2 is topmost on pallet2
    (clear crate2)
    ;; pallet1 currently empty at depot1
    (clear pallet1)
    ;; pallet3 currently empty at distributor0
    (clear pallet3)

    ;; Implicitly: pallet0 and pallet2 are not clear because they have crates on them;
    ;; crate0 is not clear because crate1 is on it. These are left absent rather than asserted.
  )

  (:goal (and
    (on crate0 crate1)
    (on crate1 pallet1)
  ))
)