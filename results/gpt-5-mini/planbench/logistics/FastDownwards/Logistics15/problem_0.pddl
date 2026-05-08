(define (problem logistics-instance-1)
  (:domain logistics)

  (:objects
    truck1 - truck
    plane1 - plane
    pkg1 - package

    cityA cityB - city

    cA_wh cB_dest - loc
    cA_air cB_air - airport
  )

  (:init
    ;; vehicle and package initial locations
    (at-truck truck1 cA_wh)
    (at-plane plane1 cA_air)
    (at-package pkg1 cA_wh)

    ;; city membership for locations (defines allowed truck/plane movements)
    (in-city cA_wh cityA)
    (in-city cA_air cityA)
    (in-city cB_air cityB)
    (in-city cB_dest cityB)

    ;; package destination (explicit)
    (package-dest pkg1 cB_dest)
  )

  (:goal (and
    ;; Mandated terminal condition: package must be at its destination location.
    (at-package pkg1 cB_dest)
  ))
)