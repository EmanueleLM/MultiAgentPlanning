(define (domain depot-orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types place surface crate truck hoist)

  (:predicates
    ;; Locations
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; Placement modalities (mutually exclusive modalities for crates)
    (on ?c - crate ?s - surface)      ;; crate c is on surface s
    (in-truck ?c - crate ?t - truck) ;; crate c is inside truck t
    (lifting ?h - hoist ?c - crate)   ;; hoist h is holding crate c

    ;; Hoist availability / surface & crate clearance
    (available ?h - hoist)            ;; hoist h is free (not holding)
    (clear-surface ?s - surface)      ;; surface s has no crate on it
    (clear-crate ?c - crate)          ;; crate c has nothing stacked on it
  )

  ;; Hoist picks a crate from a surface at the same place and holds it
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear-crate ?c)
    )
    :effect (and
      (lifting ?h ?c)
      (clear-surface ?s)
      (not (on ?c ?s))
      (not (available ?h))
    )
  )

  ;; Hoist places a held crate onto a clear surface at same place
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
      (clear-crate ?c)
      (not (lifting ?h ?c))
      (not (clear-surface ?s))
    )
  )

  ;; Hoist places a held crate into a co-located truck (crate becomes inside truck)
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (lifting ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (available ?h)
      (not (lifting ?h ?c))
    )
  )

  ;; Hoist removes a crate from a co-located truck and holds it
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (available ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (lifting ?h ?c)
      (not (in-truck ?c ?t))
      (not (available ?h))
    )
  )

  ;; Drive moves a truck (and any crates inside it) between places
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place)
    :precondition (and
      (at-truck ?tr ?from)
      (not (at-truck ?tr ?to))
    )
    :effect (and
      (at-truck ?tr ?to)
      (not (at-truck ?tr ?from))
    )
  )
)