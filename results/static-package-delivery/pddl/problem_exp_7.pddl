(define (problem deliver-package)
  (:domain truckdriver)

  ; ---------- objects ----------
  (:objects
    truck1          - truck
    package1        - package
    postoffice      - location
    house           - location)

  ; ---------- initial state ----------
  (:init
    (truck-at truck1 postoffice)
    (package-at package1 postoffice)

    ; only one link allows the truck to move
    (adjacent postoffice house)
    (adjacent house postoffice))

  ; ---------- goal ----------
  (:goal
    (package-at package1 house))
)