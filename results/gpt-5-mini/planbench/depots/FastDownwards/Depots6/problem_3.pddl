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
    (at-vehicle truck1 dock)
    (at-vehicle truck2 depot)

    (at-driver driver1 depot)
    (at-driver driver2 site)

    (at-hoist hoist1 dock)
    (hoist-free hoist1)

    (vehicle-free truck1)
    (vehicle-free truck2)

    (container-at cargoa dock)
    (container-at cargob depot)

    (requires-hoist cargoa)
  )

  (:goal
    (and
      (container-at cargoa site)
      (container-at cargob site)

      (not (loaded-in cargoa truck1))
      (not (loaded-in cargoa truck2))
      (not (attached-to-hoist cargoa hoist1))

      (not (loaded-in cargob truck1))
      (not (loaded-in cargob truck2))
      (not (attached-to-hoist cargob hoist1))
    )
  )
)