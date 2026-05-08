(define (problem deliver-crate-example)
  (:domain truck-hoist-domain)
  (:objects
    ;; places
    depot1 depot2 - place

    ;; one truck
    truck1 - truck

    ;; one hoist
    hoist1 - hoist

    ;; one crate
    crate1 - crate

    ;; discrete slot(s) for truck capacity
    slot1 - slot
  )

  (:init
    ;; initial locations
    (truck-at truck1 depot1)
    (at crate1 depot1)
    (hoist-at hoist1 depot1)
    (hoist-free hoist1)

    ;; define slot on truck and its availability
    (slot-on-truck slot1 truck1)
    (slot-free slot1)
  )

  ;; Goal: crate1 must be at depot2 (so a load, drive, unload sequence is required).
  (:goal (and
    (at crate1 depot2)
  ))
)