(define (domain orchestrator-domain)
  (:requirements :strips :typing :durative-actions :negative-preconditions :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    crate pallet truck hoist place - object
    object
  )

  (:predicates
    (at ?o - object ?p - place)
    (on ?c - crate ?s - object) ; crates can be on pallets or other crates
    (in_truck ?c - crate ?t - truck)
    (clear ?s - object)
    (available ?h - hoist)
    (lifting ?h - hoist ?c - crate)
  )

  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration 10)
    :condition (and
                 (at start (at ?tr ?from))
               )
    :effect (and
             (at start (not (at ?tr ?from)))
             (at end (at ?tr ?to))
            )
  )

  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?s ?p))
                 (at start (at ?c ?p))
                 (at start (on ?c ?s))
                 (at start (clear ?c))
                 (at start (available ?h))
               )
    :effect (and
             (at start (not (on ?c ?s)))
             (at start (not (available ?h)))
             (at start (lifting ?h ?c))
             (at start (not (at ?c ?p)))
             (at start (not (clear ?c)))
             (at start (clear ?s))
            )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
                 (at start (at ?h ?p))
                 (over all (lifting ?h ?c))
                 (at start (at ?s ?p))
                 (over all (clear ?s))
               )
    :effect (and
             (at end (on ?c ?s))
             (at end (at ?c ?p))
             (at end (not (clear ?s)))
             (at end (available ?h))
             (at end (not (lifting ?h ?c)))
             (at end (clear ?c))
            )
  )

  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?s - object ?t - truck ?p - place)
    :duration (= ?duration 3)
    :condition (and
                 (at start (at ?h ?p))
                 (over all (lifting ?h ?c))
                 (at start (at ?t ?p))
                 (at start (at ?s ?p))
               )
    :effect (and
             (at end (in_truck ?c ?t))
             (at end (available ?h))
             (at end (not (lifting ?h ?c)))
             (at end (clear ?s))
             (at end (not (at ?c ?p)))
            )
  )

  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?s - object ?p - place)
    :duration (= ?duration 4)
    :condition (and
                 (at start (at ?h ?p))
                 (at start (at ?t ?p))
                 (at start (at ?s ?p))
                 (at start (in_truck ?c ?t))
                 (at start (clear ?s))
                 (at start (available ?h))
               )
    :effect (and
             (at start (not (in_truck ?c ?t)))
             (at start (not (available ?h)))
             (at start (lifting ?h ?c))
             (at start (not (at ?c ?p)))
             (at end (on ?c ?s))
             (at end (at ?c ?p))
             (at end (not (clear ?s)))
             (at end (available ?h))
             (at end (not (lifting ?h ?c)))
            )
  )
)