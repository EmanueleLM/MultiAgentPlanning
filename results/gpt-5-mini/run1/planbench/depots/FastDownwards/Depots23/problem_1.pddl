(define (problem depots23)
  (:domain depots-hoist)

  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; surfaces: pallets and crates (crates are surfaces too so stacking is possible)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; initial positions: trucks
    (at-truck truck0 distributor0)
    (at-truck truck1 depot1)
    (at-truck truck2 distributor0)

    ;; initial positions: hoists
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; pallets located at places
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; crates located and stacked (explicit both at-surface and on facts as given)
    (at-surface crate0 depot0)
    (on crate0 pallet0)

    (at-surface crate1 depot0)
    (on crate1 crate0)

    (at-surface crate2 distributor0)
    (on crate2 pallet3)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; clear facts (explicit as given)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet2)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 crate0)
    (on crate2 pallet0)
  ))
)