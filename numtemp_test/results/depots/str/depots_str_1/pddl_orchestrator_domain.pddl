(define (domain hoist-truck-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist crate pallet)

  (:predicates
    (at ?o - (truck hoist pallet crate) ?p - place)        ; object is at place
    (on ?top - crate ?bottom - (crate pallet))             ; top crate is on bottom (crate or pallet)
    (in ?c - crate ?t - truck)                             ; crate is in truck
    (clear ?x - (crate pallet))                            ; nothing on top of x
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
  )

  ; Hoist lifts a crate from a surface (crate or pallet) at the same place
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?b - (crate pallet) ?p - place)
    :precondition (and
      (hoist-available ?h)
      (at ?h ?p)
      (on ?c ?b)
      (at ?b ?p)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?b))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
      (clear ?b)
      (not (at ?c ?p))
    )
  )

  ; Hoist drops the crate it is holding onto a surface at the same place
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?b - (crate pallet) ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (at ?h ?p)
      (at ?b ?p)
      (clear ?b)
    )
    :effect (and
      (on ?c ?b)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (at ?c ?p)
      (not (clear ?b))
      (clear ?c)
    )
  )

  ; Hoist lifts a crate from a truck (prepares for placing)
  (:action hoist-lift-from-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-available ?h)
      (at ?h ?p)
      (at ?t ?p)
      (in ?c ?t)
    )
    :effect (and
      (not (in ?c ?t))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
    )
  )

  ; Hoist loads the crate it is holding into a truck (truck must be at same place)
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (hoist-lifting ?h ?c)
      (at ?h ?p)
      (at ?t ?p)
    )
    :effect (and
      (in ?c ?t)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
      (not (at ?c ?p))
    )
  )

  ; Truck moves between places (trucks are the only objects that move between places)
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at ?tr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )
)