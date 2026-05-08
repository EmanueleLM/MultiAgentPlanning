(define (problem move-crates-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places (depots and distributors are subtypes of place)
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (pallet and crate are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; surfaces located at places (pallets)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates initial location and stacking (both at-crate and on are present to keep bookkeeping explicit)
    (at-crate crate0 depot1)
    (at-crate crate1 depot2)
    (at-crate crate2 distributor0)
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet3)

    ;; hoists locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; trucks locations
    (at-truck truck0 distributor0)
    (at-truck truck1 depot2)
    (at-truck truck2 depot0)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear flags: crates are clear; pallet0 is clear (others have crates on them)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
  )

  ;; Goal: crate0 on pallet1, crate1 on pallet2, crate2 on pallet0
  (:goal (and
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet0)
  ))
)