(define (problem move-crates)
  (:domain multi-agent-warehouse)

  (:objects
    ;; places
    depot0 depot1 depot2 distributor0 distributor1 distributor2 - place

    ;; trucks
    truck0 truck1 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 - hoist

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 - pallet

    ;; crates
    crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
  )

  (:init
    ;; trucks locations
    (at-truck truck0 depot1)
    (at-truck truck1 depot2)

    ;; hoist locations (hoists are stationary)
    (at-hoist hoist0 depot0)
    (at-hoist hoist1 depot1)
    (at-hoist hoist2 depot2)
    (at-hoist hoist3 distributor0)
    (at-hoist hoist4 distributor1)
    (at-hoist hoist5 distributor2)

    ;; pallets at places
    (at-obj pallet0 depot0)
    (at-obj pallet9 depot0)
    (at-obj pallet1 depot1)
    (at-obj pallet7 depot1)
    (at-obj pallet2 depot2)
    (at-obj pallet3 distributor0)
    (at-obj pallet4 distributor1)
    (at-obj pallet8 distributor1)
    (at-obj pallet5 distributor2)
    (at-obj pallet6 distributor2)

    ;; crates at places (explicit, even if also on something)
    (at-obj crate0 distributor1)
    (at-obj crate1 depot0)
    (at-obj crate2 distributor0)
    (at-obj crate3 distributor2)
    (at-obj crate4 depot0)
    (at-obj crate5 depot0)
    (at-obj crate6 distributor1)
    (at-obj crate7 distributor1)
    (at-obj crate8 depot1)
    (at-obj crate9 distributor0)

    ;; "on" relations (stacking)
    (on crate5 crate1)
    (on crate9 crate2)
    (on crate7 crate6)
    (on crate4 pallet0)
    (on crate8 pallet1)
    (on crate2 pallet3)
    (on crate6 pallet4)
    (on crate3 pallet6)
    (on crate0 pallet8)
    (on crate1 pallet9)

    ;; clear objects (those with nothing on top)
    (clear crate0)
    (clear crate3)
    (clear crate4)
    (clear crate5)
    (clear crate7)
    (clear crate8)
    (clear crate9)
    (clear pallet2)
    (clear pallet5)
    (clear pallet7)

    ;; hoist availability and holding status
    (hoist-available hoist0)
    (hoist-available hoist1)
    (hoist-available hoist2)
    (hoist-available hoist3)
    (hoist-available hoist4)
    (hoist-available hoist5)

    ;; no crates in trucks at start
    ;; (no in-truck facts)

    ;; (when crates are on surfaces we already set at-obj for crates above)
  )

  (:goal (and
    (on crate7 crate6)
    (on crate9 crate7)
    (on crate4 pallet0)
    (on crate6 pallet1)
    (on crate2 pallet3)
    (on crate5 pallet5)
    (on crate1 pallet8)
  ))

  (:metric minimize (total-time))
)