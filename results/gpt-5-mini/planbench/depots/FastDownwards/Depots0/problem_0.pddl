(define (problem place-crates-on-pallets)
  (:domain multiagent_handling)

  (:objects
    ;; agents and equipment
    driver1 - driver
    hoist1 - hoist
    truck1 - vehicle

    ;; crates and pallets
    crate1 crate2 - crate
    pallet1 pallet3 - pallet

    ;; locations
    loc1 loc2 loc3 loc4 - location
  )

  (:init
    ;; initial locations
    (at-driver driver1 loc1)
    (at-vehicle truck1 loc1)
    (vehicle-empty truck1)

    (at-hoist hoist1 loc2)
    (hoist-free hoist1)

    ;; crates start on ground at locations
    (at-crate crate1 loc1)
    (at-crate crate2 loc2)

    ;; pallets are at fixed locations
    (at-pallet pallet1 loc3)
    (at-pallet pallet3 loc4)
  )

  ;; Final required state: specific crates on specific pallets
  (:goal (and
           (crate-on-pallet crate1 pallet1)
           (crate-on-pallet crate2 pallet3)
         ))
)