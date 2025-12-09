; Problem: place three crates onto three specific pallets using the hoist
; Assumptions (see also separate assumptions note after the problem):
; - There is one location "dock" where all agents and pallets are located.
; - All crates (crate0, crate1, crate2) initially reside in truck0.
; - Pallets pallet0, pallet2, pallet3 are initially empty and located at dock.
; - Single hoist agent hoist0 and single truck agent truck0 are co-located at dock.
(define (problem place-crates-on-pallets)
  (:domain hoist-truck-pallet)
  (:objects
    hoist0 - hoist
    truck0 - truck
    crate0 crate1 crate2 - crate
    pallet0 pallet2 pallet3 - pallet
    dock - location
  )
  (:init
    ; locations
    (at-hoist hoist0 dock)
    (at-truck truck0 dock)

    ; pallets at dock and free initially
    (pallet-at pallet0 dock)
    (pallet-free pallet0)
    (pallet-at pallet2 dock)
    (pallet-free pallet2)
    (pallet-at pallet3 dock)
    (pallet-free pallet3)

    ; all crates initially in the truck (assumption)
    (in-truck crate0 truck0)
    (in-truck crate1 truck0)
    (in-truck crate2 truck0)

    ; hoist is initially empty
    (hoist-empty hoist0)
  )

  (:goal
    (and
      (crate-on-pallet crate0 pallet0)
      (crate-on-pallet crate1 pallet2)
      (crate-on-pallet crate2 pallet3)
    )
  )
)