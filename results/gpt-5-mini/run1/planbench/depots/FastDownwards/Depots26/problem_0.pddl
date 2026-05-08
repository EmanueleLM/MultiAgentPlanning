(define (problem transport-crates-instance)
  (:domain hoist-operations-conservative)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 - place

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; pallets and crates (pallet and crate are subtypes of surface)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; locations of crates (crates are surfaces as well, and also have an 'at' location)
    (at crate0 depot0)
    (at crate1 depot1)
    (at crate2 distributor0)

    ;; crates initially on pallets
    (on crate0 pallet0)
    (on crate1 pallet1)
    (on crate2 pallet3)

    ;; crate tops clear (no crate stacked on them initially)
    (crate_clear crate0)
    (crate_clear crate1)
    (crate_clear crate2)

    ;; surfaces' locations (pallets)
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ;; pallet2 is clear (no crate on it); pallet0,1,3 are occupied so no surface_clear facts for them
    (surface_clear pallet2)

    ;; mark which surfaces are crates (discriminator predicate)
    (surface_is_crate crate0)
    (surface_is_crate crate1)
    (surface_is_crate crate2)

    ;; locations of hoists
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    ;; hoists are initially available
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)

    ;; locations of trucks
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot0)

    ;; trucks are initially available (resource token)
    (truck_available truck0)
    (truck_available truck1)
    (truck_available truck2)
  )

  (:goal (and
    (on crate0 pallet2)
    (on crate1 pallet3)
    (on crate2 pallet1)
  ))
)