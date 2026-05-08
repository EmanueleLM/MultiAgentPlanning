(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 - stage
  )

  (:init
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 distributor0)
    (at truck1 depot2)
    (at truck2 depot0)

    (on crate0 pallet1)
    (on crate1 pallet2)
    (on crate2 pallet3)

    (at crate0 depot1)
    (at crate1 depot2)
    (at crate2 distributor0)

    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)

    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet0)

    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)

    (current s0)
  )

  (:goal (and
           (on crate0 pallet1)
           (on crate1 pallet2)
           (on crate2 pallet0)
         ))
)