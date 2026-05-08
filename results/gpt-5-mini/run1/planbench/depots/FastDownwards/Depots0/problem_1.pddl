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
    ;; locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at truck0 depot1)
    (at truck1 depot1)
    (at truck2 distributor0)

    ;; hoists available
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; stacking: crate0 on pallet1 at depot1; crate1 on crate0 at depot1; crate2 on pallet0 at depot0
    (on crate0 pallet1)
    (at crate0 depot1)

    (on crate1 crate0)
    (at crate1 depot1)

    (on crate2 pallet0)
    (at crate2 depot0)

    ;; clear-ness: crate1 and crate2 are clear; pallet2 and pallet3 are empty/clear
    (clear crate1)
    (clear crate2)
    (clear pallet2)
    (clear pallet3)

    ;; surfaces that have something on them are not clear (implicit by missing clear)
    ;; pallet1 has crate0 -> not clear
    ;; pallet0 has crate2 -> not clear
    ;; crate0 has crate1 on top -> crate0 not clear
  )

  (:goal (and
           (on crate1 pallet1)
           (on crate2 pallet3)
         ))
)