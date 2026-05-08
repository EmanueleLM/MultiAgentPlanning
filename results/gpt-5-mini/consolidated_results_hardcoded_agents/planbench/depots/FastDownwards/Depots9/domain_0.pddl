(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    object
    hoist truck surface - object
    crate pallet - surface
  )

  (:predicates
    ; Generic location: objects that can be at places (hoists, trucks, surfaces, crates via surface)
    (at ?obj - object ?p - place)

    ; stacking/containment
    (on ?crate - crate ?surface - surface)      ; crate is directly on a surface (pallet or crate)
    (in ?crate - crate ?truck - truck)          ; crate is inside a truck
    (lifting ?hoist - hoist ?crate - crate)    ; hoist is currently holding the crate

    ; resource / exclusivity predicates
    (available ?hoist - hoist)                 ; hoist is free
    (clear ?s - surface)                       ; the top of surface is free (no crate on it)
    (free-to-handle ?c - crate)                ; per-crate concurrency token (only one handling start at a time)
  )

  ; DRIVE: move a truck between distinct places (connectivity is universal)
  (:action drive
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

  ; HOIST LIFT: hoist lifts a crate off a surface at a place (consumes the per-crate token)
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (available ?h)
                    (free-to-handle ?c)
                  )
    :effect (and
              ; crate leaves the surface / place
              (not (on ?c ?s))
              (not (at ?c ?p))

              ; hoist becomes occupied
              (not (available ?h))
              (lifting ?h ?c)

              ; surface becomes clear after removal
              (clear ?s)

              ; crate remains clear (top-of-crate)
              (clear ?c)

              ; claim per-crate token (prevent other starts)
              (not (free-to-handle ?c))
            )
  )

  ; HOIST DROP: hoist drops a held crate onto a surface at the same place (releases per-crate token)
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (lifting ?h ?c)
                    (clear ?s)
                  )
    :effect (and
              ; hoist released
              (not (lifting ?h ?c))
              (available ?h)

              ; crate is now at place and on the surface
              (at ?c ?p)
              (on ?c ?s)

              ; surface now occupied, crate top is clear
              (not (clear ?s))
              (clear ?c)

              ; release per-crate token so crate may be targeted again
              (free-to-handle ?c)
            )
  )

  ; HOIST LOAD: hoist places a held crate into a truck at the same place (finishes handling, releases token)
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ; crate is removed from lifting and placed inside truck
              (not (lifting ?h ?c))
              (in ?c ?t)

              ; hoist becomes available
              (available ?h)

              ; crate no longer has a place or surface fact (if any)
              (not (at ?c ?p))
              (not (on ?c ?t)) ; defensive: crate cannot be 'on' the truck as a surface; keep model consistent

              ; crate top is clear inside truck (no crate stacked on it)
              (clear ?c)

              ; release per-crate token after finishing handling
              (free-to-handle ?c)
            )
  )

  ; HOIST UNLOAD: hoist takes a crate out of a truck at that place (starts handling, consumes token)
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (available ?h)
                    (in ?c ?t)
                    (free-to-handle ?c)
                  )
    :effect (and
              ; crate removed from truck
              (not (in ?c ?t))

              ; hoist becomes occupied holding the crate
              (not (available ?h))
              (lifting ?h ?c)

              ; consume per-crate token (start of handling)
              (not (free-to-handle ?c))

              ; crate has no place/on facts while lifted
              (not (at ?c ?p))
              (not (on ?c ?t))
            )
  )
)