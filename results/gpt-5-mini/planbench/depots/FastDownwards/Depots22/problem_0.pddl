(define (problem example-truck-hoist-instance)
  (:domain truck-hoist-warehouse)

  (:objects
    depot1 bay1 - place
    truck1 - truck
    crate1 - crate
    hoist1 - hoist
  )

  ;; INITIAL STATE
  (:init
    ;; locations
    (at-truck truck1 depot1)
    (at-crate crate1 depot1)
    (hoist-at hoist1 depot1)

    ;; hoist availability
    (hoist-empty hoist1)

    ;; area clearances
    (area-clear depot1)
    (area-clear bay1)

    ;; truck docking/access state
    ;; For this instance, truck is docked and door open at depot1 to allow immediate load sequence.
    (truck-docked truck1 depot1)
    (truck-door-open truck1)

    ;; hoist alignment between hoist1 and crate1 at depot1 is initially true (explicit)
    (hoist-aligned hoist1 crate1 depot1)
  )

  ;; GOAL: crate1 must be in truck1; hoist must end empty; truck remains at depot1
  (:goal (and
    (in crate1 truck1)
    (hoist-empty hoist1)
    (at-truck truck1 depot1)
  ))