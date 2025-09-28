(define (domain orchestrator-domain)
  (:requirements :typing :fluents :negative-preconditions :numeric-fluents)
  (:types truck hoist pallet crate place)

  (:predicates
    ;; location predicates: any of truck/hoist/pallet/crate located at a place
    (at ?obj - (either truck hoist pallet crate) ?p - place)

    ;; stacking and containment
    (on ?c - crate ?surface - (either crate pallet))
    (in ?c - crate ?t - truck)

    ;; resource / status predicates
    (clear ?s - (either crate pallet))
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
  )

  (:functions
    (current-load ?t - truck) ;; numeric current load per truck
    (load-limit ?t - truck)   ;; numeric load capacity per truck
    (crate-weight ?c - crate) ;; numeric weight per crate
    (fuel-cost)               ;; global fuel cost to minimize
  )

  ;; Truck driving action (performed by trucks)
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (increase (fuel-cost) 10)
    )
  )

  ;; Hoist lifts a crate from a surface (crate or pallet) at the same place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?surface - (either crate pallet) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?surface ?p)      ;; the surface (pallet or supporting crate) is at that place
      (at ?c ?p)            ;; crate is also at that place
      (on ?c ?surface)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (on ?c ?surface))
      (holding ?h ?c)
      (not (available ?h))
      (clear ?surface)
      (not (clear ?c))
      (increase (fuel-cost) 1)
    )
  )

  ;; Hoist puts a held crate down onto a surface (crate or pallet) at the same place
  (:action hoist-put-down
    :parameters (?h - hoist ?c - crate ?surface - (either crate pallet) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?surface ?p)
      (holding ?h ?c)
      (clear ?surface)
    )
    :effect (and
      (on ?c ?surface)
      (not (holding ?h ?c))
      (available ?h)
      (clear ?c)
      (not (clear ?surface))
      (increase (fuel-cost) 1)
    )
  )

  ;; Hoist puts a held crate into a truck at the same place (subject to capacity)
  (:action hoist-put-in-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (at ?c ?p)
      (holding ?h ?c)
      ;; capacity constraint: current-load + crate-weight <= load-limit
      (<= (+ (current-load ?tr) (crate-weight ?c)) (load-limit ?tr))
    )
    :effect (and
      (in ?c ?tr)
      (not (holding ?h ?c))
      (available ?h)
      (increase (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
      (not (clear ?c))
    )
  )

  ;; Hoist takes a crate out of a truck (truck and hoist at same place)
  (:action hoist-take-out-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (in ?c ?tr)
      (available ?h)
    )
    :effect (and
      (not (in ?c ?tr))
      (holding ?h ?c)
      (not (available ?h))
      (decrease (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
    )
  )
)