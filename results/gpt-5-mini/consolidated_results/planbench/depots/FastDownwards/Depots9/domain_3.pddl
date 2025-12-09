(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    object
    hoist truck surface - object
    crate pallet - surface
    stage
  )

  (:predicates
    ; location of objects (hoists, trucks, surfaces, crates)
    (at ?obj - object ?p - place)

    ; crate directly on a surface (pallet or crate)
    (on ?c - crate ?s - surface)

    ; crate inside a truck
    (in ?c - crate ?t - truck)

    ; hoist is currently holding the crate
    (lifting ?h - hoist ?c - crate)

    ; hoist availability (exclusive resource)
    (available ?h - hoist)

    ; top-of-surface free predicate (applies to pallets and crates)
    (clear ?s - surface)

    ; discrete stage progression
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ; DRIVE: move a truck between places; consumes a stage token and advances to successor stage
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?s - stage ?snext - stage)
    :precondition (and
                    (at ?tr ?from)
                    (current ?s)
                    (succ ?s ?snext)
                  )
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)

              ; advance global stage
              (not (current ?s))
              (current ?snext)
            )
  )

  ; HOIST LIFT: hoist lifts a crate off a surface at a place
  ; Preconditions require hoist and surface at same place, hoist available, crate is on the surface and crate top-clear.
  ; Stage progression enforced explicitly.
  (:action hoist_lift
    :parameters (?h - hoist ?c - crate ?srf - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?srf ?p)
                    (on ?c ?srf)
                    (clear ?c)
                    (available ?h)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ; crate leaves the surface and the place (it is being lifted)
              (not (on ?c ?srf))
              (not (at ?c ?p))

              ; hoist becomes occupied holding the crate
              (not (available ?h))
              (lifting ?h ?c)

              ; surface becomes clear after removal
              (clear ?srf)

              ; crate top remains clear while lifted
              (clear ?c)

              ; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )

  ; HOIST DROP: hoist drops a held crate onto a surface at a place
  (:action hoist_drop
    :parameters (?h - hoist ?c - crate ?srf - surface ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?srf ?p)
                    (lifting ?h ?c)
                    (clear ?srf)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ; hoist released
              (not (lifting ?h ?c))
              (available ?h)

              ; crate is now at place and on the surface
              (at ?c ?p)
              (on ?c ?srf)

              ; surface now occupied, crate top is clear
              (not (clear ?srf))
              (clear ?c)

              ; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )

  ; HOIST LOAD: hoist places a held crate into a truck at the same place
  (:action hoist_load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (lifting ?h ?c)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ; hoist released and crate placed inside truck
              (not (lifting ?h ?c))
              (in ?c ?t)
              (available ?h)

              ; crate no longer at the place while inside truck
              (not (at ?c ?p))

              ; crate top remains clear inside truck
              (clear ?c)

              ; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )

  ; HOIST UNLOAD: hoist takes a crate out of a truck at that place
  (:action hoist_unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?stn - stage)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (available ?h)
                    (in ?c ?t)
                    (current ?st)
                    (succ ?st ?stn)
                  )
    :effect (and
              ; crate removed from truck
              (not (in ?c ?t))

              ; hoist becomes occupied holding the crate
              (not (available ?h))
              (lifting ?h ?c)

              ; crate has no ground/on facts while lifted
              (not (at ?c ?p))

              ; advance stage
              (not (current ?st))
              (current ?stn)
            )
  )
)