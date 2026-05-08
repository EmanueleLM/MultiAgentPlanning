(define (problem multiagent-hoist-truck-prob)
  (:domain multiagent-hoist-truck)

  ;; Objects
  (:objects
    ;; places
    depot0 depot1 depot2 - depot
    distributor0 - distributor

    ;; pallets
    pallet0 pallet1 pallet2 pallet3 - pallet

    ;; crates
    crate0 crate1 crate2 - crate

    ;; trucks
    truck0 truck1 truck2 - truck

    ;; hoists
    hoist0 hoist1 hoist2 hoist3 - hoist
  )

  ;; Initial state
  (:init
    ;; type predicates (explicit)
    (place depot0) (place depot1) (place depot2) (place distributor0)
    (depot depot0) (depot depot1) (depot depot2)
    (distributor distributor0)

    (surface_type pallet0) (surface_type pallet1) (surface_type pallet2) (surface_type pallet3)
    (pallet_type pallet0) (pallet_type pallet1) (pallet_type pallet2) (pallet_type pallet3)

    (surface_type crate0) (surface_type crate1) (surface_type crate2)
    (crate_type crate0) (crate_type crate1) (crate_type crate2)

    (truck_type truck0) (truck_type truck1) (truck_type truck2)
    (hoist_type hoist0) (hoist_type hoist1) (hoist_type hoist2) (hoist_type hoist3)

    ;; Locations (hoists, trucks, surfaces/pallets)
    (at hoist0 depot0)
    (at hoist1 depot1)
    (at hoist2 depot2)
    (at hoist3 distributor0)

    (at pallet0 depot0)
    (at pallet1 depot1)
    (at pallet2 depot2)
    (at pallet3 distributor0)

    (at truck0 depot2)
    (at truck1 depot2)
    (at truck2 depot1)

    ;; Initial stacking: crate0 on pallet2, crate1 on pallet1, crate2 on crate0
    (on crate0 pallet2)
    (on crate1 pallet1)
    (on crate2 crate0)

    ;; According to stacking, crates are located at same places as their supporting surfaces
    (at crate0 depot2)   ;; pallet2 at depot2
    (at crate2 depot2)   ;; crate2 on crate0 which is at depot2
    (at crate1 depot1)   ;; pallet1 at depot1

    ;; availability and clearance states (explicit per public info)
    (available hoist0) (available hoist1) (available hoist2) (available hoist3)

    (clear crate1) (clear crate2) (clear pallet0) (clear pallet3)
    ;; surfaces that have items on them are not listed as clear (pallet1 not clear, pallet2 not clear, crate0 not clear)

    ;; crate manipulation locks: crates start free (not being manipulated)
    (free crate0) (free crate1) (free crate2)

    ;; trucks are free (not locked for load/unload; required precondition for drive)
    (truck-free truck0) (truck-free truck1) (truck-free truck2)
  )

  ;; Goal: crate0 on pallet3, crate1 on crate2, crate2 on pallet2
  (:goal (and
    (on crate0 pallet3)
    (on crate1 crate2)
    (on crate2 pallet2)
  ))
)