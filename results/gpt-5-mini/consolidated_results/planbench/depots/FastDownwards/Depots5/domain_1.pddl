(define (domain multiagent-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place depot distributor - place
    entity crate pallet truck hoist - entity
    stage
  )

  (:predicates
    ;; location of entities (crates, pallets, trucks, hoists)
    (at ?e - entity ?p - place)

    ;; road connectivity between places (bidirectional facts in problem)
    (road ?p1 - place ?p2 - place)

    ;; stacking: crate on surface (surface can be pallet or another crate)
    (on ?c - crate ?s - entity)

    ;; clear means nothing is on top of this entity (crate or pallet)
    (clear ?e - entity)

    ;; crate inside truck
    (in ?c - crate ?t - truck)

    ;; hoist state
    (available ?h - hoist)
    (holding ?h - hoist ?c - crate)

    ;; discrete stage control to enforce a strict linear ordering of actions
    (current-stage ?st - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; All actions advance the current-stage from a stage to its successor,
  ;; enforcing a single global linear step at a time (no concurrency).
  ;; Preconditions include the current-stage; effects move current-stage forward.

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      (at ?h ?p)
      (at ?c ?p)
      (available ?h)
      (clear ?c)
      (on ?c ?s)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?st2)

      (holding ?h ?c)
      (not (available ?h))
      (not (at ?c ?p))
      (not (on ?c ?s))
      (clear ?s)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      (at ?h ?p)
      (at ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?st2)

      (in ?c ?t)
      (available ?h)
      (not (holding ?h ?c))
      ;; crate is now in truck (not at place)—already not at place when lifted
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?t - truck ?c - crate ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      (at ?h ?p)
      (at ?t ?p)
      (available ?h)
      (in ?c ?t)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?st2)

      (not (in ?c ?t))
      (holding ?h ?c)
      (not (available ?h))
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - entity ?p - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      (at ?h ?p)
      (at ?s ?p)
      (clear ?s)
      (holding ?h ?c)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?st2)

      (available ?h)
      (not (holding ?h ?c))
      (at ?c ?p)
      (on ?c ?s)
      (not (clear ?s))
      (clear ?c)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - place ?to - place ?st - stage ?st2 - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?st2)
      (at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?st2)

      (at ?t ?to)
      (not (at ?t ?from))
      ;; crates inside the truck remain (in ?c ?t) through the drive
    )
  )
)