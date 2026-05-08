(define (problem depots13-prob)
  (:domain depots13)
  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    pallet0 pallet1 pallet2 pallet3 - surface
    top0 top1 top2 - surface
    bed0 bed1 bed2 - surface

    crate0 crate1 crate2 - crate
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  (:init
    ; truck and hoist locations
    (at-truck truck0 depot2)
    (at-truck truck1 distributor0)
    (at-truck truck2 distributor0)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ; static surfaces (pallets) locations
    (surface-at pallet0 depot0)
    (surface-at pallet1 depot1)
    (surface-at pallet2 depot2)
    (surface-at pallet3 distributor0)

    ; truck bed surfaces belong to trucks
    (bed-of bed0 truck0)
    (bed-of bed1 truck1)
    (bed-of bed2 truck2)

    ; top surfaces of crates
    (surface-of top0 crate0)
    (surface-of top1 crate1)
    (surface-of top2 crate2)

    ; initial crate placements
    (on crate0 pallet2)
    (on crate1 pallet0)
    (on crate2 pallet1)

    ; clearances: top surfaces of crates are clear
    (clear top0)
    (clear top1)
    (clear top2)
    ; pallet3 is clear initially
    (clear pallet3)
    ; truck beds initially clear
    (clear bed0)
    (clear bed1)
    (clear bed2)
    ; pallets with crates on them are not clear
    (not (clear pallet2))
    (not (clear pallet0))
    (not (clear pallet1))

    ; hoists are free
    (hoist-free hoist0)
    (hoist-free hoist1)
    (hoist-free hoist2)
    (hoist-free hoist3)
  )

  (:goal (and
    (on crate0 pallet1)
    (on crate2 top0)
  ))
)