(define (problem cargo_hoist_truck_problem)
  (:domain cargo_hoist_truck)

  (:objects
    ;; agents
    driver0 - driver
    hoistop0 - hoist_op

    ;; vehicles and handling equipment
    truck0 - truck

    ;; payloads and support
    crate0 crate1 - crate
    pallet0 pallet3 - pallet

    ;; locations
    loc1 loc2 - location
  )

  (:init
    ;; locations
    (truck-at truck0 loc1)
    (driver-at driver0 loc1)
    (hoistop-at hoistop0 loc1)

    ;; crates initial placement (explicit initial facts from the statement)
    (crate-at crate0 loc1)
    (crate-at crate1 loc2)

    ;; pallets initial placement
    (pallet-at pallet0 loc1)
    (pallet-at pallet3 loc2)

    ;; resource availability
    (driver-free driver0)
    (hoistop-free hoistop0)

    ;; ensure no crates start lifted / in-truck / on-pallet
    ;; (These are not needed if absent, but made explicit for clarity)
    ;; no (lifted ...) facts
    ;; no (in-truck ...) facts
    ;; no (on-pallet ...) facts
  )

  (:goal (and
    ;; Global mandated terminal conditions: crate0 on pallet3 and crate1 on pallet0
    (on-pallet crate0 pallet3)
    (on-pallet crate1 pallet0)
  ))