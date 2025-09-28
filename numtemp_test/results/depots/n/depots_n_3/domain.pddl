(define (domain trucks-hoists-crates)
  (:requirements :typing :negative-preconditions :equality :numeric-fluents :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types place truck hoist crate pallet)

  (:predicates
    (at ?o - (either truck hoist pallet crate) ?p - place)
    (on ?c - crate ?s - (either crate pallet))
    (in ?c - crate ?t - truck)
    (clear ?s - (either crate pallet))
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
    (lifted-from ?h - hoist ?s - (either crate pallet truck))
  )

  (:functions
    (current-load ?t - truck)
    (load-limit ?t - truck)
    (crate-weight ?c - crate)
    (fuel-cost)
  )

  ;; drive action by trucks
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (increase (fuel-cost) 10)
    )
  )

  ;; hoist lifts a crate from a support surface at a place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (at ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (available ?h)
    )
    :effect (and
      (not (on ?c ?s))
      (lifting ?h ?c)
      (not (available ?h))
      (clear ?s)
      (not (clear ?c))
      (not (at ?c ?p))
      (lifted-from ?h ?s)
      (increase (fuel-cost) 1)
    )
  )

  ;; hoist puts down a lifted crate onto a support at the same place
  ;; prevent putting back onto the same surface it was lifted from
  (:action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - (either crate pallet) ?orig - (either crate pallet truck) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?s ?p)
      (lifting ?h ?c)
      (clear ?s)
      (lifted-from ?h ?orig)
      (not (= ?orig ?s))
    )
    :effect (and
      (on ?c ?s)
      (at ?c ?p)
      (not (lifting ?h ?c))
      (available ?h)
      (clear ?c)
      (not (clear ?s))
      (not (lifted-from ?h ?orig))
      (increase (fuel-cost) 1)
    )
  )

  ;; hoist loads a lifted crate into a truck (truck must be at same place)
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?orig - (either crate pallet truck) ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (lifting ?h ?c)
      (lifted-from ?h ?orig)
      (<= (+ (current-load ?tr) (crate-weight ?c)) (load-limit ?tr))
    )
    :effect (and
      (in ?c ?tr)
      (not (lifting ?h ?c))
      (available ?h)
      (increase (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
      (not (at ?c ?p))
      (not (clear ?c))
      (not (lifted-from ?h ?orig))
    )
  )

  ;; hoist unloads a crate from a truck (truck must be at same place)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at ?h ?p)
      (at ?tr ?p)
      (in ?c ?tr)
      (available ?h)
    )
    :effect (and
      (not (in ?c ?tr))
      (lifting ?h ?c)
      (not (available ?h))
      (decrease (current-load ?tr) (crate-weight ?c))
      (increase (fuel-cost) 1)
      (at ?c ?p)
      (not (clear ?c))
      (lifted-from ?h ?tr)
    )
  )
)