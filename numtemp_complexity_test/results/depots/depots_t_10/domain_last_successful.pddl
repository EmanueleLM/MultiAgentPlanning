(define (domain multiagent-logistics)
  (:requirements :strips :typing :negative-preconditions :equality :durative-actions :numeric-fluents :conditional-effects :quantified-preconditions :disjunctive-preconditions)
  (:types
    truck hoist crate pallet place - object
  )

  (:predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-pallet ?pl - pallet ?p - place)
    (at-crate ?c - crate ?p - place)
    (at ?o - object ?p - place)           ; generic at for surfaces (pallets/crates) and others
    (on ?c - crate ?s - object)           ; crate on a pallet or crate
    (in-truck ?c - crate ?t - truck)
    (available ?h - hoist)
    (clear ?s - object)                   ; top surface (crate or pallet) is clear
    (carrying ?h - hoist ?c - crate)
    (truck-busy ?t - truck)            ; truck is occupied (cannot drive) during load/unload
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
    :parameters (?tr - truck ?from - place ?to - place)
    :duration (= ?duration (/ (distance ?from ?to) (speed ?tr)))
    :condition (and
      (at start (at-truck ?tr ?from))
      (over all (not (truck-busy ?tr)))
    )
    :effect (and
      (at start (not (at-truck ?tr ?from)))
      (at end (at-truck ?tr ?to))
      (at end (increase (total-time) (/ (distance ?from ?to) (speed ?tr))))
    )
  )

  ; Hoist lifts a crate from a surface (pallet or crate) into its grasp.
  ; Duration = 1. Hoist becomes busy (not available) at start; carrying becomes true at end.
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (on ?c ?s))
      (at start (clear ?c))
      (at start (available ?h))
      (at start (at ?s ?p))
      ; ensure the supporting surface stays at the place during lift
      (over all (at ?s ?p))
    )
    :effect (and
      (at start (not (on ?c ?s)))
      (at start (not (available ?h)))
      ; remove ground location of crate at lift start
      (at start (not (at-crate ?c ?p)))
      (at start (not (at ?c ?p)))
      (at end (carrying ?h ?c))
      (at end (increase (total-time) 1))
      ; After lifting the supporting surface becomes clear (crate was top)
      (at end (clear ?s))
    )
  )

  ; Hoist puts the carried crate down onto a target surface (pallet or crate).
  ; Duration = 1. Hoist becomes available at end.
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?s2 - object ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (carrying ?h ?c))
      (at start (at ?s2 ?p))
      (at start (clear ?s2))
      (over all (at ?s2 ?p)) ; ensure target surface remains at place throughout
      ; ensure no hoist is carrying the target surface (if it's a crate)
      (forall (?hh - hoist)
        (not (carrying ?hh ?s2))
      )
    )
    :effect (and
      (at start (not (carrying ?h ?c)))
      (at end (on ?c ?s2))
      (at end (clear ?c))
      (at end (not (clear ?s2)))
      (at end (available ?h))
      (at end (increase (total-time) 1))
      ; add ground location facts for the crate at end
      (at end (at-crate ?c ?p))
      (at end (at ?c ?p))
    )
  )

  ; Hoist loads a carried crate into a truck at the same place.
  ; Duration = weight(crate)/power(hoist). Hoist becomes available at end.
  ; Truck becomes busy for the duration (cannot drive).
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (carrying ?h ?c))
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      ; ensure truck not busy at start and stays available for duration except we mark busy
      (over all (not (truck-busy ?t)))
    )
    :effect (and
      (at start (not (carrying ?h ?c)))
      (at start (truck-busy ?t))
      (at start (not (at-crate ?c ?p))) ; crate no longer on ground
      (at start (not (at ?c ?p)))
      (at end (in-truck ?c ?t))
      (at end (available ?h))
      (at end (not (truck-busy ?t)))
      (at end (increase (total-time) (/ (weight ?c) (power ?h))))
    )
  )

  ; Hoist unloads a crate from a truck onto a surface at the same place.
  ; Duration = weight(crate)/power(hoist). Hoist becomes available at end.
  ; At start the hoist takes the crate into its grasp (carrying) and the truck becomes busy for the duration.
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?s - object ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (at-hoist ?h ?p))
      (at start (at-truck ?t ?p))
      (at start (in-truck ?c ?t))
      (at start (available ?h))
      (at start (clear ?s))
      (at start (at ?s ?p))
      (over all (at ?s ?p)) ; ensure target surface stays at place during unload
      (over all (not (in-truck ?c ?t))) ; ensure crate is taken into grasp at start and removed from truck for duration
    )
    :effect (and
      (at start (not (in-truck ?c ?t)))
      (at start (not (available ?h)))
      (at start (carrying ?h ?c))
      (at start (truck-busy ?t))
      (at end (on ?c ?s))
      (at end (clear ?c))
      (at end (not (clear ?s)))
      (at end (available ?h))
      (at end (not (truck-busy ?t)))
      (at end (increase (total-time) (/ (weight ?c) (power ?h))))
      ; add ground location facts for crate at end
      (at end (at-crate ?c ?p))
      (at end (at ?c ?p))
    )
  )
)