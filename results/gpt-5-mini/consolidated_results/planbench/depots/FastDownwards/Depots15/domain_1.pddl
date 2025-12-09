(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    truck
    hoist
    stage
  )

  (:predicates
    ;; locations
    (at-surf ?s - surface ?p - place)   ;; surface (pallet or crate) is at place
    (at-truck ?tr - truck ?p - place)   ;; truck is at place
    (at-hoist ?h - hoist ?p - place)    ;; hoist is at place

    ;; stacking / containment
    (on ?c - crate ?s - surface)        ;; crate is directly on surface (pallet or crate)
    (in ?c - crate ?t - truck)          ;; crate is inside truck

    ;; hoist state
    (lifting ?h - hoist ?c - crate)     ;; hoist is lifting crate
    (available ?h - hoist)              ;; hoist is available (idle)
    (crate_reserved ?c - crate)         ;; exclusive reservation token for crate during manipulation

    ;; surface occupancy / clearance
    (clear ?s - surface)                ;; surface (pallet or crate) has no crate directly on top

    ;; ordered stages
    (current-stage ?st - stage)         ;; global current stage
    (succ ?s1 - stage ?s2 - stage)      ;; successor relation between stages
  )

  ;; TRUCK action: move truck between places (fully connected topology)
  (:action truck-drive
    :parameters (?tr - truck ?from - place ?to - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (not (at-truck ?tr ?to))
      (current-stage ?st1)
      (succ ?st1 ?st2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      ;; advance global stage
      (not (current-stage ?st1))
      (current-stage ?st2)
    )
  )

  ;; HOIST LIFT: hoist lifts a top crate from a surface at the same place
  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (at-hoist ?h ?p)
      (at-surf ?s ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
      (not (crate_reserved ?c))
      (current-stage ?st1)
      (succ ?st1 ?st2)
    )
    :effect (and
      ;; remove support relations and location for the crate while it is lifted
      (not (on ?c ?s))
      (not (at-surf ?c ?p))

      ;; hoist state changes
      (lifting ?h ?c)
      (not (available ?h))

      ;; surface becomes clear (top spot freed)
      (clear ?s)

      ;; reserve the crate to prevent concurrent manipulation
      (crate_reserved ?c)

      ;; advance stage
      (not (current-stage ?st1))
      (current-stage ?st2)
    )
  )

  ;; HOIST DROP: hoist drops the crate onto a clear surface at the same place
  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?p)
      (at-surf ?s ?p)
      (clear ?s)
      (current-stage ?st1)
      (succ ?st1 ?st2)
    )
    :effect (and
      ;; hoist becomes free
      (not (lifting ?h ?c))
      (available ?h)

      ;; crate placed on surface and at place
      (on ?c ?s)
      (at-surf ?c ?p)

      ;; occupancy updates
      (clear ?c)
      (not (clear ?s))

      ;; release reservation
      (not (crate_reserved ?c))

      ;; advance stage
      (not (current-stage ?st1))
      (current-stage ?st2)
    )
  )

  ;; HOIST LOAD: hoist loads a crate it is lifting into a truck at the same place
  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (lifting ?h ?c)
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (current-stage ?st1)
      (succ ?st1 ?st2)
    )
    :effect (and
      ;; crate enters truck; no longer at place or on any surface
      (in ?c ?t)
      (not (at-surf ?c ?p))

      ;; hoist becomes available and stops lifting
      (not (lifting ?h ?c))
      (available ?h)

      ;; release reservation
      (not (crate_reserved ?c))

      ;; advance stage
      (not (current-stage ?st1))
      (current-stage ?st2)
    )
  )

  ;; HOIST UNLOAD: hoist unloads a crate from a truck and begins lifting it
  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st1 - stage ?st2 - stage)
    :precondition (and
      (available ?h)
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in ?c ?t)
      (not (crate_reserved ?c))
      (current-stage ?st1)
      (succ ?st1 ?st2)
    )
    :effect (and
      ;; crate removed from truck and hoist starts lifting it
      (not (in ?c ?t))
      (lifting ?h ?c)

      ;; hoist becomes unavailable
      (not (available ?h))

      ;; reserve crate during manipulation
      (crate_reserved ?c)

      ;; advance stage
      (not (current-stage ?st1))
      (current-stage ?st2)
    )
  )
)