(define (domain depot-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types place hoist truck crate surface stage)

  (:predicates
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place)

    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)

    (available ?h - hoist)
    (clear-surface ?s - surface)
    (clear-crate ?c - crate)

    (current ?st - stage)
    (succ ?st1 - stage ?st2 - stage)
  )

  (:action hoist-lift
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?nst)
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (on ?c ?s)
      (clear-crate ?c)
      (available ?h)
    )
    :effect (and
      (holding ?h ?c)
      (clear-surface ?s)
      (not (on ?c ?s))
      (not (available ?h))
      (not (current ?st))
      (current ?nst)
    )
  )

  (:action hoist-drop
    :parameters (?h - hoist ?c - crate ?s - surface ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?nst)
      (at-hoist ?h ?p)
      (at-surface ?s ?p)
      (holding ?h ?c)
      (clear-surface ?s)
    )
    :effect (and
      (on ?c ?s)
      (available ?h)
      (clear-crate ?c)
      (not (holding ?h ?c))
      (not (clear-surface ?s))
      (not (current ?st))
      (current ?nst)
    )
  )

  (:action hoist-load
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?nst)
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (holding ?h ?c)
    )
    :effect (and
      (in-truck ?c ?t)
      (available ?h)
      (not (holding ?h ?c))
      (not (current ?st))
      (current ?nst)
    )
  )

  (:action hoist-unload
    :parameters (?h - hoist ?c - crate ?t - truck ?p - place ?st - stage ?nst - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?nst)
      (at-hoist ?h ?p)
      (at-truck ?t ?p)
      (available ?h)
      (in-truck ?c ?t)
    )
    :effect (and
      (holding ?h ?c)
      (not (in-truck ?c ?t))
      (not (available ?h))
      (not (current ?st))
      (current ?nst)
    )
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place ?st - stage ?nst - stage)
    :precondition (and
      (current ?st)
      (succ ?st ?nst)
      (at-truck ?t ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
      (not (current ?st))
      (current ?nst)
    )
  )
)