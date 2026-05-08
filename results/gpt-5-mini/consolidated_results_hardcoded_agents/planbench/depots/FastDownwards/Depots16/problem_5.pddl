(define (problem move_crates_problem)
  (:domain hoist_truck_domain)

  (:objects
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    crate0 crate1 crate2 - crate
    pallet0 pallet1 pallet2 pallet3 - pallet

    depot0 depot1 depot2 distributor0 - place

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - stage
  )

  (:init
    ;; connectivity (roads fully connect all depots and distributors) -- both directions
    (connected depot0 depot1) (connected depot1 depot0)
    (connected depot0 depot2) (connected depot2 depot0)
    (connected depot0 distributor0) (connected distributor0 depot0)
    (connected depot1 depot2) (connected depot2 depot1)
    (connected depot1 distributor0) (connected distributor0 depot1)
    (connected depot2 distributor0) (connected distributor0 depot2)

    ;; trucks at places
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ;; hoists at places (hoists are stationary in this model)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; pallets and crates located at places (and stack relations)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at crate0 depot0)
    (on crate0 pallet0)

    (at crate1 depot2)
    (on crate1 pallet2)

    (at crate2 depot0)
    (on crate2 crate0)

    ;; hoist availability
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; clear facts as specified (applies to surfaces)
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)

    ;; stage succession chain (explicit ordering s0 -> s1 -> ... -> s16)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16)

    ;; start at initial stage
    (at-stage s0)
  )

  (:goal (and
    ;; require final stackings at terminal stage s16
    (on crate0 crate1)
    (on crate1 pallet0)
    (on crate2 pallet2)
    (at-stage s16)
  ))
)