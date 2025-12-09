(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    object
    hoist truck surface - object
    crate pallet - surface
  )

  (:predicates
    ; location of objects (hoists, trucks, surfaces, crates)
    (at ?obj - object ?p - place)

    ; crate stacking / placement: crate directly on a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ; crate inside a truck
    (in ?c - crate ?t - truck)

    ; hoist is currently holding the crate
    (lifting ?h - hoist ?c - crate)

    ; hoist availability (exclusive resource)
    (available ?h - hoist)

    ; top-of-surface free predicate (applies to pallets and crates)
    (clear ?s - surface)
  )

  ; DRIVE: move a truck between places (connectivity universal)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
                    (at ?tr ?from)
                  )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
            )
  )

  ; HOIST LIFT: hoist lifts a crate off a surface at a place
  ; Preconditions require hoist and surface at same place, hoist available, crate is on the surface and top-clear.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (clear ?c)
                    (available ?h)
                  )
    :effect (and
              ; crate leaves the surface and the place (it is being lifted)
              (not (on ?c ?s))
              (not (at ?c ?p))

              ; hoist becomes occupied holding the crate
              (not (available ?h))
              (lifting ?h ?c)

              ; surface becomes clear after removal
              (clear ?s)

              ; crate top remains clear while lifted
              (clear ?c)
            )
  )

  ; HOIST DROP: hoist drops a held crate onto a surface at a place
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
            )
  )

  ; HOIST LOAD: hoist places a held crate into a truck at the same place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              ; hoist released and crate placed inside truck
              (not (lifting ?h ?c))
              (in ?c ?t)
              (available ?h)

              ; crate no longer has a ground/location at the place while inside truck
              (not (at ?c ?p))

              ; crate top remains clear inside truck
              (clear ?c)
            )
  )

  ; HOIST UNLOAD: hoist takes a crate out of a truck at that place
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (available ?h)
                    (in ?c ?t)
                  )
    :effect (and
              ; crate removed from truck
              (not (in ?c ?t))

              ; hoist becomes occupied holding the crate
              (not (available ?h))
              (lifting ?h ?c)

              ; crate has no ground/on facts while lifted
              (not (at ?c ?p))
            )
  )
)