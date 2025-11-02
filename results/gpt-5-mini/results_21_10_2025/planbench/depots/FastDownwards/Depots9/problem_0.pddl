(define (problem instanceA)
  (:domain robot-ops)
  (:objects
    ra1 - robot
    locA1 locA2 - location
    pkgA - package
    itemA - item
  )
  (:init
    ;; Robot and package locations
    (at ra1 locA1)
    (at-pkg pkgA locA1)

    ;; Charger available at locA1
    (available-charger locA1)

    ;; Item state and location
    (at-item itemA locA2)
    (needs-inspection itemA)
    (defective itemA)

    ;; No robot is charged initially (charged predicates absent)
    ;; No inspected or repaired facts initially
  )
  (:goal (and
    ;; Deliver package to locA2 and repaired itemA
    (at-pkg pkgA locA2)
    (repaired itemA)
  ))
)