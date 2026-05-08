(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types place truck hoist surface crate pallet - surface)

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist  ?h - hoist  ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?tr - truck)

    ;; hoist state
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; surface / crate clearance (nothing on top)
    (clear ?s - surface)
  )

  ;; drive: move a truck from one place to another
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; hoist-lift: hoist lifts a crate from a surface at a place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-available ?h)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
    )
    :effect (and
      (not (on ?c ?s))
      (not (at-surface ?c ?p))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)
    )
  )

  ;; hoist-drop: hoist drops a lifted crate onto a surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-lifting ?h ?c)
      (at-surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (at-surface ?c ?p)
      (clear ?c)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (clear ?s))
    )
  )

  ;; hoist-load: hoist places a lifted crate into a truck at the same place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-lifting ?h ?c)
      (at-truck ?tr ?p)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-available ?h)
    )
  )

  ;; hoist-unload: hoist removes a crate from a truck and begins lifting it
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (hoist-available ?h)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
    )
  )
)