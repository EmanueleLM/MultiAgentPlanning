(define (domain depots10)
  (:requirements :strips :typing)
  (:types
    place
    depot distributor - place
    surface
    pallet crate - surface
    truck
    hoist
  )

  (:predicates
    ;; locations
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?tr - truck ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; crate relations
    (at ?c - crate ?p - place)        ;; crate is located at a place (when resting or when on a surface at that place)
    (on ?c - crate ?s - surface)     ;; crate is directly on a surface (pallet or another crate)
    (clear ?s - surface)             ;; a surface (pallet or crate) has nothing on it

    ;; hoist state
    (available ?h - hoist)           ;; hoist is free to use
    (hoist-lifting ?h - hoist ?c - crate) ;; hoist is currently lifting this crate

    ;; truck contents
    (in ?c - crate ?tr - truck)
  )

  ;; drive a truck between places (trucks can drive between any two places)
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (truck-at ?tr ?from)
    )
    :effect (and
      (not (truck-at ?tr ?from))
      (truck-at ?tr ?to)
    )
  )

  ;; hoist lifts a crate from a surface at a place
  (:action hoist-lift-from-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (hoist-lifting ?h ?c)
      (not (available ?h))
      (not (on ?c ?s))
      (clear ?s)
      (not (at ?c ?p))
    )
  )

  ;; hoist drops a lifted crate to a surface at a place
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (available ?h)
      (not (hoist-lifting ?h ?c))
      (at ?c ?p)
      (not (clear ?s))
      (clear ?c)
      (on ?c ?s)
    )
  )

  ;; hoist loads a lifted crate into a truck at the same place
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (hoist-lifting ?h ?c)
    )
    :effect (and
      (in ?c ?tr)
      (available ?h)
      (not (hoist-lifting ?h ?c))
      (not (at ?c ?p))
    )
  )

  ;; hoist unloads a crate from a truck: hoist becomes busy and lifts the crate (crate removed from truck)
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
      (hoist-at ?h ?p)
      (truck-at ?tr ?p)
      (available ?h)
      (in ?c ?tr)
    )
    :effect (and
      (not (in ?c ?tr))
      (not (available ?h))
      (hoist-lifting ?h ?c)
    )
  )
)