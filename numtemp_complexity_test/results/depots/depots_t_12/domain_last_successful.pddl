(define (domain hoist-truck-temporal)
  (:requirements :typing :durative-actions :negative-preconditions :equality :numeric-fluents :conditional-effects)
  (:types
    crate pallet - surface
    truck hoist - agent
    place - location
    surface agent location
  )

  (:predicates
    (at-truck ?t - truck ?p - place)
    (at-pallet ?pobj - pallet ?pl - place)
    (hoist-at ?h - hoist ?p - place)
    (available ?h - hoist)
    (on ?c - crate ?s - pallet)
    (in ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)
    (clear ?s - surface)
  )

  (:functions
    (speed ?t - truck)
    (power ?h - hoist)
    (weight ?c - crate)
    (distance ?p1 - place ?p2 - place)
    (total-time)
  )

  ; Drive action for trucks: duration = distance(from,to)/speed(truck)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
                (at start (at-truck ?tr ?from))
               )
    :effect (and
             (at start (not (at-truck ?tr ?from)))
             (at end (at-truck ?tr ?to))
             (at end (increase (total-time) (/ (distance ?from ?to) (speed ?tr))))
            )
  )

  ; Hoist lifts a crate from a pallet to hoist: fixed short lift duration = 1
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?p - pallet ?place - place)
    :duration (= ?duration 1)
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at-pallet ?p ?place))
                (at start (on ?c ?p))
                (at start (available ?h))
                (at start (clear ?c))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at start (not (on ?c ?p)))
             (at start (clear ?p))
             (at end (holding ?h ?c))
             (at end (not (clear ?c)))
             (at end (increase (total-time) 1))
             (at end (available ?h))
            )
  )

  ; Hoist puts down a crate from its holding to a pallet
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?p - pallet ?place - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at-pallet ?p ?place))
                (at start (holding ?h ?c))
                (at start (available ?h))
                (at start (clear ?p))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at end (on ?c ?p))
             (at end (not (holding ?h ?c)))
             (at end (not (clear ?p)))
             (at end (clear ?c))
             (at end (increase (total-time) (/ (weight ?c) (power ?h))))
             (at end (available ?h))
            )
  )

  ; Hoist loads a crate from hoist into a truck (crate -> truck)
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?place - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at-truck ?t ?place))
                (at start (holding ?h ?c))
                (at start (available ?h))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at end (in ?c ?t))
             (at end (not (holding ?h ?c)))
             (at end (clear ?c))
             (at end (increase (total-time) (/ (weight ?c) (power ?h))))
             (at end (available ?h))
            )
  )

  ; Hoist unloads a crate from truck into hoist (truck -> hoist)
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?place - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
                (at start (hoist-at ?h ?place))
                (at start (at-truck ?t ?place))
                (at start (in ?c ?t))
                (at start (available ?h))
                (over all (hoist-at ?h ?place))
               )
    :effect (and
             (at start (not (available ?h)))
             (at end (holding ?h ?c))
             (at end (not (in ?c ?t)))
             (at end (not (clear ?c)))
             (at end (increase (total-time) (/ (weight ?c) (power ?h))))
             (at end (available ?h))
            )
  )
)