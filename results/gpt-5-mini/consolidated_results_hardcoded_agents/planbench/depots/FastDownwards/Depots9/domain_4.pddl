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

  ;; Drive action: moves a truck from one place to another, consumes the current stage and advances to its successor.
  ;; Preconditions and effects encode explicit location change and global stage progression.
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
              (not (current ?s))
              (current ?snext)
            )
  )

  ;; Hoist lift: hoist lifts a crate off a surface at a place.
  ;; Requires hoist and surface co-located, hoist available, crate is on the surface and crate top-clear.
  ;; Effects: crate removed from surface and place (lifted), hoist becomes occupied, surface becomes clear, advance stage.
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
              (not (on ?c ?srf))
              (not (at ?c ?p))
              (not (available ?h))
              (lifting ?h ?c)
              (clear ?srf)
              (clear ?c)
              (not (current ?st))
              (current ?stn)
            )
  )

  ;; Hoist drop: hoist drops a held crate onto a surface at a place.
  ;; Requires hoist and surface co-located, hoist lifting the crate, surface clear. Effects place crate on surface and free hoist.
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
              (not (lifting ?h ?c))
              (available ?h)
              (at ?c ?p)
              (on ?c ?srf)
              (not (clear ?srf))
              (clear ?c)
              (not (current ?st))
              (current ?stn)
            )
  )

  ;; Hoist load: hoist places a held crate into a truck at the same place.
  ;; Requires hoist and truck co-located and hoist lifting the crate.
  ;; Effects: crate is in the truck, hoist released, crate no longer at place, advance stage.
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
              (not (lifting ?h ?c))
              (in ?c ?t)
              (available ?h)
              (not (at ?c ?p))
              (clear ?c)
              (not (current ?st))
              (current ?stn)
            )
  )

  ;; Hoist unload: hoist takes a crate out of a truck at that place.
  ;; Requires hoist and truck co-located, hoist available, and crate inside the truck.
  ;; Effects: crate removed from truck, hoist becomes occupied holding the crate, crate not at place while lifted, advance stage.
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
              (not (in ?c ?t))
              (not (available ?h))
              (lifting ?h ?c)
              (not (at ?c ?p))
              (not (current ?st))
              (current ?stn)
            )
  )
)