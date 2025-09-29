(define (domain orchestrator-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :equality :numbers :derived-predicates)
  (:types
    hoist truck pallet crate place - object
    object
  )

  (:predicates
    (at ?o - object ?p - place)
    (on ?c - crate ?s - object)
    (in ?c - crate ?t - truck)
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)
    (clear ?s - object)
  )

  (:functions
    (dist ?from - place ?to - place) - number
    (speed ?t - truck) - number
    (power ?h - hoist) - number
    (weight ?c - crate) - number
  )

  ;; Truck driving: duration = distance(from,to) / speed(truck)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (dist ?from ?to) (speed ?tr)))
    :condition (and (at start (at ?tr ?from)))
    :effect (and
      (at start (not (at ?tr ?from)))
      (at end (at ?tr ?to))
    )
  )

  ;; Hoist lifts a crate from a surface into the hoist (short operation)
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (available ?h))
      (at start (at ?h ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (available ?h)))
      (at end (holding ?h ?c))
      (at end (not (on ?c ?s)))
      (at end (clear ?s))
    )
  )

  ;; Hoist puts a held crate down onto a surface (short operation)
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (holding ?h ?c))
      (at start (at ?h ?p))
      (at start (at ?s ?p))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (holding ?h ?c)))
      (at start (not (clear ?s)))
      (at end (on ?c ?s))
      (at end (available ?h))
      (at end (clear ?c))
    )
  )

  ;; Hoist loads a crate from a surface into a truck
  ;; Duration = weight(crate) / power(hoist)
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?s - object ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (available ?h))
      (at start (at ?h ?p))
      (at start (at ?s ?p))
      (at start (on ?c ?s))
      (at start (at ?tr ?p))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (available ?h)))
      (at start (not (on ?c ?s)))
      (at end (in ?c ?tr))
      (at end (available ?h))
      (at end (clear ?s))
    )
  )

  ;; Hoist unloads a crate from a truck onto a surface
  ;; Duration = weight(crate) / power(hoist)
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?s - object ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (available ?h))
      (at start (at ?h ?p))
      (at start (at ?s ?p))
      (at start (at ?tr ?p))
      (at start (in ?c ?tr))
      (at start (clear ?s))
    )
    :effect (and
      (at start (not (available ?h)))
      (at start (not (in ?c ?tr)))
      (at end (on ?c ?s))
      (at end (available ?h))
      (at end (not (clear ?s)))
      (at end (clear ?c))
    )
  )
)