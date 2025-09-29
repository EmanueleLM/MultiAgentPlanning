(define (domain multi-agent-warehouse)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    truck hoist crate pallet place - entity
    entity
  )

  (:predicates
    (at ?e - entity ?p - place)
    (on ?c - crate ?s - entity)
    (in ?c - crate ?t - truck)
    (clear ?e - entity)
    (holding ?h - hoist ?c - crate)
    (empty ?h - hoist)
    (stationary ?t - truck)
  )

  (:functions
    (total-time)
    (distance ?p1 - place ?p2 - place)
    (speed ?tr - truck)
    (power ?h - hoist)
    (weight ?c - crate)
  )

  (:durative-action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
      (at start (at ?tr ?from))
      (at start (stationary ?tr))
    )
    :effect (and
      (at start (not (at ?tr ?from)))
      (at start (not (stationary ?tr)))
      (at end (at ?tr ?to))
      (at end (stationary ?tr))
      (at end (increase (total-time) (/ (distance ?from ?to) (speed ?tr))))
    )
  )

  (:durative-action hoist-pick
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (on ?c ?s))
      (at start (at ?s ?p))
      (at start (clear ?c))
      (at start (empty ?h))
    )
    :effect (and
      (at end (holding ?h ?c))
      (at end (not (empty ?h)))
      (at end (not (on ?c ?s)))
      (at end (clear ?s))
      (at end (not (at ?c ?p)))
      (at end (not (clear ?c)))
      (at end (increase (total-time) 1))
    )
  )

  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (holding ?h ?c))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at end (on ?c ?s))
      (at end (at ?c ?p))
      (at end (not (holding ?h ?c)))
      (at end (empty ?h))
      (at end (not (clear ?s)))
      (at end (clear ?c))
      (at end (increase (total-time) 1))
    )
  )

  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (holding ?h ?c))
      (at start (at ?t ?p))
      (over all (at ?t ?p))
      (over all (stationary ?t))
    )
    :effect (and
      (at end (in ?c ?t))
      (at end (not (holding ?h ?c)))
      (at end (empty ?h))
      (at end (increase (total-time) (/ (weight ?c) (power ?h))))
    )
  )

  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (in ?c ?t))
      (at start (at ?t ?p))
      (at start (empty ?h))
      (over all (at ?t ?p))
      (over all (stationary ?t))
    )
    :effect (and
      (at end (holding ?h ?c))
      (at end (not (in ?c ?t)))
      (at end (not (empty ?h)))
      (at end (increase (total-time) (/ (weight ?c) (power ?h))))
    )
  )

)