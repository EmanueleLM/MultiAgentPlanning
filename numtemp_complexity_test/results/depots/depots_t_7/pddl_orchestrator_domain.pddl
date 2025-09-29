(define (domain multi-agent-temporal-logistics)
  (:requirements :typing :fluents :durative-actions :negative-preconditions :numeric-fluents :duration-inequalities)
  (:types
    depot distributor - place
    place
    truck hoist pallet crate - obj
    obj
  )

  (:predicates
    (at ?x - (either truck hoist pallet) ?p - place)
    (on ?c - crate ?s - (either pallet crate))
    (in ?c - crate ?t - truck)
    (in-hoist ?c - crate ?h - hoist)
    (clear ?s - (either pallet crate))
    (hoist-free ?h - hoist)
  )

  (:functions
    (distance ?p1 - place ?p2 - place) ; directed distances
    (speed ?t - truck)
    (power ?h - hoist)
    (weight ?c - crate)
  )

  ; TRUCK DRIVE action (applies to any truck)
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

  ; HOIST LIFT: pick a crate from a surface into the hoist hook (short fixed duration)
  (:durative-action hoist-lift
    :parameters (?h - hoist ?c - crate ?below - (either pallet crate) ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (hoist-free ?h))
      (at start (at ?h ?p))
      (at start (on ?c ?below))
      (at start (at ?below ?p))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (on ?c ?below)))
      (at start (not (clear ?c)))
      (at start (not (hoist-free ?h)))
      (at start (in-hoist ?c ?h))
      (at end (clear ?below))
    )
  )

  ; HOIST PUTDOWN: place a crate from hoist onto a surface (short fixed duration)
  (:durative-action hoist-putdown
    :parameters (?h - hoist ?c - crate ?below - (either pallet crate) ?p - place)
    :duration (= ?duration 1)
    :condition (and
      (at start (in-hoist ?c ?h))
      (at start (at ?h ?p))
      (at start (at ?below ?p))
      (at start (clear ?below))
    )
    :effect (and
      (at start (not (in-hoist ?c ?h)))
      (at start (not (clear ?below)))
      (at start (on ?c ?below))
      (at end (clear ?c))
      (at end (hoist-free ?h))
    )
  )

  ; HOIST LOAD: move a crate from a surface into a truck (duration depends on weight and hoist power)
  (:durative-action hoist-load
    :parameters (?h - hoist ?c - crate ?below - (either pallet crate) ?tr - truck ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (at start (at ?h ?p))
      (at start (on ?c ?below))
      (at start (at ?below ?p))
      (at start (at ?tr ?p))
      (at start (clear ?c))
    )
    :effect (and
      (at start (not (on ?c ?below)))
      (at start (not (clear ?c)))
      (at start (not (hoist-free ?h)))
      (at start (in-hoist ?c ?h))
      (at end (in ?c ?tr))
      (at end (clear ?below))
      (at end (not (in-hoist ?c ?h)))
      (at end (hoist-free ?h))
    )
  )

  ; HOIST UNLOAD: move a crate from a truck to a surface (duration depends on weight and hoist power)
  (:durative-action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?below - (either pallet crate) ?p - place)
    :duration (= ?duration (/ (weight ?c) (power ?h)))
    :condition (and
      (at start (hoist-free ?h))
      (at start (at ?h ?p))
      (at start (at ?tr ?p))
      (at start (in ?c ?tr))
      (at start (at ?below ?p))
      (at start (clear ?below))
    )
    :effect (and
      (at start (not (in ?c ?tr)))
      (at start (not (hoist-free ?h)))
      (at start (in-hoist ?c ?h))
      (at end (on ?c ?below))
      (at end (not (in-hoist ?c ?h)))
      (at end (clear ?c))
      (at end (hoist-free ?h))
    )
  )
)