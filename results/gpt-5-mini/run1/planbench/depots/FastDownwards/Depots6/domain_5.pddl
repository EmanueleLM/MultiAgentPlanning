(define (domain depots6)
  (:requirements :strips :typing)
  (:types
    place surface truck hoist
    depot distributor - place
    pallet crate - surface
  )

  (:predicates
    ;; locations
    (at-truck ?v - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?v - truck)

    ;; simple fluents
    (clear ?s - surface)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
  )

  ;; driving a truck between places (connectivity is complete in this instance)
  (:action drive
    :parameters (?v - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?v ?from)
    )
    :effect (and
      (not (at-truck ?v ?from))
      (at-truck ?v ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)        ;; hoist at same place as crate
      (at-surface ?c ?p)      ;; crate is at that place
      (at-surface ?s ?p)      ;; supporting surface is at that place
      (on ?c ?s)              ;; crate is on the surface
      (hoist-available ?h)
      (clear ?c)
    )
    :effect (and
      (not (at-surface ?c ?p))   ;; crate removed from place while lifted
      (not (on ?c ?s))           ;; crate removed from surface
      (hoist-lifting ?h ?c)
      (not (hoist-available ?h))
      (clear ?s)                 ;; supporting surface becomes clear
    )
  )

  ;; hoist drops a lifted crate to a surface at a place
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (at-surface ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  ;; hoist loads a currently-lifted crate into a truck at the same place
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?v - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?v ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?v)
      (hoist-available ?h)
      (not (hoist-lifting ?h ?c))
      (not (at-surface ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck (hoist becomes busy and holds the crate)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?v - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?v ?p)
      (hoist-available ?h)
      (in-truck ?c ?v)
    )
    :effect (and
      (not (in-truck ?c ?v))
      (not (hoist-available ?h))
      (hoist-lifting ?h ?c)
    )
  )
)