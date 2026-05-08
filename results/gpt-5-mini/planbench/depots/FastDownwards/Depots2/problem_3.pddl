(define (problem depots2-instance)
  (:domain depots)
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets and crates (pallets and crates are surfaces)
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate

    ;; hoists and trucks
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )

  (:init
    ;; hoist locations and availability
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ;; truck locations
    (at_truck truck0 depot2)
    (at_truck truck1 depot0)
    (at_truck truck2 depot2)

    ;; static surface locations (pallets)
    (surface_at pallet0 depot0)
    (surface_at pallet1 depot1)
    (surface_at pallet2 depot2)
    (surface_at pallet3 distributor0)

    ;; crates initial placement:
    ;; crate0 on pallet2 at depot2; crate2 on crate0 at depot2; crate1 on pallet0 at depot0
    (on crate0 pallet2)
    (surface_at crate0 depot2)

    (on crate2 crate0)
    (surface_at crate2 depot2)

    (on crate1 pallet0)
    (surface_at crate1 depot0)

    ;; clear surfaces (nothing on top)
    ;; crate1 and crate2 have nothing on top; pallet1 and pallet3 empty on top
    (clear crate1)
    (clear crate2)
    (clear pallet1)
    (clear pallet3)
  )

  (:goal (and
    (on crate1 pallet0)
    (on crate2 pallet3)
  ))
)