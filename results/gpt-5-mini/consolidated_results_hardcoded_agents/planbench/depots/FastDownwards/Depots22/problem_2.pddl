(define (problem depots22-problem)
  (:domain hoist-truck-warehouse)
  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; physical objects (pallets and crates) all as 'object' typed items
    pallet0 pallet1 pallet2 pallet3
    crate0 crate1 crate2
      - object

    ;; discrete stages for explicit ordering (s0 -> s1 -> ... -> s20)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - stage
  )

  (:init
    ;; Mark which objects are crates and which are pallets and supports
    (is-pallet pallet0)
    (is-pallet pallet1)
    (is-pallet pallet2)
    (is-pallet pallet3)

    (is-crate crate0)
    (is-crate crate1)
    (is-crate crate2)

    ;; Both pallets and crates are usable supports (allow stacking on pallets or crates)
    (is-support pallet0)
    (is-support pallet1)
    (is-support pallet2)
    (is-support pallet3)
    (is-support crate0)
    (is-support crate1)
    (is-support crate2)

    ;; Locations of pallets
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; Initial crate placements (each crate is on its pallet and at the same place)
    (on crate0 pallet1)
    (at crate0 depot1)

    (on crate1 pallet2)
    (at crate1 depot2)

    (on crate2 pallet3)
    (at crate2 distributor0)

    ;; clear top-surface facts (crate tops are clear; pallet0 is clear; pallets holding crates are not clear)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)

    ;; Hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)

    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)

    ;; Truck locations
    (truck-at truck0 distributor0)
    (truck-at truck1 depot1)
    (truck-at truck2 depot1)

    ;; Stage initialization: start at s0 and chain next relations to enforce stage progression
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5)
    (stage s6) (stage s7) (stage s8) (stage s9) (stage s10) (stage s11)
    (stage s12) (stage s13) (stage s14) (stage s15) (stage s16) (stage s17)
    (stage s18) (stage s19) (stage s20)

    (current s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
  )

  (:goal (and
    ;; goal: crate0 stacked on crate1, and crate1 stacked on pallet0
    (on crate0 crate1)
    (on crate1 pallet0)
  ))