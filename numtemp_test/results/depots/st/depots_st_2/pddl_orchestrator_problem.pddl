(define (problem multiagent_hoist_truck_problem)
  (:domain multiagent_hoist_truck_domain)

  (:objects
    ; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ; trucks
    truck0 truck1 - truck

    ; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet

    ; crates
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate

    ; surfaces (all pallets and crates)
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - surface
  )

  ; Initial state
  (:init
    ; place declarations (optional)
    (place? depot0) (place? depot1) (place? depot2)
    (place? distributor0) (place? distributor1) (place? distributor2)

    ; trucks present
    (truck? truck0) (truck? truck1)

    ; hoists present
    (hoist? hoist0) (hoist? hoist1) (hoist? hoist2) (hoist? hoist3) (hoist? hoist4) (hoist? hoist5)

    ; pallets and crates are typed by their names (pallet? and crate? are declared implicitly by objects)
    (pallet? pallet0) (pallet? pallet1) (pallet? pallet2) (pallet? pallet3) (pallet? pallet4) (pallet? pallet5)
    (crate? crate0) (crate? crate1) (crate? crate2) (crate? crate3) (crate? crate4) (crate? crate5)
    (crate? crate6) (crate? crate7) (crate? crate8) (crate? crate9) (crate? crate10) (crate? crate11)
    (crate? crate12) (crate? crate13) (crate? crate14)

    ; surfaces present
    (surface? pallet0) (surface? pallet1) (surface? pallet2) (surface? pallet3) (surface? pallet4) (surface? pallet5)
    (surface? crate0) (surface? crate1) (surface? crate2) (surface? crate3) (surface? crate4) (surface? crate5)
    (surface? crate6) (surface? crate7) (surface? crate8) (surface? crate9) (surface? crate10) (surface? crate11)
    (surface? crate12) (surface? crate13) (surface? crate14)

    ; Locations of hoists and surfaces (from initial stacks/locations_contents)
    ; depot0: ['hoist0', 'pallet0']
    (hoist-at hoist0 depot0)
    (at-surface pallet0 depot0)

    ; depot1: ['crate1', 'crate5', 'crate10', 'crate12', 'hoist1', 'pallet1', 'truck1']
    (hoist-at hoist1 depot1)
    (at-surface pallet1 depot1)
    (at-surface crate1 depot1)
    (at-surface crate5 depot1)
    (at-surface crate10 depot1)
    (at-surface crate12 depot1)
    (at truck1 depot1)

    ; depot2: ['hoist2', 'pallet2']
    (hoist-at hoist2 depot2)
    (at-surface pallet2 depot2)

    ; distributor0: ['crate2', 'crate4', 'hoist3', 'pallet3']
    (hoist-at hoist3 distributor0)
    (at-surface pallet3 distributor0)
    (at-surface crate2 distributor0)
    (at-surface crate4 distributor0)

    ; distributor1: ['crate11', 'crate14', 'hoist4', 'pallet4', 'truck0']
    (hoist-at hoist4 distributor1)
    (at-surface pallet4 distributor1)
    (at-surface crate11 distributor1)
    (at-surface crate14 distributor1)
    (at truck0 distributor1)

    ; distributor2: ['crate0', 'crate3', 'crate6', 'crate7', 'crate8', 'crate9', 'crate13', 'hoist5', 'pallet5']
    (hoist-at hoist5 distributor2)
    (at-surface pallet5 distributor2)
    (at-surface crate0 distributor2)
    (at-surface crate3 distributor2)
    (at-surface crate6 distributor2)
    (at-surface crate7 distributor2)
    (at-surface crate8 distributor2)
    (at-surface crate9 distributor2)
    (at-surface crate13 distributor2)

    ; on relations (from on_relations mapping)
    (on crate3 crate0)
    (on crate5 crate1)
    (on crate4 crate2)
    (on crate6 crate3)
    (on crate10 crate5)
    (on crate7 crate6)
    (on crate8 crate7)
    (on crate9 crate8)
    (on crate13 crate9)
    (on crate12 crate10)
    (on crate14 crate11)
    (on crate1 pallet1)
    (on crate2 pallet3)
    (on crate11 pallet4)
    (on crate0 pallet5)

    ; clear surfaces initially (given)
    (clear crate4) (clear crate12) (clear crate13) (clear crate14) (clear pallet0) (clear pallet2)

    ; hoists initially available
    (hoist-available hoist0) (hoist-available hoist1) (hoist-available hoist2)
    (hoist-available hoist3) (hoist-available hoist4) (hoist-available hoist5)

    ; no crates initially in trucks (in-trucks mapping empty)
    ; (no in-truck predicates asserted)

    ; Note: surfaces that are not listed as clear are implicitly not clear because something is on them per on-relations or stack information.
  )

  ; Goals: desired on relations (as provided)
  (:goal (and
    (on crate2 crate0)
    (on crate6 crate2)
    (on crate3 crate9)
    (on crate14 crate10)
    (on crate1 crate12)
    (on crate10 crate13)
    (on crate5 pallet0)
    (on crate13 pallet1)
    (on crate9 pallet2)
    (on crate0 pallet4)
    (on crate12 pallet5)
  ))

  (:metric minimize (total-time))
)