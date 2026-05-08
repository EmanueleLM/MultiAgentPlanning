(define (problem depots4-problem)
  (:domain orchestrated-logistics)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; surfaces: pallets and crates (crates are also surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck

    ;; discrete stages for explicit ordering (enough steps for a feasible plan)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )

  (:init
    ;; stage chain and current stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12)
    (current s0)

    ;; connectivity: complete graph between places (road both directions)
    (road depot0 depot1) (road depot1 depot0)
    (road depot0 depot2) (road depot2 depot0)
    (road depot0 distributor0) (road distributor0 depot0)
    (road depot1 depot2) (road depot2 depot1)
    (road depot1 distributor0) (road distributor0 depot1)
    (road depot2 distributor0) (road distributor0 depot2)

    ;; initial locations of pallets (surfaces)
    (at-surface pallet0 depot0)
    (at-surface pallet1 depot1)
    (at-surface pallet2 depot2)
    (at-surface pallet3 distributor0)

    ;; initial crate positions and stacking (also crate as surface when supporting)
    (at-crate crate0 depot0)
    (on crate0 pallet0)
    (at-surface crate0 depot0)   ;; crate0 sits at depot0 as a surface (it supports crate1)

    (at-crate crate1 depot0)
    (on crate1 crate0)

    (at-crate crate2 depot1)
    (on crate2 pallet1)
    (at-surface crate2 depot1)

    ;; initial clear predicates (only surfaces without something on top are clear)
    ;; crate1 and crate2 are clear (nothing on them)
    (clear crate1)
    (clear crate2)
    ;; pallet2 and pallet3 are clear initially
    (clear pallet2)
    (clear pallet3)
    ;; pallet0 and pallet1 are not clear because they have crates on them; crate0 not clear because crate1 on it

    ;; hoist initial locations and availability
    (at-hoist hoist0 depot0) (hoist-free hoist0)
    (at-hoist hoist1 depot1) (hoist-free hoist1)
    (at-hoist hoist2 depot2) (hoist-free hoist2)
    (at-hoist hoist3 distributor0) (hoist-free hoist3)

    ;; truck initial locations
    (at-truck truck0 depot2)
    (at-truck truck1 depot1)
    (at-truck truck2 depot2)
  )

  ;; Goal: exact final placements required by the specification
  (:goal (and
           (on crate0 pallet1)
           (on crate1 crate0)
           (on crate2 pallet0)
         ))
)