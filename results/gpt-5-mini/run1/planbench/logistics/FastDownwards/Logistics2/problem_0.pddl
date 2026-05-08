; Problem preface / integrator decisions and clarifications (documenting choices made):
; - Sequential (instantaneous) action semantics chosen (no durative actions). Therefore there is no moving(...) fluent.
; - A package is modeled to be exactly in one place at any time by explicit bookkeeping:
;     * (at_pkg P L) indicates package P is physically at location L (and not in any vehicle).
;     * (in P V) indicates package P is inside vehicle V (and not at a location).
;     * (in_any P) is an auxiliary predicate that is false iff the package is at some location; load actions set it, unload clears it.
;   All load/unload actions maintain these invariants so packages cannot be duplicated or vanish.
; - When a vehicle moves (truck-drive or airplane-fly), the (in P V) facts are NOT changed; packages stay 'in' the vehicle.
;   Therefore, to satisfy a goal that requires (at_pkg P L), a package loaded into a vehicle must be explicitly unloaded at the destination location.
; - Flights are allowed only between two airport locations that are in different cities. This is enforced by (is_airport ...) on endpoints and an explicit (different_city ...) fact provided below.
; - Driving a truck is allowed only within the same city. This is enforced by requiring a witness city parameter in truck-drive and checking in_city for both endpoints.
; - No vehicle capacity constraints are modeled (i.e., unlimited capacity). This is an explicit decision because no capacities were provided.
; - The instance respects the invariant "one truck per city" and "each city has exactly one airport" by construction of the objects and initial facts below.
; - Action names are prefixed by agent (truck- / airplane-) to keep contributions distinct.

(define (problem logistics_instance)
  (:domain logistics_multiagent)

  (:objects
    ; cities
    city_0 city_1 - city

    ; locations (airports are typed as airport which is a subtype of location)
    location_0_0 location_1_0 - airport

    ; vehicles
    truck_0 truck_1 - truck
    airplane_0 - airplane

    ; packages
    package_0 package_1 - package
  )

  (:init
    ; location-city membership
    (in_city location_0_0 city_0)
    (in_city location_1_0 city_1)

    ; airport type (already typed in objects as airports; keep explicit predicate as the model expects)
    (is_airport location_0_0)
    (is_airport location_1_0)

    ; vehicle locations
    (at_veh airplane_0 location_1_0)
    (at_veh truck_0 location_0_0)
    (at_veh truck_1 location_1_0)

    ; package initial placements (packages are at location_1_0)
    (at_pkg package_0 location_1_0)
    (at_pkg package_1 location_1_0)

    ; different-city facts (explicitly provided for this instance)
    (different_city location_0_0 location_1_0)
    (different_city location_1_0 location_0_0)

    ; Notes:
    ; - No (in ...) or (in_any ...) facts are true initially: both packages start at a location.
    ; - The invariant "one truck per city" is ensured by the instances: truck_0 at location in city_0; truck_1 at location in city_1.
    ; - The invariant "each city has exactly one airport" is ensured by the two airport locations above.
  )

  (:goal (and
    (at_pkg package_0 location_0_0)
    (at_pkg package_1 location_0_0)
  ))
)