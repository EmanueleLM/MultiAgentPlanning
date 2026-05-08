(define (problem crate-hoist-problem)
  (:domain crate-hoist-orchestration)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; surfaces: pallets and crates (crate/pallet are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; discrete stages to enforce action ordering (s0 -> s1 -> ... -> s15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; trucks initial locations
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 depot0)

    ;; hoist locations and availability
    (hoist-at hoist0 depot0)
    (hoist-at hoist1 depot1)
    (hoist-at hoist2 depot2)
    (hoist-at hoist3 distributor0)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; surfaces located at places (pallets)
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ;; crates initial stacking and locations (crate is also a surface)
    (on crate0 pallet3)
    (surface-at crate0 distributor0)

    (on crate1 crate0)
    (surface-at crate1 distributor0)

    (on crate2 pallet1)
    (surface-at crate2 depot1)

    ;; clear flags for surfaces that have nothing on them
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    (clear pallet2)

    ;; explicit stage progression facts
    (current-stage s0)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (succ s10 s11)
    (succ s11 s12)
    (succ s12 s13)
    (succ s13 s14)
    (succ s14 s15)
  )

  ;; Goal: final stacking arrangement required by the specification
  (:goal (and
    (on crate2 pallet0)
    (on crate0 crate2)
    (on crate1 crate0)
  ))
)