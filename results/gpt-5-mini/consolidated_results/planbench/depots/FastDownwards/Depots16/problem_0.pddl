(define (problem move_crates_problem)
  (:domain hoist_truck_domain)

  (:objects
    ;; movable objects (trucks, hoists, crates, pallets) are all declared as obj
    truck0 truck1 truck2
    hoist0 hoist1 hoist2 hoist3
    crate0 crate1 crate2
    pallet0 pallet1 pallet2 pallet3
    kind_depot kind_distributor
    - obj

    ;; places
    depot0 depot1 depot2 distributor0
    - place
  )

  (:init
    ;; place types
    (place_type depot0 kind_depot)
    (place_type depot1 kind_depot)
    (place_type depot2 kind_depot)
    (place_type distributor0 kind_distributor)

    ;; connectivity: complete connectivity among the listed depots/distributors
    ;; include both directions explicitly
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

    ;; initial locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; initial locations: pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; initial crate placements (also include at-place facts so hoist preconditions that require at(C,P) hold)
    (on crate0 pallet0)
    (at crate0 depot0)

    (on crate1 pallet2)
    (at crate1 depot2)

    (on crate2 crate0)
    (at crate2 depot0)

    ;; initial hoist availability
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; initial clear facts (explicitly stated in public info)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; Note: surfaces that have a crate on top are not listed as clear (e.g., pallet0 and pallet2 are not clear initially; crate0 is not clear because crate2 is on it)
  )

  (:goal (and
    ;; final required stackings
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
  ))
)