(define (domain orchestrator)
  (:requirements :typing :fluents :negative-preconditions)
  (:types object crate pallet truck hoist place)

  ;; Predicates
  (:predicates
    (at ?o - object ?p - place)        ; object (truck/hoist/pallet/crate) at place
    (on ?c - crate ?s - object)       ; crate on support (crate or pallet)
    (intruck ?c - crate ?t - truck)   ; crate inside truck
    (available ?h - hoist)            ; hoist is available (not holding)
    (holding ?h - hoist ?c - crate)   ; hoist is holding a crate
    (clear ?o - object)               ; object (crate or pallet) has no crate on top
  )

  ;; Numeric fluents / functions
  (:functions
    (current-load ?t - truck)
    (load-limit ?t - truck)
    (weight ?c - crate)
    (fuel-cost)
  )

  ;; Actions

  ;; Truck driving between any two places; costs 10 fuel.
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and (at ?t ?from))
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (increase (fuel-cost) 10)
    )
  )

  ;; Hoist lifts a clear crate from a support at the same place. Lifting costs 1 fuel.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (available ?h)
      (at ?h ?p)
      (at ?c ?p)
      (at ?s ?p)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at ?c ?p))
      (holding ?h ?c)
      (not (available ?h))
      (increase (fuel-cost) 1)
      ;; support becomes clear after removing the crate
      (clear ?s)
      ;; while held, crate is not at a place; it remains a surface (clear)
      (clear ?c)
    )
  )

  ;; Hoist puts a held crate down onto a support at same place. No extra fuel cost beyond lift.
  (:action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (on ?c ?s)
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; Hoist loads a held crate into a truck at same place, respecting numeric capacity constraints.
  ;; Note: the lift that produced holding should have already increased fuel-cost; loading itself
  ;; only updates truck load and crate-in-truck state.
  (:action hoist-put-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (holding ?h ?c)
      (at ?h ?p)
      (at ?tr ?p)
      ;; capacity constraint: current-load + weight(crate) <= load-limit
      (<= (+ (current-load ?tr) (weight ?c)) (load-limit ?tr))
    )
    :effect (and
      (not (holding ?h ?c))
      (available ?h)
      (intruck ?c ?tr)
      (increase (current-load ?tr) (weight ?c))
      ;; crate is now inside truck (not at place and not on any support)
      (not (clear ?c))
    )
  )

  ;; Hoist takes a crate out of a truck (requires hoist available and same place). Taking is a lift -> costs 1.
  (:action hoist-take-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (available ?h)
      (at ?h ?p)
      (at ?tr ?p)
      (intruck ?c ?tr)
    )
    :effect (and
      (not (intruck ?c ?tr))
      (holding ?h ?c)
      (not (available ?h))
      (decrease (current-load ?tr) (weight ?c))
      (increase (fuel-cost) 1)
      (clear ?c)
    )
  )
)