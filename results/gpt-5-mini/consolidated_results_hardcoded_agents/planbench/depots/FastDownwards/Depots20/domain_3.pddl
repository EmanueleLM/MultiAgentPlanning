(define (domain depots-revised)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    surface pallet crate
    hoist truck
    step
  )

  (:predicates
    ;; positions
    (hoist-at ?h - hoist ?p - place)
    (truck-at ?tr - truck ?p - place)
    (crate-at ?c - crate ?p - place)
    (surface-at ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)        ;; crate is on a surface (pallet or crate)
    (in-truck ?c - crate ?tr - truck)  ;; crate is inside/on a truck

    ;; availability / clear / lifting
    (surface-clear ?s - surface)
    (crate-clear ?c - crate)
    (hoist-available ?h - hoist)
    (hoist-lifting ?h - hoist ?c - crate)

    ;; explicit ordered steps (linear timeline)
    (step-next ?s1 - step ?s2 - step)
    (step-done ?s - step)
  )

  ;; Drive a truck from one place to another.
  ;; Uses step tokens to enforce a single action per stage and linear progression.
  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?sprev - step ?s - step)
    :precondition (and
                    (truck-at ?tr ?from)
                    (step-next ?sprev ?s)
                    (step-done ?sprev)
                  )
    :effect (and
              (truck-at ?tr ?to)
              (not (truck-at ?tr ?from))
              (not (step-done ?sprev))
              (step-done ?s)
            )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Preconditions: hoist and crate co-located, hoist available, crate clear, crate on the surface at same place, and timeline.
  ;; Effects: hoist holds crate, crate removed from place and surface, hoist becomes unavailable, surface becomes clear, advance timeline.
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?p - place ?srf - surface ?sprev - step ?s - step)
    :precondition (and
                    (hoist-at ?h ?p)
                    (crate-at ?c ?p)
                    (on ?c ?srf)
                    (surface-at ?srf ?p)
                    (hoist-available ?h)
                    (crate-clear ?c)
                    (step-next ?sprev ?s)
                    (step-done ?sprev)
                  )
    :effect (and
              (hoist-lifting ?h ?c)
              (not (crate-at ?c ?p))
              (not (on ?c ?srf))
              (not (hoist-available ?h))
              (surface-clear ?srf)
              (not (step-done ?sprev))
              (step-done ?s)
            )
  )

  ;; Hoist drops a crate to a surface at a place.
  ;; Preconditions: hoist and surface at same place, surface clear, hoist is lifting the crate, and timeline.
  ;; Effects: crate at place and on surface, crate becomes clear, hoist available, hoist no longer lifting, surface no longer clear, advance timeline.
  (:action hoist-drop-to-surface
    :parameters (?h - hoist ?c - crate ?p - place ?srf - surface ?sprev - step ?s - step)
    :precondition (and
                    (hoist-at ?h ?p)
                    (surface-at ?srf ?p)
                    (surface-clear ?srf)
                    (hoist-lifting ?h ?c)
                    (step-next ?sprev ?s)
                    (step-done ?sprev)
                  )
    :effect (and
              (crate-at ?c ?p)
              (on ?c ?srf)
              (crate-clear ?c)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
              (not (surface-clear ?srf))
              (not (step-done ?sprev))
              (step-done ?s)
            )
  )

  ;; Hoist loads a crate into a truck at a place.
  ;; Preconditions: hoist and truck co-located with place, hoist is lifting the crate, and timeline.
  ;; Effects: crate becomes in-truck (no longer at place), hoist becomes available and no longer lifting the crate; advance timeline.
  (:action hoist-load-into-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?sprev - step ?s - step)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (hoist-lifting ?h ?c)
                    (step-next ?sprev ?s)
                    (step-done ?sprev)
                  )
    :effect (and
              (in-truck ?c ?tr)
              (hoist-available ?h)
              (not (hoist-lifting ?h ?c))
              (not (crate-at ?c ?p))
              (not (step-done ?sprev))
              (step-done ?s)
            )
  )

  ;; Hoist unloads a crate from a truck at a place.
  ;; Preconditions: hoist and truck co-located at place, hoist available, crate in truck, and timeline.
  ;; Effects: crate removed from truck, hoist begins lifting crate (hoist unavailable), crate is not at place while lifted; advance timeline.
  (:action hoist-unload-from-truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?sprev - step ?s - step)
    :precondition (and
                    (hoist-at ?h ?p)
                    (truck-at ?tr ?p)
                    (hoist-available ?h)
                    (in-truck ?c ?tr)
                    (step-next ?sprev ?s)
                    (step-done ?sprev)
                  )
    :effect (and
              (hoist-lifting ?h ?c)
              (not (in-truck ?c ?tr))
              (not (hoist-available ?h))
              (not (crate-at ?c ?p))
              (not (step-done ?sprev))
              (step-done ?s)
            )
  )
)