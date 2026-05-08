(define (domain depot-orchestration)
  (:requirements :strips :typing :negative-preconditions)
  (:types place crate hoist surface truck)

  (:predicates
    ;; explicit location predicates (separate types to avoid an overloaded top-type)
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; placement/containment
    (on ?c - crate ?s - surface)      ; crate C is on surface S
    (in ?c - crate ?t - truck)        ; crate C is in truck T

    ;; hoist state and resource predicates
    (available ?h - hoist)            ; hoist H is free / available
    (lifting ?h - hoist ?c - crate)   ; hoist H is currently holding crate C

    ;; clearance predicates
    (clear-crate ?c - crate)          ; crate has nothing stacked on it
    (clear-surface ?s - surface)      ; surface has no crate on it
  )

  ;; DRIVE: move a truck between places (crates inside remain in)
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and (at-truck ?tr ?from))
    :effect (and
              (not (at-truck ?tr ?from))
              (at-truck ?tr ?to)
            )
  )

  ;; HOIST LIFT: hoist lifts crate from a surface at same place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (on ?c ?s)
                    (clear-crate ?c)
                    (available ?h)
                  )
    :effect (and
              (lifting ?h ?c)
              (not (on ?c ?s))
              (not (available ?h))
              (clear-surface ?s)
            )
  )

  ;; HOIST DROP: hoist places the crate onto a clear surface at same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-surface ?s ?p)
                    (lifting ?h ?c)
                    (clear-surface ?s)
                  )
    :effect (and
              (on ?c ?s)
              (available ?h)
              (not (lifting ?h ?c))
              (not (clear-surface ?s))
              (clear-crate ?c)
            )
  )

  ;; HOIST LOAD: hoist moves a lifted crate into a co-located truck (releases hoist)
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
                    (lifting ?h ?c)
                  )
    :effect (and
              (in ?c ?t)
              (available ?h)
              (not (lifting ?h ?c))
              (clear-crate ?c)
            )
  )

  ;; HOIST UNLOAD: hoist takes a crate out of a co-located truck (hoist becomes busy holding it)
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
                    (at-hoist ?h ?p)
                    (at-truck ?t ?p)
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