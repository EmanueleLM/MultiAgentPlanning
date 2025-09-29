(define (domain multi-agent-warehouse)
  (:requirements :typing :durative-actions :negative-preconditions :numeric-fluents :equality :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    object
    thing - object
    surface - object
    truck hoist - thing
    pallet crate - surface
    place
  )

  (:predicates
    (at ?e - object ?p - place)
    (on ?c - crate ?s - surface)
    (in ?c - crate ?t - truck)
    (clear ?s - surface)
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

  ;; trucks drive between places; while driving they are not at any place and not stationary
  (:durative-action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
      (at start (at ?tr ?from))
      (at start (stationary ?tr))
      (over all (forall (?c - crate) (not (in ?c ?tr))))
    )
    :effect (and
      (at start (not (at ?tr ?from)))
      (at start (not (stationary ?tr)))
      (at end (at ?tr ?to))
      (at end (stationary ?tr))
      (at end (increase (total-time) (/ (distance ?from ?to) (speed ?tr))))
    )
  )

  ;; hoist picks a crate from a surface (lift). After lift, hoist holds crate and surface becomes clear (if nothing remains on it).
  (:durative-action hoist-pick
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
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

  ;; hoist puts down a held crate onto a surface (putdown)
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
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

  ;; hoist loads a crate into a truck: requires hoist holding crate and both at same place and truck stationary for the whole action
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (at ?t ?p))
      (over all (at ?t ?p))
      (at start (stationary ?t))
      (over all (stationary ?t))
      (at start (holding ?h ?c))
      (over all (holding ?h ?c))
    )
    :effect (and
      (at end (in ?c ?t))
      (at end (not (holding ?h ?c)))
      (at end (empty ?h))
      (at end (not (at ?c ?p)))
      (at end (increase (total-time) (/ (weight ?c) (power ?h))))
    )
  )

  ;; hoist unloads a crate from a truck onto the hoist (hoist will be holding it at end)
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at ?h ?p))
      (over all (at ?h ?p))
      (at start (in ?c ?t))
      (at start (at ?t ?p))
      (at start (empty ?h))
      (at start (stationary ?t))
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