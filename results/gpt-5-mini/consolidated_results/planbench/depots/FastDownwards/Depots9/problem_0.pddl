(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    ; places
    depot0 depot1 depot2 distributor0 - place

    ; hoists and trucks (hoists/trucks are subtypes of object)
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2           - truck

    ; surfaces: pallets and crates (crate is a subtype of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2            - crate
  )

  (:init
    ; --- locations: hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ; --- locations: pallets (surfaces)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ; --- locations: trucks
    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    ; --- crate placements: crates are on pallets (user-provided)
    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet3)

    ; The user also stated crates are at the corresponding places (explicit in spec).
    ; Keep these explicit (the actions explicitly delete both when moving crates).
    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 distributor0)

    ; --- hoist availabilities (all available initially)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; --- clear predicates: crates are top-clear; pallet0 is clear, others are not (because they have a crate)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)
    ; Note: pallet1, pallet2, pallet3 are occupied (no (clear ...) fact asserted)

    ; --- per-crate handling tokens (allow single handler start at a time per crate)
    (free-to-handle crate0)
    (free-to-handle crate1)
    (free-to-handle crate2)

    ; No crates are in trucks, no hoist is lifting anything at start (these atoms simply are absent)
  )

  (:goal (and
           (on crate0 pallet1)
           (on crate1 pallet2)
           (on crate2 pallet0)
         ))
)