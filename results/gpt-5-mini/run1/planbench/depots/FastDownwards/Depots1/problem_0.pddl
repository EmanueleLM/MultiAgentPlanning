(define (problem transport_scenario)
  (:domain multiagent_transport)

  (:objects
    ; places
    dock site - place

    ; agents / equipment
    h1 - hoist
    t1 - truck

    ; surfaces (pallets)
    pallet1 pallet2 - surface

    ; cargo items
    cargo1 - cargo

    ; explicit steps for ordering
    init loaded secured driven unloaded audited - step
  )

  (:init
    ; initial positions
    (at-hoist h1 dock)
    (at-truck t1 dock)

    ; surfaces locations
    (surface-at pallet1 dock)
    (surface-at pallet2 site)

    ; initial contents: cargo1 is on pallet1 at dock; pallet2 is empty at site
    (on-surface cargo1 pallet1)
    (surface-empty pallet2)

    ; initial resource states
    (hoist-free h1)
    (truck-empty t1)

    ; sequence initial condition: only init is done
    (step-done init)
  )

  (:goal (and
    ; terminal conditions mandated by the specification:
    ; cargo is at the site on the destination surface
    (on-surface cargo1 pallet2)
    (surface-at pallet2 site)

    ; truck ends at the site and is empty
    (at-truck t1 site)
    (truck-empty t1)

    ; cargo has been audited
    (audited cargo1)

    ; final sequence step must be recorded
    (step-done audited)
  ))