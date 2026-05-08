(define (problem depots29-instance)
  (:domain depots-hoist)
  (:objects
    ;; places: depots and distributor
    depot0 depot1 depot2 distributor0

    ;; trucks
    truck0 truck1 truck2

    ;; hoists
    hoist0 hoist1 hoist2 hoist3

    ;; pallets
    pallet0 pallet1 pallet2 pallet3

    ;; crates
    crate0 crate1 crate2
  )

  (:init
    ;; Locations: trucks
    (truck-at truck0 depot0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot2)

    ;; Locations: hoists
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    ;; Surfaces (pallets) at places
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; Crates initial placement: crates are surfaces too (stacking)
    (on crate0 pallet3)
    (at crate0 distributor0)
    (surface-at crate0 distributor0)

    (on crate1 pallet0)
    (at crate1 depot0)
    (surface-at crate1 depot0)

    (on crate2 crate1)
    (at crate2 depot0)
    (surface-at crate2 depot0)

    ;; Hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; Clear facts (surfaces that have nothing on top)
    (clear crate0)    ;; nothing on top of crate0
    (clear crate2)    ;; nothing on top of crate2
    (clear pallet1)
    (clear pallet2)
    ;; Note: pallet0, pallet3 and crate1 are not listed as clear because they have crates on top.
  )

  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
)