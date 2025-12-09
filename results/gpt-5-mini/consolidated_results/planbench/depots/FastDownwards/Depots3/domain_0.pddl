(define (domain depot-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types place hoist truck crate surface)

  (:predicates
    ;; location predicates
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; object placement and containment
    (on ?c - crate ?s - surface)        ; crate is on a surface/pallet
    (in-truck ?c - crate ?t - truck)   ; crate is inside truck
    (holding ?h - hoist ?c - crate)     ; hoist holds crate

    ;; resource availability and clear predicates
    (available ?h - hoist)              ; hoist free (not holding)
    (clear-surface ?s - surface)        ; surface has no crate on it
    (clear-crate ?c - crate)            ; crate has nothing on top
    (connected ?p1 - place ?p2 - place) ; road connectivity (directed)
  )

  ;; hoist lifts a crate off a surface (all at same place P)
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear-crate ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (clear-surface ?s)
      (not (on ?c ?s))
      (not (available ?h))
    )
  )

  ;; hoist drops its held crate onto a surface (all at same place P)
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (clear-surface ?s)
    )
    :effect (and
      (on ?c ?s)
      (available ?h)
      (clear-crate ?c)
      (not (holding ?h ?c))
      (not (clear-surface ?s))
    )
  )

  ;; hoist places a held crate into a co-located truck (all at P)
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (available ?h)
      (not (holding ?h ?c))
    )
  )

  ;; hoist removes a crate from a co-located truck and holds it (all at P)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (available ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (available ?h))
    )
  )

  ;; drive truck between places (requires direct connectivity). Containers in-truck remain in-truck.
  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?t ?from)
      (connected ?from ?to)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )
)