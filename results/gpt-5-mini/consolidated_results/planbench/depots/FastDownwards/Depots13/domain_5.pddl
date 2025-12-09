(define (domain depots13)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    surface pallet crate - surface
    truck - truck
    hoist - hoist
    stage - stage
  )

  (:predicates
    ;; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)

    ;; static placement of surfaces (pallets and supports)
    (surface-at ?s - surface ?p - place)

    ;; stacking and availability
    (on ?c - crate ?s - surface)      ; crate is on a surface (pallet or another crate)
    (clear ?s - surface)              ; top of surface is clear (no crate on it)

    (hoist-free ?h - hoist)           ; hoist available (not holding)
    (hoist-attached ?h - hoist ?c - crate) ; hoist is holding crate

    (in-truck ?c - crate ?tr - truck) ; crate is in truck

    ;; discrete stage/time progression
    (current-stage ?st - stage)
    (next ?st - stage ?st2 - stage)
  )

  ;; Drive: move truck between places, advance stage strictly to successor.
  (:action drive
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ;; Hoist lifts a crate from a surface (pallet or crate). Advance stage.
  (:action hoist_lift_from_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (on ?c ?s)
      (clear ?c)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (on ?c ?s))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (clear ?s)
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ;; Hoist drops a crate onto a surface (pallet or any surface). Advance stage.
  (:action hoist_drop_to_surface
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (surface-at ?s ?p)
      (clear ?s)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?c ?s)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?s))
      (clear ?c)
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ;; Hoist drops a crate onto another crate (base crate must be present at the same place).
  (:action hoist_drop_onto_crate
    :parameters (?h - hoist ?c - crate ?base - crate ?support - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (on ?base ?support)         ; base crate is supported by some surface
      (surface-at ?support ?p)    ; that support is at the place
      (at-hoist ?h ?p)
      (clear ?base)               ; base crate top must be clear
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (on ?c ?base)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (not (clear ?base))
      (clear ?c)
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ;; Hoist loads a held crate into a truck at the same place. Advance stage.
  (:action hoist_load_into_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-attached ?h ?c)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (in-truck ?c ?tr)
      (not (hoist-attached ?h ?c))
      (hoist-free ?h)
      (clear ?c)
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  ;; Hoist unloads a crate from a truck into the hoist (hoist becomes attached). Advance stage.
  (:action hoist_unload_from_truck
    :parameters (?h - hoist ?c - crate ?tr - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (hoist-free ?h)
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (in-truck ?c ?tr)
      (current-stage ?st)
      (next ?st ?st2)
    )
    :effect (and
      (not (in-truck ?c ?tr))
      (hoist-attached ?h ?c)
      (not (hoist-free ?h))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )
)