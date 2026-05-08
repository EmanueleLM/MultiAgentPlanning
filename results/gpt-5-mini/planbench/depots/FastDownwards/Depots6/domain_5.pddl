(define (domain depots6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor
    surface pallet crate
    hoist truck
  )

  (:predicates
    ;; location predicates
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (at-surface ?s - surface ?p - place)  ;; surfaces (pallets and crates) are located at places

    ;; stacking / contents
    (on ?upper - crate ?lower - surface)   ;; crate on a surface (pallet or crate)
    (clear ?s - surface)                   ;; nothing on this surface

    ;; hoist state
    (hoist-free ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; truck contents
    (in-truck ?c - crate ?tr - truck)
  )

  ;; drive a truck between places (roads exist between any places)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (at-truck ?tr ?from)
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (hoist-free ?h)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (not (hoist-free ?h))
      (not (on ?c ?s))
      (not (at-surface ?c ?p))
      (clear ?s)
    )
  )

  ;; hoist drops a crate to a surface at a place
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
      (at-surface ?c ?p)
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
    )
  )

  ;; hoist loads a crate (currently lifted) into a truck at the same place
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-lifting ?h ?c))
      (hoist-free ?h)
    )
  )

  ;; hoist unloads a crate from a truck: hoist takes crate out of truck and holds it
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (hoist-free ?h)
      (in-truck ?c ?tr)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (not (hoist-free ?h))
      (hoist-lifting ?h ?c)
    )
  )
)