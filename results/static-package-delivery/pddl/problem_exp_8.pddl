(define (problem deliver-pkg)
  (:domain truck-delivery)

  ;--------------------------------------------------------------------
  ; Objects
  (:objects
    truck-1   - truck
    package-1 - package
    post-office - loc
    house       - loc
  )

  ;--------------------------------------------------------------------
  ; Initial situation
  (:init
    ; The truck and the package are both at the post‑office at start
    (at-truck truck-1 post-office)
    (at-pkg   package-1 post-office)
    ; The package is not yet in the truck
    (not (in-pkg package-1 truck-1))
  )

  ;--------------------------------------------------------------------
  ; Goal
  (:goal
    ; The package must be on (i.e., at) the house at the end
    (at-pkg package-1 house)
  )
)