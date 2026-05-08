(define (domain hoist-truck-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
      depot distributor - place
    surface
      pallet crate - surface
    hoist truck stage
  )

  (:predicates
    ;; discrete-time staging
    (current-stage ?st - stage)
    (succ ?st1 - stage ?st2 - stage)

    ;; locations
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place)

    ;; stacking / containment
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)

    ;; hoist state
    (holding ?h - hoist ?c - crate)
    (available ?h - hoist)

    ;; whether a surface (pallet or crate) has nothing on top
    (clear ?s - surface)

    ;; connectivity between places (asserted in problem as symmetric facts)
    (connected ?p1 - place ?p2 - place)
  )

  ;; One action per stage: consume current-stage and produce its successor.
  ;; This explicitly enforces discrete-time ordering and prevents oscillation
  ;; or post-hoc repairs using slack tokens.

  (:action drive-truck
    :parameters (?tr - truck ?from - place ?to - place ?st - stage ?nst - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?nst)
      (at-truck ?tr ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?nst)

      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
    )
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?nst)

      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (at-surface ?c ?p)
      (on ?c ?s)
      (available ?h)
      (clear ?c)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?nst)

      (holding ?h ?c)
      (not (on ?c ?s))
      (not (at-surface ?c ?p))
      (not (available ?h))
      (clear ?s)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?nst)

      (at-hoist ?h ?p)
      (holding ?h ?c)
      (at-surface ?s ?p)
      (clear ?s)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?nst)

      (on ?c ?s)
      (at-surface ?c ?p)
      (available ?h)
      (clear ?c)
      (not (holding ?h ?c))
      (not (clear ?s))
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?nst)

      (at-hoist ?h ?p)
      (holding ?h ?c)
      (at-truck ?t ?p)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?nst)

      (in-truck ?c ?t)
      (available ?h)
      (not (holding ?h ?c))
      (not (at-surface ?c ?p))
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current-stage ?st)
      (succ ?st ?nst)

      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (in-truck ?c ?t)
      (available ?h)
    )
    :effect (and
      (not (current-stage ?st))
      (current-stage ?nst)

      (holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (available ?h))
    )
  )
)