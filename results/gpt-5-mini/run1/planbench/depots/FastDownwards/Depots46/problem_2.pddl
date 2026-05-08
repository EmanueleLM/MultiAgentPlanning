(define (problem depots46)
  (:domain jack_of_all_trades)

  (:objects
    depot0 depot1 depot2 distributor0 - place
    truck0 truck1 truck2 - truck
    hoist0 hoist1 hoist2 hoist3 - hoist
    pallet0 pallet1 pallet2 pallet3 - pallet
    crate0 crate1 crate2 - crate
    ;; all pallets, crates, trucks, hoists are objects for the 'at' predicate
    pallet0_obj pallet1_obj pallet2_obj pallet3_obj crate0_obj crate1_obj crate2_obj truck0_obj truck1_obj truck2_obj hoist0_obj hoist1_obj hoist2_obj hoist3_obj - object
  )

  (:init
    ;; map substance objects to their place identity using the object-typed atoms
    ;; trucks locations
    (at truck0_obj depot0)
    (at truck1_obj depot2)
    (at truck2_obj depot2)
    ;; hoists locations
    (at hoist0_obj depot0)
    (at hoist1_obj depot1)
    (at hoist2_obj depot2)
    (at hoist3_obj distributor0)
    ;; pallets locations
    (at pallet0_obj depot0)
    (at pallet1_obj depot1)
    (at pallet2_obj depot2)
    (at pallet3_obj distributor0)
    ;; crates absolute locations (redundant with on facts for crates on pallets,
    ;; but included because actions refer to (at ?c ?p) for lifted/unloaded crates)
    (at crate0_obj depot0)
    (at crate1_obj depot2)
    (at crate2_obj depot1)

    ;; link typed objects used in predicates:
    ;; note: we also assert the same 'at' facts for the typed names used in actions.
    ;; initial placement of pallets and crates (these are the pallet/crate objects used by 'on' and 'clear'):
    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at crate0 depot0)
    (at crate1 depot2)
    (at crate2 depot1)

    ;; crate on pallet relations
    (on crate0 pallet0)
    (on crate1 pallet2)
    (on crate2 pallet1)

    ;; surface and crate clearance (crate clear means nothing on top of it)
    (clear crate0)
    (clear crate1)
    (clear crate2)
    (clear pallet3)

    ;; hoist availability
    (available hoist0)
    (available hoist1)
    (available hoist2)
    (available hoist3)
  )

  (:goal (and
    (on crate0 pallet0)
    (on crate1 pallet3)
    (on crate2 pallet2)
  ))
)