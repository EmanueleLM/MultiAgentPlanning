(define (problem deliver-package)
  (:domain delivery)

  (:objects
    truck-1      - truck
    package-1    - package
    post-office  - location
    house        - location
  )

  (:init
    (at-truck   truck-1  post-office)   ; Truck starts at the post office
    (at-package package-1  post-office) ; Package starts at the post office
  )

  (:goal
    (and
      (at-package package-1 house)         ; Package must be at the house
      (not (in package-1 truck-1))        ; And it must not still be inside the truck
    )
  )
)