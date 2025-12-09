(define (domain multiagent-hoist-truck)
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
    ;; location predicates
    (at-surface ?s - surface ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)

    ;; road connectivity (explicit bidirectional roads in problem file)
    (road ?p1 - place ?p2 - place)

    ;; stacking: crate on surface (surface is pallet or crate)
    (on ?c - crate ?s - surface)

    ;; clear means nothing is on top of this surface (a crate or pallet)
    (clear ?s - surface)

    ;; crate inside truck
    (in ?c - crate ?t - truck)

    ;; hoist state
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; discrete stage control for strict linear ordering (one action per stage)
    (current-stage ?st - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; All actions advance the global current-stage to its successor to enforce
  ;; a single-global-step execution model (no concurrency). Preconditions
  ;; explicitly require co-location and resource availability. Effects
  ;; maintain exactly the specified occupancy and clear conditions.

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)

      ;; hoist and crate and supporting surface must be co-located
      (at-hoist ?h ?p)
      (at-surface ?c ?p)
      (at-surface ?s ?p)

      ;; crate must be on the supporting surface and top-of-stack
      (on ?c ?s)
      (clear ?c)

      ;; hoist must be available
      (available ?h)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; hoist picks up the crate and becomes busy
      (holding ?h ?c)
      (not (available ?h))

      ;; crate is removed from its place and surface
      (not (at-surface ?c ?p))
      (not (on ?c ?s))

      ;; the supporting surface becomes clear
      (clear ?s)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)

      ;; hoist and truck must be co-located at the same place
      (at-hoist ?h ?p)
      (at-truck ?t ?p)

      ;; hoist must be holding the crate
      (holding ?h ?c)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; crate becomes inside the truck
      (in ?c ?t)

      ;; hoist becomes available and stops holding the crate
      (available ?h)
      (not (holding ?h ?c))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)

      ;; hoist and truck must be co-located
      (at-hoist ?h ?p)
      (at-truck ?t ?p)

      ;; hoist must be available to perform an unload
      (available ?h)

      ;; crate must be inside the truck
      (in ?c ?t)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; crate removed from truck; hoist starts holding it and becomes busy
      (not (in ?c ?t))
      (holding ?h ?c)
      (not (available ?h))
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)

      ;; hoist and the receiving surface must be co-located
      (at-hoist ?h ?p)
      (at-surface ?s ?p)

      ;; surface must be clear to receive the crate and hoist must be holding the crate
      (clear ?s)
      (holding ?h ?c)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; hoist releases crate and becomes available
      (available ?h)
      (not (holding ?h ?c))

      ;; crate is now at the place and on that surface
      (at-surface ?c ?p)
      (on ?c ?s)

      ;; surface becomes not clear and crate (top) is clear
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)

      ;; truck must be at origin and a road must connect origin and destination
      (at-truck ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; truck moves from origin to destination
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )
)