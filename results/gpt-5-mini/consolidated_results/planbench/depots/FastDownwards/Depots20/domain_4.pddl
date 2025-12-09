(define (domain depots-revised)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
    pallet crate - surface
    hoist truck
  )

  (:predicates
    ;; positions
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?tr - truck ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)        ;; crate is on a surface (pallet or crate)
    (in-truck ?c - crate ?tr - truck)  ;; crate is inside/on a truck

    ;; availability / clear / lifting
    (surface-clear ?s - surface)
    (crate-clear ?c - crate)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)
  )

  ;; Drive a truck from one place to another.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (truck-at ?tr ?from)
    :effect (and
              (truck-at ?tr ?to)
              (not (truck-at ?tr ?from))
            )
  )

  ;; Hoist lifts a crate from a surface at a place.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?p - place ?srf - surface)
    :precondition (and
                    (hoist-at ?h ?p)
                    (on ?c ?srf)
                    (surface-at ?srf ?p)
                    (hoist-available ?h)
                    (crate-clear ?c)
                  )
    :effect (and
              (hoist-lifting ?h ?c)
              (not (on ?c ?srf))
              (not (hoist-available ?h))
              (surface-clear ?srf)
            )
  )

  ;; Hoist drops a crate to a surface at a place.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?p - place ?srf - surface)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?srf ?p)
                    (surface-clear ?srf)
                    (hoist-lifting ?h ?c)
                  )
    :effect (and
              (on ?c ?srf)
              (crate-clear ?c)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
              (not (surface-clear ?srf))
            )
  )

  ;; Hoist loads a crate into a truck at a place.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (hoist-lifting ?h ?c)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
            )
  )

  ;; Hoist unloads a crate from a truck at a place.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (hoist-available ?h)
                    (in-truck ?c ?tr)
                  )
    :effect (and
              (hoist-lifting ?h ?c)
              (not (in-truck ?c ?tr))
              (not (hoist-available ?h))
            )
  )
)