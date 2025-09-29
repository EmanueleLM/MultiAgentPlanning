(define (domain multiagent-logistics)
  (:requirements :typing :durative-actions :negative-preconditions :fluents :numeric-fluents :universal-preconditions)
  (:types
    truck hoist crate pallet place - obj
    obj
  )

  (:predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pl - pallet ?p - place)
    (at-crate ?c - crate ?p - place)
    (on ?c - crate ?s - obj)            ; crate on a pallet or crate
    (in-truck ?c - crate ?t - truck)
    (available ?h - hoist)
    (clear ?s - obj)                    ; top surface (crate or pallet) is clear
    (carrying ?h - hoist ?c - crate)
  )

  (:functions
    (distance ?p1 - place ?p2 - place) - number
    (speed ?tr - truck) - number
    (power ?h - hoist) - number
    (weight ?c - crate) - number
    (total-time) - number
  )

  ; Drive action for trucks. Duration = distance(from,to)/speed(truck)
  (:durative-action drive
    :parameters (?tr - truck ?from - place ?to - place ?dur - number)
    :duration (= ?dur (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
      (at start (at-truck ?tr ?from))
    )
    :effect (and
      (at start (not (at-truck ?tr ?from)))
      (at end (at-truck ?tr ?to))
      (at end (increase (total-time) ?dur))
    )
  )

  ; Hoist lifts a crate from a surface (pallet or crate) into its grasp.
  ; Duration = 1. Hoist becomes busy (not available) at start; carrying becomes true at end.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - obj ?p - place ?dur - number)
    :duration (= ?dur 1)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (on ?c ?s))
      (at start (clear ?c))
      (at start (available ?h))
      (at start
        (or
          (at-pallet ?s ?p)
          (at-crate ?s ?p)
        )
      )
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available ?h)))
      (at end (carrying ?h ?c))
      (at end (increase (total-time) ?dur))
      ; After lifting the supporting surface becomes clear (crate was top) 
      (at end (clear ?s))
    )
  )

  ; Hoist puts the carried crate down onto a target surface (pallet or crate).
  ; Duration = 1. Hoist becomes available at end.
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s2 - obj ?p - place ?dur - number)
    :duration (= ?dur 1)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (carrying ?h ?c))
      (at start
        (or
          (at-pallet ?s2 ?p)
          (at-crate ?s2 ?p)
        )
      )
      (at start (clear ?s2))
    )
    :effect (and
      (at start (not (carrying ?h ?c)))
      (at end (on ?c ?s2))
      (at end (clear ?c))
      (at end (not (clear ?s2)))
      (at end (available ?h))
      (at end (increase (total-time) ?dur))
    )
  )

  ; Hoist loads a carried crate into a truck at the same place.
  ; Duration = weight(crate)/power(hoist). Hoist becomes available at end.
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?dur - number)
    :duration (= ?dur (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (carrying ?h ?c))
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
    )
    :effect (and
      (at start (not (carrying ?h ?c)))
      (at end (in-truck ?c ?t))
      (at end (available ?h))
      (at end (increase (total-time) ?dur))
    )
  )

  ; Hoist unloads a crate from a truck onto a surface at the same place.
  ; Duration = weight(crate)/power(hoist). Hoist becomes available at end.
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?s - obj ?p - place ?dur - number)
    :duration (= ?dur (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (available ?h))
      (at start (clear ?s))
      (at start
        (or
          (at-pallet ?s ?p)
          (at-crate ?s ?p)
        )
      )
    )
    :effect (and
      (at start (not (in-truck ?c ?t)))
      (at start (not (available ?h)))
      (at end (on ?c ?s))
      (at end (clear ?c))
      (at end (not (clear ?s)))
      (at end (available ?h))
      (at end (increase (total-time) ?dur))
    )
  )
)