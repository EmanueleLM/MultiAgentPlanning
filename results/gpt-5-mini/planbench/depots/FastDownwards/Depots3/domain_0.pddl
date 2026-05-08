(define (domain depot-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types place crate hoist surface truck - object)

  (:predicates
    ;; location: hoists, surfaces, and trucks are located at places.
    (at ?e - object ?p - place)

    ;; containment/placement predicates
    (on ?c - crate ?s - surface)      ; crate C is on surface S
    (in ?c - crate ?t - truck)        ; crate C is inside truck T

    ;; hoist state and resource predicates
    (available ?h - hoist)            ; hoist H is free / available
    (lifting ?h - hoist ?c - crate)   ; hoist H is currently holding crate C

    ;; clearance predicates (separate names to avoid overloading)
    (clear-crate ?c - crate)          ; crate has nothing stacked on it
    (clear-surface ?s - surface)      ; surface has no crate on it
  )

  ;; DRIVING ACTION: moves a truck between places (crates in-truck stay in)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at ?tr ?from))
    :effect (and
              (not (at ?tr ?from))
              (at ?tr ?to)
            )
  )

  ;; HOIST LIFT: hoist lifts crate from a surface at same place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (on ?c ?s)
                    (clear-crate ?c)
                    (available ?h)
                  )
    :effect (and
              (lifting ?h ?c)
              (clear-surface ?s)
              (not (on ?c ?s))
              (not (available ?h))
            )
  )

  ;; HOIST DROP: hoist places the crate onto a clear surface at same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?s ?p)
                    (lifting ?h ?c)
                    (clear-surface ?s)
                  )
    :effect (and
              (on ?c ?s)
              (available ?h)
              (not (lifting ?h ?c))
              (not (clear-surface ?s))
            )
  )

  ;; HOIST LOAD: hoist moves a lifted crate into a co-located truck
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              (in ?c ?t)
              (available ?h)
              (not (lifting ?h ?c))
            )
  )

  ;; HOIST UNLOAD: hoist takes a crate out of a co-located truck (hoist becomes busy holding it)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at ?h ?p)
                    (at ?t ?p)
                    (available ?h)
                    (in ?c ?t)
                  )
    :effect (and
              (lifting ?h ?c)
              (not (in ?c ?t))
              (not (available ?h))
            )
  )
)