(define (problem job1)
  (:domain transport-hoist)

  (:objects
    driver1 driver2 - driver
    truck1 truck2 - vehicle
    hoist1 - hoist
    cargoA cargoB - container
    depot dock site - loc
  )

  (:init
    ;; vehicles at locations
    (at-vehicle truck1 dock)
    (at-vehicle truck2 depot)

    ;; drivers at locations (not in vehicles)
    (at-driver driver1 depot)
    (at-driver driver2 site)

    ;; hoist location and free
    (at-hoist hoist1 dock)
    (hoist-free hoist1)

    ;; vehicle availability
    (vehicle-free truck1)
    (vehicle-free truck2)

    ;; containers initial locations
    (container-at cargoA dock)    ;; cargoA starts at dock and requires hoist handling
    (container-at cargoB depot)   ;; cargoB can be handled manually

    ;; constraint from auditor: cargoA must be handled by hoist (hard constraint)
    (requires-hoist cargoA)

    ;; ensure cargoB does not require hoist by omission (no requires-hoist predicate)
  )

  (:goal
    (and
      ;; both cargos must be on the ground at site (terminal condition)
      (container-at cargoA site)
      (container-at cargoB site)

      ;; final containers must not be loaded in any vehicle or attached to hoist
      (not (loaded-in cargoA truck1))
      (not (loaded-in cargoA truck2))
      (not (attached-to-hoist cargoA hoist1))

      (not (loaded-in cargoB truck1))
      (not (loaded-in cargoB truck2))
      (not (attached-to-hoist cargoB hoist1))
    )
  )
)