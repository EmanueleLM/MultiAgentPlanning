(define (problem depots29_problem)
  (:domain depots29)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
  )
  (:init
    (= (total-cost) 0)

    ; Hoists and their initial states
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    ; Trucks and their initial states
    (at truck0 depot0)
    (at truck1 depot1)
    (at truck2 depot2)

    ; Pallets and their initial locations
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    ; Crates and their initial states
    ; crate0 is at distributor0, on pallet3, clear
    (at crate0 distributor0)
    (on crate0 pallet3)
    (clear crate0)

    ; crate1 is at depot0, on pallet0
    (at crate1 depot0)
    (on crate1 pallet0)
    ; crate1 is NOT clear because crate2 is on it (implied by next line)

    ; crate2 is at depot0, on crate1, clear
    (at crate2 depot0)
    (on crate2 crate1)
    (clear crate2)

    ; Explicit clear states for other surfaces
    (clear pallet1)
    (clear pallet2)

    ; Inferred non-clear states (not explicitly listed as (not (clear ...)))
    ; pallet0 is not clear (crate1 is on it)
    ; pallet3 is not clear (crate0 is on it)
    ; crate1 is not clear (crate2 is on it)
  )
  (:goal (and
    (on crate1 pallet1)
    (on crate2 pallet2)
  ))
  (:metric minimize (total-cost))
)