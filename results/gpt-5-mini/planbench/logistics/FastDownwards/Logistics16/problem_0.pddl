(define (problem audited-logistics-problem)
  (:domain audited-logistics)

  (:objects
    t1 - truck
    a1 - airplane
    l1 - loader
    p1 p2 - package
    depot airport dest - location
  )

  (:init
    ;; initial vehicle/loader locations
    (at t1 depot)
    (at a1 airport)
    (loader-at l1 airport)

    ;; loader certification (auditor remediation requirement)
    (loader-certified l1)

    ;; initial package locations (both packages start at depot on the ground)
    (atpkg p1 depot)
    (atpkg p2 depot)
  )

  (:goal
    (and
      ;; Final mandated terminal conditions:
      ;; both packages at destination ground location
      (atpkg p1 dest)
      (atpkg p2 dest)

      ;; Auditor requires preservation of inspection and sealing records:
      (inspected p1)
      (inspected p2)
      (sealed p1)
      (sealed p2)

      ;; Ensure airplane has flown to final destination (mandated terminal condition)
      (at a1 dest)
    )
  )
)