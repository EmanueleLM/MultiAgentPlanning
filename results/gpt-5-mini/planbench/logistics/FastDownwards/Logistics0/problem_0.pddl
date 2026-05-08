(define (problem logistics-problem)
  (:domain logistics)

  ;; NOTE (ambiguity and minimal explicit assumptions):
  ;; The public information did not provide explicit initial locations, vehicles, or connectivity.
  ;; Minimal assumptions made to produce a solvable instance (stated as hard assumptions here):
  ;;  - package_0 initially at location_1_0.
  ;;  - truck_0 initially at location_1_0 (so it can carry package_0).
  ;;  - There is a direct road between location_1_0 and location_0_0 (both directions).
  ;; These are minimal and explicit; no other vehicles, links, or resources are assumed.

  (:objects
    truck_0 - truck
    package_0 - package
    location_0_0 location_1_0 - location
    city_0 city_1 - city
  )

  (:init
    ;; initial positions (assumed as above)
    (at package_0 location_1_0)
    (at truck_0 location_1_0)

    ;; location -> city membership (minimal, non-constraining, provided for completeness)
    (in-city location_0_0 city_0)
    (in-city location_1_0 city_1)

    ;; connectivity (minimal assumption required to move package_0 to goal)
    (road location_1_0 location_0_0)
    (road location_0_0 location_1_0)

    ;; No airplanes or airlinks are declared to avoid inventing additional connectivity.
  )

  ;; Global goal required by the specification:
  ;; package_0 must be at location_0_0.
  (:goal
    (and
      (at package_0 location_0_0)
    )
  )
)