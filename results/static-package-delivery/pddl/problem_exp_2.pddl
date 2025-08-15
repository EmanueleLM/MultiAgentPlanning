(define (problem delivery-problem)
  (:domain delivery)

  (:objects
    truck1                         - truck
    pkg1                           - package
    postoffice  house              - location
  )

  (:init
    (at-truck truck1 postoffice)    ; truck starts at the post‑office
    (at-pkg   pkg1 postoffice)      ; package starts at the post‑office
  )

  (:goal
    (and
      (at-pkg pkg1 house)        ; package must be at the house
      (not (in pkg1 truck1))     ; and must not be inside the truck
    )
  )
)