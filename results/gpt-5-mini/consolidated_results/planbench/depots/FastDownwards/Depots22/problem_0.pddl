(define (problem move-crate-depot-to-customer)
  (:domain hoist-truck-warehouse)
  (:objects
    ;; places
    depot customer - place

    ;; trucks
    truck1 - truck

    ;; hoists
    hoist1 - hoist

    ;; supports (pallets)
    pallet-depot pallet-cust - support

    ;; crates
    crate1 - crate

    ;; slots
    slot1 - slot
  )

  (:init
    ;; locations
    (truck-at truck1 depot)
    (hoist-at hoist1 depot)
    (support-at pallet-depot depot)
    (support-at pallet-cust customer)

    ;; crate initially on a pallet at the depot
    (on crate1 pallet-depot)
    (crate-at crate1 depot)

    ;; clear predicates: crate top is clear, depot pallet is not clear, customer pallet is clear
    (clear-crate crate1)
    ;; pallet-depot has crate on it, so it is NOT clear (omit clear-support pallet-depot)
    (clear-support pallet-cust)

    ;; hoist is available
    (hoist-free hoist1)

    ;; truck slot setup: slot1 belongs to truck1 and is free
    (slot-of slot1 truck1)
    (slot-free slot1)

    ;; truck door initially closed (truck-open absent implies closed)
  )

  ;; Goal: crate placed on customer pallet at the customer place, hoist free, and truck's slot free
  (:goal (and
    (on crate1 pallet-cust)
    (crate-at crate1 customer)
    (hoist-free hoist1)
    (slot-free slot1)
  ))