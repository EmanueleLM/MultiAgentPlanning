(define (problem transport-problem-0)
  (:domain transport-domain)

  ;; Ambiguity note:
  ;; The public information did not give initial positions for vehicles or the package,
  ;; nor the connectivity between locations. Minimal explicit assumptions made:
  ;;  - There are two locations: location_0_1 (initial package pos) and location_0_0 (goal).
  ;;  - One truck (truck_0) is available at location_0_1 and can drive directly to location_0_0.
  ;;  - Roads are bidirectional and explicitly asserted.
  ;; These assumptions are the minimal ones needed to achieve the stated global goal.
  ;; If different initial facts or connectivity were intended, provide them and regenerate the files.
  ;

  (:objects
    truck_0 - truck
    airplane_0 - airplane
    package_0 - package
    location_0_0 location_0_1 - location
    city_0 - city
  )

  (:init
    ;; initial placements (assumption: package and truck start together at location_0_1)
    (at package_0 location_0_1)
    (at truck_0 location_0_1)

    ;; airplane present but unused (placed somewhere; not required)
    (at airplane_0 location_0_0)

    ;; connectivity (assumed direct drivable road between the two locations)
    (road location_0_1 location_0_0)
    (road location_0_0 location_0_1)

    ;; For completeness, declare an air route as well (not required for the solution)
    (air-route location_0_0 location_0_1)
    (air-route location_0_1 location_0_0)

    ;; location-city mapping (optional grouping)
    (in-city location_0_0 city_0)
    (in-city location_0_1 city_0)
  )

  ;; Global goal: package_0 must be at location_0_0
  (:goal (and
           (at package_0 location_0_0)
         )
  )
)