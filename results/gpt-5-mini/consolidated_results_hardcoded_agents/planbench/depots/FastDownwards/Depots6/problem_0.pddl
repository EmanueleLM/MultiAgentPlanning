(define (problem deliver-crate)
  (:domain transport-hoist-drivers)
  (:objects
    alice - driver
    truck1 - vehicle
    hoist-depot hoist-site - hoist
    crateA - load
    depot-platform siteA-platform depot-ground siteA-ground - location
  )

  (:init
    ;; initial positions
    (at-driver alice depot-platform)
    (at-vehicle truck1 depot-platform)
    (at-hoist hoist-depot depot-platform)
    (at-hoist hoist-site siteA-platform)
    (at-load crateA depot-platform)

    ;; availability markers
    (driver-free alice)
    (vehicle-free truck1)
    (hoist-free hoist-depot)
    (hoist-free hoist-site)
  )

  ;; Goal: crateA must end up on the siteA platform; driver and vehicle present at that location
  (:goal
    (and
      (at-load crateA siteA-platform)
      (at-vehicle truck1 siteA-platform)
      (at-driver alice siteA-platform)
      (at-hoist hoist-depot depot-platform)
      (at-hoist hoist-site siteA-platform)
    )
  )
)