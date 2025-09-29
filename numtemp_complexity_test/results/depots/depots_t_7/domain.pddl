(define (domain multi-agent-temporal-logistics)
  (:requirements :typing :durative-actions :negative-preconditions :equality :numeric-fluents :duration-inequalities :conditional-effects :quantified-preconditions)
  (:types
    depot distributor - place
    truck hoist pallet crate - obj
    place
    obj
  )

  (:predicates
    (at ?x - obj ?p - place)
    (on ?c - crate ?s - obj)
    (in ?c - crate ?t - truck)
    (in-hoist ?c - crate ?h - hoist)
    (clear ?s - obj)
    (hoist-free ?h - hoist)
  )

  (:functions
    (distance ?p1 - place ?p2 - place)
    (speed ?t - truck)
    (power ?h - hoist)
    (weight ?c - crate)
  )

  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
      (at start (at ?tr ?from))
    )
    :effect (and
      (at start (not (at ?tr ?from)))
      (at end (at ?tr ?to))
    )
  )

  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?below - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (hoist-free ?h))
      (over all (at ?h ?p))
      (at start (on ?c ?below))
      (at start (at ?below ?p))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (on ?c ?below)))
      (at start (not (at ?c ?p)))
      (at start (not (clear ?c)))
      (at start (not (hoist-free ?h)))
      (at start (in-hoist ?c ?h))
      (at end (clear ?below))
    )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?below - obj ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (over all (in-hoist ?c ?h))
      (over all (at ?h ?p))
      (over all (at ?below ?p))
      (over all (clear ?below))
    )
    :effect (and
      (at end (not (in-hoist ?c ?h)))
      (at end (on ?c ?below))
      (at end (at ?c ?p))
      (at end (not (clear ?below)))
      (at end (clear ?c))
      (at end (hoist-free ?h))
    )
  )

  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?below - obj ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (over all (at ?h ?p))
      (at start (on ?c ?below))
      (at start (at ?below ?p))
      (at start (at ?tr ?p))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (on ?c ?below)))
      (at start (not (at ?c ?p)))
      (at start (not (clear ?c)))
      (at start (not (hoist-free ?h)))
      (at start (in-hoist ?c ?h))
      (at end (in ?c ?tr))
      (at end (clear ?below))
      (at end (not (in-hoist ?c ?h)))
      (at end (hoist-free ?h))
    )
  )

  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?below - obj ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (over all (at ?h ?p))
      (over all (at ?tr ?p))
      (at start (in ?c ?tr))
      (at start (at ?below ?p))
      (at start (clear ?below))
    )
    :effect (and
      (at start (not (in ?c ?tr)))
      (at start (not (hoist-free ?h)))
      (at start (in-hoist ?c ?h))
      (at end (on ?c ?below))
      (at end (at ?c ?p))
      (at end (not (in-hoist ?c ?h)))
      (at end (clear ?c))
      (at end (hoist-free ?h))
    )
  )
)