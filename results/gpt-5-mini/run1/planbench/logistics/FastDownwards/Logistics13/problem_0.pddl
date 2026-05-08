(define (problem deliver-all-packages-location_0_1)
  (:domain multiagent-transport)
  (:objects
    ;; packages
    package_0 package_1 package_2 - package

    ;; trucks and airplanes
    truck_0 - truck
    plane_0 - airplane

    ;; locations (include an airport location as airport subtype)
    location_0_0 location_0_1 location_1_0 - location
    airport_0_0 - airport
  )

  (:init
    ;; Mark airport
    (is-airport airport_0_0)

    ;; Vehicle initial positions
    (truck-at truck_0 location_0_0)
    (plane-at plane_0 airport_0_0)

    ;; Package initial positions (packages start distributed across locations)
    (at-package package_0 location_0_0)
    (at-package package_1 location_1_0)
    (at-package package_2 airport_0_0)

    ;; Road connectivity (symmetric links explicitly listed)
    (road-connected location_0_0 location_0_1)
    (road-connected location_0_1 location_0_0)
    (road-connected location_1_0 location_0_1)
    (road-connected location_0_1 location_1_0)
    (road-connected location_1_0 location_0_0)
    (road-connected location_0_0 location_1_0)

    ;; Air connectivity between airports
    (air-connected airport_0_0 airport_0_0) ;; self-loop allowed, but useful if plane starts and goal at same airport
    ;; (No other airports exist; include only provided connectivity.)

    ;; Auditor-enforced integrity facts (explicit constraints encoded as invariants through preconditions and goal)
    ;; - Packages cannot be simultaneously in-truck and in-plane (this is enforced by load preconditions).
    ;; - Plane may only load/unload at airports (enforced by preconditions requiring is-airport).
    ;; - Truck may move only along road-connected links (enforced by preconditions).
  )

  (:goal
    (and
      ;; All packages must be physically at location_0_1 at the end
      (at-package package_0 location_0_1)
      (at-package package_1 location_0_1)
      (at-package package_2 location_0_1)

      ;; Auditor explicit terminal constraints: no package may remain loaded in any vehicle
      (not (in-truck package_0 truck_0))
      (not (in-truck package_1 truck_0))
      (not (in-truck package_2 truck_0))

      (not (in-plane package_0 plane_0))
      (not (in-plane package_1 plane_0))
      (not (in-plane package_2 plane_0))
    )
  )
)