(define (problem depots6-problem)
  (:domain depots-hoist-ordered)

  (:objects
    depot0 depot1 depot2 distributor0 - place

    pallet0 pallet1 pallet2 pallet3 - pallet

    crate0 crate1 crate2 - crate

    hoist0 hoist1 hoist2 hoist3 - hoist

    truck0 truck1 truck2 - truck

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; stage initialisation (linear successor chain)
    (now s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)

    ;; pallets at places
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; crates initial stacking and locations
    ;; crate0 is at depot2 on pallet2
    (on-pallet crate0 pallet2)
    (at-crate crate0 depot2)

    ;; crate1 is at depot0 on pallet0
    (on-pallet crate1 pallet0)
    (at-crate crate1 depot0)

    ;; crate2 is on crate1 (therefore at depot0 as crate1 is at depot0)
    (on-crate crate2 crate1)
    (at-crate crate2 depot0)

    ;; hoists at places and available
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)

    ;; trucks at places
    (at-truck truck0 distributor0)
    (at-truck truck1 distributor0)
    (at-truck truck2 depot2)

    ;; clear / not-clear flags
    ;; crate0 is clear, crate2 is clear, crate1 has crate2 on it so not clear
    (crate-clear crate0)
    (not (crate-clear crate1))
    (crate-clear crate2)

    ;; pallet clear flags: pallet1 and pallet3 clear; pallet0 and pallet2 hold crates
    (pallet-clear pallet1)
    (pallet-clear pallet3)
    (not (pallet-clear pallet0))
    (not (pallet-clear pallet2))
  )

  (:goal (and
    ;; desired final stacking:
    ;; crate0 on crate2
    (on-crate crate0 crate2)
    ;; crate1 on pallet2
    (on-pallet crate1 pallet2)
    ;; crate2 on pallet1
    (on-pallet crate2 pallet1)
  ))
)