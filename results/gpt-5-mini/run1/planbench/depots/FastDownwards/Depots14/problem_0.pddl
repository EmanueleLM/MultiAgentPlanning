(define (problem move-crates-problem)
  (:domain hoist-truck-domain)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3
    crate0 crate1 crate2
    - surface
  )

  (:init
    ;; classify surfaces
    (pallet pallet0)
    (pallet pallet1)
    (pallet pallet2)
    (pallet pallet3)
    (crate crate0)
    (crate crate1)
    (crate crate2)

    ;; hoists and availability
    (at-hoist hoist0 depot0)
    (available hoist0)
    (at-hoist hoist1 depot1)
    (available hoist1)
    (at-hoist hoist2 depot2)
    (available hoist2)
    (at-hoist hoist3 distributor0)
    (available hoist3)

    ;; pallets: locations and (consistent) clear flags
    (at-surface pallet0 depot0)
    (clear pallet0)

    (at-surface pallet1 depot1)
    (clear pallet1)

    (at-surface pallet2 depot2)
    ;; NOTE: pallet2 is NOT marked clear initially because crate0 sits on it
    ;; (clear pallet2)  ;; intentionally omitted to enforce correct ordering

    (at-surface pallet3 distributor0)
    (clear pallet3)

    ;; crates: locations, stacking, and clear flags
    (at-surface crate0 depot2)
    (on crate0 pallet2)
    (clear crate0)

    (at-surface crate1 distributor0)
    (on crate1 pallet3)
    ;; crate1 is NOT clear initially because crate2 is on crate1

    (at-surface crate2 distributor0)
    (on crate2 crate1)
    (clear crate2)

    ;; trucks positions
    (at-truck truck0 distributor0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot0)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet1)
  ))
)