(define (problem move_crates_problem)
  (:domain hoist_truck_domain)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    truck0 truck1 truck2 - truck

    hoist0 hoist1 hoist2 hoist3 - hoist

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks initial locations
    (at-truck truck0 distributor0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot0)

    ;; hoists initial locations & availability
    (at-hoist hoist0 depot0)
    (available hoist0)
    (at-hoist hoist1 depot1)
    (available hoist1)
    (at-hoist hoist2 depot2)
    (available hoist2)
    (at-hoist hoist3 distributor0)
    (available hoist3)

    ;; pallets at places
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; crates initial positions (and stacking)
    (at-crate crate0 depot2)
    (on-crate-pallet crate0 pallet2)
    (clear-crate crate0)

    (at-crate crate1 distributor0)
    (on-crate-pallet crate1 pallet3)
    ;; crate1 is NOT clear initially because crate2 is on it

    (at-crate crate2 distributor0)
    (on-crate-crate crate2 crate1)
    (clear-crate crate2)

    ;; clear flags (explicit; surfaces that are not clear are NOT listed)
    (clear-pallet pallet0)
    (clear-pallet pallet1)
    ;; pallet2 and pallet3 are not clear initially (they host crates)

    ;; no crate is inside any truck initially (no (in ...) facts)
  )

  (:goal
    (and
      ;; final required stackings (also implies crate locations at the pallets' places)
      (on-crate-pallet crate0 pallet0)
      (on-crate-pallet crate1 pallet2)
      (on-crate-pallet crate2 pallet1)
    )
  )
)