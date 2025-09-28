(define (domain multiagent-loading)
  (:requirements :strips :typing :negative-preconditions :equality
                 :durative-actions :numeric-fluents :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types place truck hoist surface pallet crate - surface)
  (:predicates
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at ?s - surface ?p - place)
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)
    (clear ?s - surface)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
    (occupied ?t - truck)
  )

  (:functions
    (weight ?c - crate)
    (power ?h - hoist)
    (speed-truck ?t - truck)
    (distance ?from - place ?to - place)
  )

  (:durative-action drive-truck
    :parameters (?t - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed-truck ?t)))
    :condition (and
      (at start (at-truck ?t ?from))
      (at start (not (occupied ?t)))
      (over all (at-truck ?t ?from))
      (over all (not (occupied ?t)))
    )
    :effect (and
      (at start (not (at-truck ?t ?from)))
      (at end (at-truck ?t ?to))
    )
  )

  (:durative-action lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (available ?h))
      (at start (clear ?c))
      (at start (not (holding ?h ?c)))
      (over all (at-hoist ?h ?p))
      (over all (at ?s ?p))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available ?h)))
      (at end (holding ?h ?c))
      (at end (clear ?s))
    )
  )

  (:durative-action putdown
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (holding ?h ?c))
      (at start (at-hoist ?h ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
      (over all (at-hoist ?h ?p))
      (over all (at ?s ?p))
    )
    :effect (and
      (at start (not (holding ?h ?c)))
      (at end (on ?c ?s))
      (at end (available ?h))
      (at end (clear ?c))
      (at end (not (clear ?s)))
    )
  )

  (:durative-action load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (holding ?h ?c))
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (at start (not (occupied ?t)))
      (over all (at-hoist ?h ?p))
      (over all (at-truck ?t ?p))
      (over all (not (occupied ?t)))
    )
    :effect (and
      (at start (not (holding ?h ?c)))
      (at start (occupied ?t))
      (at end (in-truck ?c ?t))
      (at end (available ?h))
      (at end (not (occupied ?t)))
    )
  )

  (:durative-action unload
    :parameters (?h - hoist ?c - crate ?t - truck ?s - surface ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (available ?h))
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (at ?s ?p))
      (at start (clear ?s))
      (at start (not (occupied ?t)))
      (over all (at-hoist ?h ?p))
      (over all (at-truck ?t ?p))
      (over all (at ?s ?p))
      (over all (not (occupied ?t)))
    )
    :effect (and
      (at start (not (available ?h)))
      (at start (occupied ?t))
      (at end (not (in-truck ?c ?t)))
      (at end (on ?c ?s))
      (at end (available ?h))
      (at end (not (clear ?s)))
      (at end (clear ?c))
      (at end (not (occupied ?t)))
    )
  )

)