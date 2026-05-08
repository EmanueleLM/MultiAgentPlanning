(define (problem job1)
  (:domain transport-hoist)

  (:objects
    driver1 driver2 - driver
    truck1 truck2 - vehicle
    hoist1 - hoist
    cargoa cargob - container
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
    (container-at cargoa dock)    ;; cargoa starts at dock and requires hoist handling
    (container-at cargob depot)   ;; cargob can be handled manually

    ;; constraint from auditor: cargoa must be handled by hoist (hard constraint)
    (requires-hoist cargoa)
  )

  (:goal
    (and
      ;; both cargos must be on the ground at site (terminal condition)
      (container-at cargoa site)
      (container-at cargob site)

      ;; final containers must not be loaded in any vehicle or attached to hoist
      (not (loaded-in cargoa truck1))
      (not (loaded-in cargoa truck2))
      (not (attached-to-hoist cargoa hoist1))

      (not (loaded-in cargob truck1))
      (not (loaded-in cargob truck2))
      (not (attached-to-hoist cargob hoist1))
    )
  )
)