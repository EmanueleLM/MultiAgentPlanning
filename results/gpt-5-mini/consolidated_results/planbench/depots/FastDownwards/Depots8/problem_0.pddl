(define (problem load-and-deliver)
  (:domain depot-distributor)

  ;; Short comment on conservative modeling choices:
  ;; - Two explicit locations: depot and distributor.
  ;; - Two surfaces: surface0 at depot (initial crate locations) and surface1 at distributor (where pallets are).
  ;; - Only one truck (truck0) and one hoist (hoist0) exist as specified.
  ;; - The driver (actions prefixed driver-) can only drive the truck.
  ;; - The hoist operator (actions prefixed hoist-) performs all crate transfers.
  ;; - Pallets can accept only one crate (enforced by pallet_free predicate).
  ;; These choices conservatively reflect the provided descriptions without adding extra resources.

  (:objects
    depot distributor - location
    truck0 - truck
    hoist0 - hoist
    surface0 surface1 - surface
    pallet0 pallet1 - pallet
    crate0 crate2 - crate
  )

  (:init
    ;; Locations of surfaces and pallets
    (surface_at surface0 depot)
    (surface_at surface1 distributor)
    (pallet_at pallet0 distributor)
    (pallet_at pallet1 distributor)

    ;; Initial crate locations: both crates start on surface0 at depot
    (crate_on_surface crate0 surface0)
    (crate_on_surface crate2 surface0)

    ;; Resources free/available
    (pallet_free pallet0)
    (pallet_free pallet1)
    (hoist_free hoist0)

    ;; Initial vehicle/hoist locations
    (truck_at truck0 depot)
    (hoist_at hoist0 depot)
  )

  ;; Goal: crate0 on pallet0 and crate2 on pallet1 (explicit final placement)
  (:goal (and
    (on_pallet crate0 pallet0)
    (on_pallet crate2 pallet1)
  ))
)