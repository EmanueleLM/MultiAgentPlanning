(define (problem depots19_problem)
  (:domain depots_hoist_truck)

  (:objects
    depot0 depot1 depot2 - depot
    distributor0 - distributor
    hoist0 hoist1 hoist2 hoist3 - hoist
    truck0 truck1 truck2 - truck
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
  )

  (:init
    ;; hoist locations
    (at_hoist hoist0 depot0)
    (at_hoist hoist1 depot1)
    (at_hoist hoist2 depot2)
    (at_hoist hoist3 distributor0)

    ;; truck locations
    (at_truck truck0 depot0)
    (at_truck truck1 depot2)
    (at_truck truck2 distributor0)

    ;; pallet locations (pallets are stationary surfaces at places)
    (at_pallet pallet0 depot0)
    (at_pallet pallet1 depot1)
    (at_pallet pallet2 depot2)
    (at_pallet pallet3 distributor0)

    ;; stacking / crate placement (support relations)
    (on_pallet crate0 pallet0)
    (on_crate crate1 crate0)
    (on_pallet crate2 pallet2)

    ;; crate location facts mirror their supports (the place of the supporting surface)
    (at_crate crate0 depot0)
    (at_crate crate1 depot0)
    (at_crate crate2 depot2)

    ;; clear flags consistent with stacking: top-most surfaces are clear
    (clear_crate crate1)
    (clear_crate crate2)
    (clear_pallet pallet1)
    (clear_pallet pallet3)

    ;; all hoists initially available
    (hoist_available hoist0)
    (hoist_available hoist1)
    (hoist_available hoist2)
    (hoist_available hoist3)
  )

  (:goal (and
    (on_crate crate0 crate1)
    (on_pallet crate1 pallet1)
  ))
)