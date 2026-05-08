(define (problem hoist-truck-problem)
  (:domain hoist-truck-domain)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; hoist locations
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)

    ;; truck locations
    (at-truck truck0 depot0)
    (at-truck truck1 depot2)
    (at-truck truck2 distributor0)

    ;; pallet locations
    (at-pallet pallet0 depot0)
    (at-pallet pallet1 depot1)
    (at-pallet pallet2 depot2)
    (at-pallet pallet3 distributor0)

    ;; stacking / crate placement
    (on-pallet crate0 pallet0)
    (on-crate crate1 crate0)
    (on-pallet crate2 pallet2)

    ;; explicit at-crate facts (crates are at the place of their support)
    (at-crate crate0 depot0)
    (at-crate crate1 depot0)
    (at-crate crate2 depot2)

    ;; clear flags consistent with stacking: crate1 and crate2 clear; crate0 not clear
    (clear-crate crate1)
    (clear-crate crate2)
    (clear-pallet pallet1)
    (clear-pallet pallet3)

    ;; hoists available
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
  )

  (:goal (and
    (on-crate crate0 crate1)
    (on-pallet crate1 pallet1)
  ))
)