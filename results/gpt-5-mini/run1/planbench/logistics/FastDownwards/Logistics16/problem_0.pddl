(define (problem transport-audit-problem)
  (:domain transport-audit-domain)

  (:objects
    ;; trucks
    truck1 truck2 - truck

    ;; airplane
    plane1 - airplane

    ;; loaders
    loader1 loader2 - loader

    ;; container
    cargo1 - container

    ;; locations (airports are locations; airport type used in predicates)
    warehouse - location
    customer - location
    airportA airportB - airport
  )

  (:init
    ;; initial vehicle and cargo positions
    (at-truck truck1 warehouse)
    (at-truck truck2 airportB)
    (at-airplane plane1 airportA)
    (at-loader loader1 airportA)
    (at-loader loader2 airportB)
    (at-container cargo1 warehouse)

    ;; no certifications or inspections initially (must be performed)
    ;; stage 0 is considered done (start)
    (stage-0-done)
  )

  (:goal
    (and
      ;; final required terminal conditions mandated by environment/auditor
      ;; cargo must be at the customer location
      (at-container cargo1 customer)

      ;; plane must have arrived at destination airport (airportB)
      (at-airplane plane1 airportB)

      ;; loader certifications and plane inspection must be completed as remediation
      (loader-certified loader1)
      (loader-certified loader2)
      (plane-inspected plane1)

      ;; final delivery stage must be reached
      (stage-6-done)
    )
  )
)