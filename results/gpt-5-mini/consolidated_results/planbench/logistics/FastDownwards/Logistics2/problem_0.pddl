; Problem preface / modeling choices (hard constraints encoded above):
;  - Packages package_0 and package_1 start at location_1_0 (city_1) and must end at location_0_0 (city_0).
;  - Trucks cannot cross cities; trucks are usable only within their assigned city.
;  - Airplane can transport packages between airports in different cities.
;  - Loading/unloading requires co-location and preserves package exclusivity using (unloaded ?p).
;  - Vehicles have unlimited capacity (explicit choice due to no capacity info).
;  - Actions are instantaneous; model targets sequential planning (FastDownwards).
(define (problem deliver_packages)
  (:domain logistics_integrated)

  (:objects
    city_0 city_1 - city

    location_0_0 location_1_0 - location

    truck_0 truck_1 - truck
    airplane_0 - airplane

    package_0 package_1 - package
  )

  (:init
    ;; Airports
    (is_airport location_0_0)
    (is_airport location_1_0)

    ;; Location-city membership
    (location_in_city location_0_0 city_0)
    (location_in_city location_1_0 city_1)

    ;; Initial positions of vehicles and packages
    (at airplane_0 location_1_0)
    (at truck_0 location_0_0)
    (at truck_1 location_1_0)

    (at package_0 location_1_0)
    (at package_1 location_1_0)

    ;; Trucks static assignment to their cities (one truck per city, satisfied here)
    (truck_belongs_to_city truck_0 city_0)
    (truck_belongs_to_city truck_1 city_1)

    ;; Package exclusivity helper fluent: packages are initially unloaded (at locations)
    (unloaded package_0)
    (unloaded package_1)
  )

  (:goal (and
    (at package_0 location_0_0)
    (at package_1 location_0_0)
  ))
)