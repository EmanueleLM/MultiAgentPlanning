(define (problem depots7-instance)
  (:domain depots-logistics)
  (:objects
    depot0 depot1 depot2 distributor0 - place
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    time0 time1 time2 time3 time4 time5 time6 time7 time8 time9 time10 time11 time12 time13 time14 time15 time16 time17 time18 time19 time20 - time
  )

  (:init
    (next time0 time1)
    (next time1 time2)
    (next time2 time3)
    (next time3 time4)
    (next time4 time5)
    (next time5 time6)
    (next time6 time7)
    (next time7 time8)
    (next time8 time9)
    (next time9 time10)
    (next time10 time11)
    (next time11 time12)
    (next time12 time13)
    (next time13 time14)
    (next time14 time15)
    (next time15 time16)
    (next time16 time17)
    (next time17 time18)
    (next time18 time19)
    (next time19 time20)
    (now time0)

    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    (on-pallet crate0 pallet1)
    (at-crate crate0 depot1)

    (on-pallet crate1 pallet3)
    (at-crate crate1 distributor0)

    (on-pallet crate2 pallet0)
    (at-crate crate2 depot0)

    (clear-crate crate0)
    (clear-crate crate1)
    (clear-crate crate2)
    (clear-pallet pallet2)

    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    (at-truck truck0 depot0)
    (at-truck truck1 distributor0)
    (at-truck truck2 depot1)

    (distinct crate0 crate1)
    (distinct crate1 crate0)
    (distinct crate0 crate2)
    (distinct crate2 crate0)
    (distinct crate1 crate2)
    (distinct crate2 crate1)
  )

  (:goal (and
    (on-pallet crate0 pallet3)
    (on-crate  crate1 crate2)
    (on-pallet crate2 pallet1)
  ))
)