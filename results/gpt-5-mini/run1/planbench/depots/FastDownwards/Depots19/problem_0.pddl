(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places (depots and distributor treated as places)
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations: hoists
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; trucks initial locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)

    ;; pallets location
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; crate placement (stacking)
    ;; crate0 on pallet0, crate1 on crate0, crate2 on pallet2
    (on-pallet crate0 pallet0)
    (on-crate crate1 crate0)
    (on-pallet crate2 pallet2)

    ;; materialized at-crate facts (crates are at their place implied by supports)
    (at-crate crate0 depot0)
    (at-crate crate1 depot0)
    (at-crate crate2 depot2)

    ;; clear predicates consistent with stacking (capacity-1 model)
    ;; crate1 and crate2 have nothing on top; crate0 is not clear because crate1 is on it
    (clear-crate crate1)
    (clear-crate crate2)
    ;; pallet1 and pallet3 are clear initially; pallet0 and pallet2 are not clear because they support crates
    (clear-pallet pallet1)
    (clear-pallet pallet3)

    ;; hoists are available initially
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
  )

  (:goal (and
    ;; goal: crate0 on crate1, and crate1 on pallet1 (as strict constraints)
    (on-crate crate0 crate1)
    (on-pallet crate1 pallet1)
  ))