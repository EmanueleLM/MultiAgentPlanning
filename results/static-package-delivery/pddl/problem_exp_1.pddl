(define (problem deliver-to-house)
  (:domain truckdriver)

  ; Objects: one truck, one package, two locations
  (:objects
    truck1 - vehicle
    package1 - item
    post-office house - location
  )

  ; Static facts – the two locations are adjacent (undirected)
  (:init
    ; Initial locations
    (at truck1 post-office)
    (at package1 post-office)

    ; Connectivity
    (adjacent post-office house)
    (adjacent house post-office)
  )

  ; Goal: the package must be at the house
  (:goal (at package1 house))
)