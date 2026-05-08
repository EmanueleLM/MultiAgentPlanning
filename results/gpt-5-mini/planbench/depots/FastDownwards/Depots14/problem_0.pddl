(define (problem move-crates-problem)
  (:domain hoist-truck-domain)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; pallets and crates (crates and pallets are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; trucks locations
    (at-truck truck0 distributor0)
    (at-truck truck1 depot0)
    (at-truck truck2 depot0)

    ;; hoists locations and availability
    (at-hoist hoist0 depot0)
    (hoist-available hoist0)
    (at-hoist hoist1 depot1)
    (hoist-available hoist1)
    (at-hoist hoist2 depot2)
    (hoist-available hoist2)
    (at-hoist hoist3 distributor0)
    (hoist-available hoist3)

    ;; pallets positions (surface facts)
    (at-surface pallet0 depot0)
    (clear pallet0)
    (at-surface pallet1 depot1)
    (clear pallet1)
    (at-surface pallet2 depot2)
    ;; pallet2 initially not clear because crate0 sits on it (do NOT assert (clear pallet2))
    (at-surface pallet3 distributor0)
    ;; pallet3 initially not clear because crate1 sits on it (do NOT assert (clear pallet3))

    ;; crates positions and stacking (crate surfaces also have at-surface facts)
    (at-surface crate0 depot2)
    (on crate0 pallet2)
    (clear crate0)

    (at-surface crate1 distributor0)
    (on crate1 pallet3)
    ;; crate1 is not clear initially because crate2 is on top of it (do NOT assert (clear crate1))

    (at-surface crate2 distributor0)
    (on crate2 crate1)
    (clear crate2)

    ;; resource locks: none in use initially
    ;; (truck-in-use ...) and (hoist-in-use ...) are false by omission

    ;; Sequencing flag is false by omission (seq-a-done not true initially)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet1)
  ))
)