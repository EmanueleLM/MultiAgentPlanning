(define (problem move-and-elevate-cargo)
  (:domain logistics-hoist)

  (:objects
    driver1 - driver
    hoistop1 - hoistop
    lifterop1 - lifterop

    truck1 - truck
    hoist1 - hoist
    lifter1 - lifter

    depot roadA site-ground site-platform site-roof - location

    crate1 - cargo
  )

  (:init
    ;; Initial positions
    (at-driver driver1 depot)
    (at-truck truck1 depot)

    ;; Operators located: hoist operator starts at ground site; lifter operator starts at platform
    (at-driver hoistop1 site-ground)
    (at-driver lifterop1 site-platform)

    ;; Machines at their starting positions
    (at-hoist hoist1 site-ground)
    (at-lifter lifter1 site-platform)

    ;; Cargo initial location
    (at-cargo crate1 depot)

    ;; Road connectivity (explicitly directional edges; planner can use either direction because both edges are listed)
    (road depot roadA)
    (road roadA depot)
    (road roadA site-ground)
    (road site-ground roadA)

    ;; Note: there is no initial attachment or raised status
  )

  ;; Goal: cargo must end up on the roof (site-roof). This is a strict terminal condition.
  ;; Additionally enforce cargo is not attached and not on truck by making final world include only the positive fact
  ;; (at-cargo crate1 site-roof). Since actions remove attached/on-truck flags when placing cargo at a location,
  ;; the solver cannot leave the cargo attached or on-truck while satisfying the at-cargo condition.
  (:goal (and
    (at-cargo crate1 site-roof)
  ))
)