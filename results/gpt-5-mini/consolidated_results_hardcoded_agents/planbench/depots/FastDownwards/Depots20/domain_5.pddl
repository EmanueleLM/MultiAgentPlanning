(define (domain depots-revised-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface
      pallet crate - surface
    hoist truck
    stage
  )

  (:predicates
    ;; global discrete stage token (enforces contiguous progression)
    (current-stage ?st - stage)
    (next ?s1 - stage ?s2 - stage)

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
  ;; Advances the global stage from ?st1 to its successor ?st2.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?st1 - stage ?st2 - stage)
    :precondition (and
                    (truck-at ?tr ?from)
                    (current-stage ?st1)
                    (next ?st1 ?st2)
                  )
    :effect (and
              (truck-at ?tr ?to)
              (not (truck-at ?tr ?from))
              (not (current-stage ?st1))
              (current-stage ?st2)
            )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Requires hoist and surface at same place, hoist available and crate clear.
  ;; Advances global stage.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?p - place ?srf - surface ?st1 - stage ?st2 - stage)
    :precondition (and
                    (hoist-at ?h ?p)
                    (on ?c ?srf)
                    (surface-at ?srf ?p)
                    (hoist-available ?h)
                    (crate-clear ?c)
                    (current-stage ?st1)
                    (next ?st1 ?st2)
                  )
    :effect (and
              (hoist-lifting ?h ?c)
              (not (on ?c ?srf))
              (not (hoist-available ?h))
              (surface-clear ?srf)
              (not (current-stage ?st1))
              (current-stage ?st2)
            )
  )

  ;; Hoist drops a crate to a surface at a place.
  ;; Requires hoist is lifting the crate and surface is clear; advances stage.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?p - place ?srf - surface ?st1 - stage ?st2 - stage)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?srf ?p)
                    (surface-clear ?srf)
                    (hoist-lifting ?h ?c)
                    (current-stage ?st1)
                    (next ?st1 ?st2)
                  )
    :effect (and
              (on ?c ?srf)
              (crate-clear ?c)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
              (not (surface-clear ?srf))
              (not (current-stage ?st1))
              (current-stage ?st2)
            )
  )

  ;; Hoist loads a crate into a truck at a place.
  ;; Requires hoist is lifting the crate and truck at same place; advances stage.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (hoist-lifting ?h ?c)
                    (current-stage ?st1)
                    (next ?st1 ?st2)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
              (not (current-stage ?st1))
              (current-stage ?st2)
            )
  )

  ;; Hoist unloads a crate from a truck at a place.
  ;; Requires hoist available and crate in the truck; advances stage.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (hoist-available ?h)
                    (in-truck ?c ?tr)
                    (current-stage ?st1)
                    (next ?st1 ?st2)
                  )
    :effect (and
              (hoist-lifting ?h ?c)
              (not (in-truck ?c ?tr))
              (not (hoist-available ?h))
              (not (current-stage ?st1))
              (current-stage ?st2)
            )
  )
)