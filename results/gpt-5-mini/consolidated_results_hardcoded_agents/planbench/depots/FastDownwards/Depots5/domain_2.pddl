(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    crate pallet truck hoist stage
  )

  (:predicates
    ;; location of movable entities: crates, pallets, trucks, hoists
    (at ?e - (either crate pallet truck hoist) ?p - place)

    ;; road connectivity between places (problem provides bidirectional facts)
    (road ?p1 - place ?p2 - place)

    ;; stacking: crate on surface (surface is pallet or crate)
    (on ?c - crate ?s - (either pallet crate))

    ;; clear means nothing is on top of this surface or crate
    (clear ?e - (either crate pallet))

    ;; crate inside truck
    (in ?c - crate ?t - truck)

    ;; hoist state
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; discrete stage control to enforce a strict linear ordering of actions
    (current-stage ?st - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Every action advances the current-stage from one stage to its successor,
  ;; enforcing a single global linear step at a time (no concurrency).
  ;; Preconditions include the current-stage; effects move current-stage forward.
  ;; All preconditions and effects are explicit (no bookkeeping tokens or
  ;; post-hoc penalties). Crate occupancy and surface-clearness are maintained
  ;; exactly according to the operation semantics.

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      ;; hoist and crate must be co-located
      (at ?h ?p)
      (at ?c ?p)
      ;; hoist available and crate top-of-stack
      (available ?h)
      (clear ?c)
      ;; crate must be on the supporting surface
      (on ?c ?s)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; hoist picks up the crate
      (holding ?h ?c)
      (not (available ?h))

      ;; crate is no longer at the place nor on that surface
      (not (at ?c ?p))
      (not (on ?c ?s))

      ;; formerly occupied surface becomes clear
      (clear ?s)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      ;; hoist and truck must be co-located
      (at ?h ?p)
      (at ?t ?p)
      ;; hoist is holding this crate
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

      ;; crate is not at the place and not on any surface (ensured by not having on/at facts)
      (not (at ?c ?p))
      ;; no explicit (on ?c ...) to remove here because lift removed it already
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      ;; hoist and truck must be co-located
      (at ?h ?p)
      (at ?t ?p)
      ;; hoist must be available to perform an unload
      (available ?h)
      ;; crate must be inside the truck
      (in ?c ?t)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; crate removed from truck and hoist starts holding it (becomes busy)
      (not (in ?c ?t))
      (holding ?h ?c)
      (not (available ?h))

      ;; crate is no longer inside the truck; its at/?p and on/?s will be set by subsequent drop action
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - (either pallet crate) ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      ;; hoist and surface must be co-located
      (at ?h ?p)
      (at ?s ?p)
      ;; surface must be clear to receive the crate
      (clear ?s)
      ;; hoist must be holding the crate
      (holding ?h ?c)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; hoist releases crate and becomes available
      (available ?h)
      (not (holding ?h ?c))

      ;; crate is now at place and on that surface
      (at ?c ?p)
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
      (at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (current-stage ?st))
      (current-stage ?st2)

      ;; truck moves from origin to destination
      (at ?t ?to)
      (not (at ?t ?from))
      ;; crates inside the truck remain (in ?c ?t) through the drive; no change needed
    )
  )
)