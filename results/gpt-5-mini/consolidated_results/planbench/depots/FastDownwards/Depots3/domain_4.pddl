(define (domain depot-hoist-truck)
  (:requirements :strips :typing :negative-preconditions)
  (:types place hoist truck crate surface stage)

  (:predicates
    ; spatial predicates
    (at-hoist ?h - hoist ?p - place)
    (at-truck ?t - truck ?p - place)
    (at-surface ?s - surface ?p - place)

    ; object relations
    (on ?c - crate ?s - surface)
    (in-truck ?c - crate ?t - truck)
    (holding ?h - hoist ?c - crate)

    ; resource / clearance state
    (available ?h - hoist)
    (clear-surface ?s - surface)
    (clear-crate ?c - crate)

    ; discrete time / ordering: exactly one current stage holds
    (current ?st - stage)
    (succ ?st1 - stage ?st2 - stage)
  )

  ; Hoist lifts a crate from a surface: requires hoist co-located with surface & crate,
  ; hoist available, crate clear, and current stage. Effects: hoist holds crate,
  ; surface becomes clear, crate no longer on that surface, hoist becomes unavailable,
  ; and stage advances.
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

  ; Hoist drops a held crate onto a surface at same place: requires hoist holding crate,
  ; surface clear, co-location and stage. Effects: crate on surface, hoist becomes available,
  ; crate becomes clear (nothing on top of it), hoist no longer holding, surface not clear,
  ; and stage advances.
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

  ; Hoist loads a held crate into a truck at same place: requires hoist holding crate,
  ; truck co-located and stage. Effects: crate becomes in the truck, hoist becomes available,
  ; hoist no longer holds crate, and stage advances.
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

  ; Hoist unloads a crate from a truck into its grip: requires hoist available,
  ; hoist co-located with truck, crate in that truck, and stage. Effects: hoist holds crate,
  ; crate no longer in truck, hoist becomes unavailable, and stage advances.
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

  ; Drive a truck from one place to another: requires truck at origin and stage.
  ; Effects: truck at destination, no longer at origin, and stage advances.
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