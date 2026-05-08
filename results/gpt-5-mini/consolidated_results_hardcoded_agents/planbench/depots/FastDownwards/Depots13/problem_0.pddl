(define (problem deliver-and-stack)
  (:domain multiagent-depot)
  ; Objects: explicit domain elements required by the task
  (:objects
    depotA - depot
    distributorB - distributor
    ; places include depot and distributor (depot/distributor are subtypes of place)
    depot_place - place

    truck1 - truck
    hoist1 - hoist

    ; Surfaces: two depot floor positions, pallet at distributor, two truck bed slots, and top surfaces for each crate
    depot-floor1 depot-floor2 pallet1 truck-bed1 truck-bed2 top-crate0 top-crate1 top-crate2 - surface

    crate0 crate1 crate2 - crate
  )

  ; Initial state:
  (:init
    ; Location of trucks and hoist
    (at-truck truck1 depotA)
    (at-hoist hoist1 distributorB)

    ; Surfaces and where they are located:
    (surface-at depot-floor1 depotA)
    (surface-at depot-floor2 depotA)
    (surface-at pallet1 distributorB)

    ; Truck bed slots belong to truck1 (bed-of implies they move with the truck)
    (bed-of truck-bed1 truck1)
    (bed-of truck-bed2 truck1)

    ; Top-of-crate surfaces associated with each crate
    (surface-of top-crate0 crate0)
    (surface-of top-crate1 crate1)
    (surface-of top-crate2 crate2)

    ; Initial crate placements: crate0 and crate2 start at the depot floor positions
    (on crate0 depot-floor1)
    (on crate2 depot-floor2)
    ; crate1 is unused and starts on its top surface as a stand-in (empty top); for completeness place it on top-crate1 (this surface then is occupied)
    (on crate1 top-crate1)

    ; Surface clearances: top surfaces are clear unless occupied above
    ; depot floor positions are occupied by the crates, so not clear
    (not (clear depot-floor1))
    (not (clear depot-floor2))
    ; pallet is initially clear
    (clear pallet1)
    ; truck beds are initially clear
    (clear truck-bed1)
    (clear truck-bed2)
    ; top surfaces for crates: top-crate0 and top-crate2 are clear (no crate on them), top-crate1 is not clear because crate1 sits on it
    (clear top-crate0)
    (not (clear top-crate1))
    (clear top-crate2)

    ; Hoist is free initially
    (hoist-free hoist1)
  )

  ; Goal: crate0 is on pallet1 and crate2 is on top of crate0
  ; Using the surface-of relation, "crate2 on crate0" is expressed as crate2 on the top surface associated with crate0.
  (:goal (and
    (on crate0 pallet1)
    (on crate2 top-crate0)
  ))
)