(define (problem crate-hoist-problem)
  (:domain crate-hoist-orchestration)

  (:objects
    depot0 depot1 - place

    truck0 truck1 truck2 - truck

    hoistA hoistB - hoist

    pallet0 surface0_depot1 surface1_depot1 - surface

    crate0 crate1 crate2 - crate
  )

  (:init
    ;; truck initial locations
    (at-truck truck0 depot1)
    (at-truck truck1 depot1)
    (at-truck truck2 depot0)

    ;; hoist locations and availability
    (hoist-at hoistA depot1)
    (hoist-at hoistB depot0)
    (hoist-available hoistA)
    (hoist-available hoistB)

    ;; surfaces located at places
    (surface-at pallet0 depot0)
    (surface-at surface0_depot1 depot1)
    (surface-at surface1_depot1 depot1)

    ;; crates initial stacking and locations (crate is also a surface)
    ;; crate2 on pallet0 at depot0
    (on crate2 pallet0)
    (surface-at crate2 depot0)

    ;; crate0 at depot1 on surface0_depot1
    (on crate0 surface0_depot1)
    (surface-at crate0 depot1)

    ;; crate1 at depot1 on surface1_depot1
    (on crate1 surface1_depot1)
    (surface-at crate1 depot1)

    ;; clear flags: crates with no crate on them are clear
    (clear crate2)
    (clear crate0)
    (clear crate1)

    ;; surfaces that currently have something on them are not clear:
    ;; pallet0 has crate2 -> not clear (so we do NOT assert (clear pallet0))
    ;; surface0_depot1 has crate0 -> not clear
    ;; surface1_depot1 has crate1 -> not clear
  )

  ;; Goal: final stacking arrangement required by the specification
  (:goal (and
    (on crate2 pallet0)
    (on crate0 crate2)
    (on crate1 crate0)
  ))
)