(define (problem logistics-instance-1)
  (:domain logistics-multiagent)

  (:objects
    truck0 truck1 - truck
    plane0 - airplane
    pkg0 pkg1 - package
    loc0_airport loc0_wh loc1_airport loc1_wh - location
    city0 city1 - city
  )

  (:init
    ;; type assertions (explicit)
    (truck truck0)
    (truck truck1)
    (airplane plane0)
    (package pkg0)
    (package pkg1)
    (location loc0_airport)
    (location loc0_wh)
    (location loc1_airport)
    (location loc1_wh)
    (city city0)
    (city city1)

    ;; city membership
    (in-city loc0_airport city0)
    (in-city loc0_wh city0)
    (in-city loc1_airport city1)
    (in-city loc1_wh city1)

    ;; airports (exactly these are airports)
    (is-airport loc0_airport)
    (is-airport loc1_airport)

    ;; same-city facts (only for distinct locations within the same city)
    (same-city loc0_airport loc0_wh)
    (same-city loc0_wh loc0_airport)
    (same-city loc1_airport loc1_wh)
    (same-city loc1_wh loc1_airport)

    ;; different facts (for all unequal pairs of locations)
    (different loc0_airport loc0_wh)
    (different loc0_airport loc1_airport)
    (different loc0_airport loc1_wh)
    (different loc0_wh loc0_airport)
    (different loc0_wh loc1_airport)
    (different loc0_wh loc1_wh)
    (different loc1_airport loc0_airport)
    (different loc1_airport loc0_wh)
    (different loc1_airport loc1_wh)
    (different loc1_wh loc0_airport)
    (different loc1_wh loc0_wh)
    (different loc1_wh loc1_airport)

    ;; initial vehicle and package locations
    (at-truck truck0 loc0_wh)    ;; truck0 in city0 at warehouse
    (at-truck truck1 loc1_wh)    ;; truck1 in city1 at warehouse
    (at-airplane plane0 loc0_airport) ;; airplane in city0 at its airport

    (at-package pkg0 loc0_wh)    ;; package pkg0 at city0 warehouse (needs intercity delivery)
    (at-package pkg1 loc0_airport) ;; package pkg1 at city0 airport (can be flown directly)

    ;; Note: no in-truck or inside-plane facts initially (packages are not inside any vehicle)
  )

  (:goal (and
    ;; Terminal conditions: both packages delivered to the city1 warehouse
    (at-package pkg0 loc1_wh)
    (at-package pkg1 loc1_wh)
  ))
)