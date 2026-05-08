(define (problem depot-hoist-move-crates)
  (:domain depot-hoist-operations)
  (:objects
    dep_op - depot-operator
    hoist_op - hoist-operator
    ho1 - hoist

    crate1 crate2 - crate
    pallet1 pallet2 - pallet

    loc_storage1 loc_storage2 loc_pallet1 loc_pallet2 - location
  )

  (:init
    ; initial positions
    (at dep_op loc_storage1)
    (at hoist_op loc_storage1)
    (at ho1 loc_storage1)

    (at crate1 loc_storage1)
    (at crate2 loc_storage2)

    (at pallet1 loc_pallet1)
    (at pallet2 loc_pallet2)

    ; operator and hoist availability
    (handfree dep_op)
    (hoist_free ho1)

    ; crates are initially ready for pickup, must go through stages
    (ready_for_pickup crate1)
    (ready_for_pickup crate2)

    ; pallets start empty (single-slot)
    (pallet_empty pallet1)
    (pallet_empty pallet2)
  )

  (:goal
    (and
      ; final mandated terminal conditions:
      (on_pallet crate1 pallet1)
      (on_pallet crate2 pallet2)
      (stage_placed_on_pallet crate1)
      (stage_placed_on_pallet crate2)
    )
  )
)