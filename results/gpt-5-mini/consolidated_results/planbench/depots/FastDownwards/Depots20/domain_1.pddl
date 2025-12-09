(define (domain depots-revised)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    hoist truck - object
    crate pallet - surface
    surface - object
    place depot distributor - place
    step - object
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

    ;; explicit ordered steps
    (step-next ?s1 - step ?s2 - step)
    (step-done ?s - step)
  )

  ;; Drive a truck from one place to another.
  ;; Precondition: truck at origin and step ordering respected.
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
              (step-done ?s)
            )
  )

  ;; Hoist lifts a crate from a surface at a place.
  ;; Precondition: hoist and crate co-located, hoist available, crate clear, crate on the surface, surface at same place, ordering.
  ;; Effects: crate removed from place and surface, hoist holds crate, hoist becomes unavailable, surface becomes clear.
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
              (step-done ?s)
            )
  )

  ;; Hoist drops a crate to a surface at a place.
  ;; Precondition: hoist and surface at same place, surface clear, hoist is lifting the crate, ordering.
  ;; Effects: crate at place and on surface, crate becomes clear, hoist available, hoist no longer lifting, surface no longer clear.
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
              (step-done ?s)
            )
  )

  ;; Hoist loads a crate into a truck at a place.
  ;; Precondition: hoist and truck co-located with place, hoist is lifting the crate, ordering.
  ;; Effects: crate becomes in-truck, hoist becomes available and no longer lifting the crate.
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
              (step-done ?s)
            )
  )

  ;; Hoist unloads a crate from a truck at a place.
  ;; Precondition: hoist and truck co-located at place, hoist available, crate in truck, ordering.
  ;; Effects: crate removed from truck, hoist begins lifting crate (hoist unavailable).
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
              (step-done ?s)
            )
  )
)