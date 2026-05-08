(define (problem move_crates_problem)
  (:domain hoist_truck_domain)

  (:objects
    ;; typed objects
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet

    depot0 depot1 depot2 distributor0 - place
  )

  (:init
    ;; connectivity (roads fully connect all depots and distributors) -- include both directions
    (connected depot0 depot1) (connected depot1 depot0)
    (connected depot0 depot2) (connected depot2 depot0)
    (connected depot0 distributor0) (connected distributor0 depot0)
    (connected depot1 depot2) (connected depot2 depot1)
    (connected depot1 distributor0) (connected distributor0 depot1)
    (connected depot2 distributor0) (connected distributor0 depot2)

    ;; initial locations: trucks
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; initial locations: hoists (hoists are not mobile by drive action)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; initial locations: pallets and crates (we include at facts so hoist preconditions that require at(X,P) hold)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (on crate0 pallet0)
    (at crate0 depot0)

    (on crate1 pallet2)
    (at crate1 depot2)

    (on crate2 crate0)
    (at crate2 depot0)

    ;; declare which objects are valid surfaces (only crates and pallets)
    (is_surface pallet0) (is_surface pallet1) (is_surface pallet2) (is_surface pallet3)
    (is_surface crate0) (is_surface crate1) (is_surface crate2)

    ;; initial hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; initial clear facts (only top-most objects or empty pallets declared clear)
    ;; From the specification: crate1 is clear, crate2 is clear, pallet1 is clear, pallet3 is clear.
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
    ;; Note: pallet0 is not clear (crate0 is on it); pallet2 is not clear (crate1 is on it); crate0 is not clear (crate2 on it)

    ;; no crates are in trucks at start
    ;; (no explicit negations needed; absence of (in ...) suffices)
  )

  (:goal (and
    ;; final required stackings
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
  ))
)