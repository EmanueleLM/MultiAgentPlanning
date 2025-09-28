(define (domain multi-agent-warehouse)
  (:requirements :typing :durative-actions :negative-preconditions :action-costs :conditional-effects :quantified-preconditions :disjunctive-preconditions :numeric-fluents)
  (:types
      truck hoist pallet crate place - obj
      obj
  )

  (:predicates
    (on ?c - crate ?s - obj)
    (clear ?o - obj)
    (hoist-holding ?h - hoist ?c - crate)
    (hoist-busy ?h - hoist)
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-obj ?o - obj ?p - place)
    (in-truck ?c - crate ?t - truck)
  )

  (:durative-action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
      (at start (at-truck ?tr ?from))
    )
    :effect (and
      (at start (not (at-truck ?tr ?from)))
      (at end (at-truck ?tr ?to))
    )
  )

  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (at-obj ?s ?p))
      (at start (on ?c ?s))
      (at start (clear ?c))
      (at start (not (hoist-busy ?h)))
      (over all (at-hoist ?h ?p))
    )
    :effect (and
      (at start (hoist-busy ?h))
      (at start (hoist-holding ?h ?c))
      (at start (not (on ?c ?s)))
      (at start (not (at-obj ?c ?p)))
      (at start (not (clear ?c)))
      (at start (clear ?s))
    )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (at-obj ?s ?p))
      (at start (clear ?s))
      (over all (at-hoist ?h ?p))
      (over all (hoist-busy ?h))
      (over all (hoist-holding ?h ?c))
    )
    :effect (and
      (at end (not (hoist-holding ?h ?c)))
      (at end (on ?c ?s))
      (at end (at-obj ?c ?p))
      (at end (not (clear ?s)))
      (at end (clear ?c))
      (at end (not (hoist-busy ?h)))
    )
  )

  (:durative-action hoist-load-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (at start (hoist-holding ?h ?c))
      (at start (hoist-busy ?h))
      (over all (hoist-holding ?h ?c))
      (over all (at-hoist ?h ?p))
      (over all (at-truck ?t ?p))
      (over all (hoist-busy ?h))
    )
    :effect (and
      (at end (not (hoist-holding ?h ?c)))
      (at end (in-truck ?c ?t))
      (at end (not (hoist-busy ?h)))
      (at end (not (at-obj ?c ?p)))
    )
  )

  (:durative-action hoist-unload-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration 4)
    :condition (and
      (at start (in-truck ?c ?t))
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (at start (not (hoist-busy ?h)))
      (over all (at-hoist ?h ?p))
      (over all (at-truck ?t ?p))
      (over all (hoist-busy ?h)) ; hoist stays busy during unload
    )
    :effect (and
      (at start (not (in-truck ?c ?t)))
      (at start (hoist-busy ?h))
      (at start (hoist-holding ?h ?c))
      (at end (not (hoist-busy ?h)))
    )
  )

)