(define (domain multiagent-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck hoist location container step)

  (:predicates
    (current-step ?s - step)

    (at-truck ?tr - truck ?loc - location)
    (at-hoist ?h - hoist ?loc - location)
    (at-container ?c - container ?loc - location)

    (truck-empty ?tr - truck)
    (loaded-on ?c - container ?tr - truck)
    (hoist-attached ?h - hoist ?c - container)

    (hoist-idle ?h - hoist)
    (hoist-inspected ?h - hoist)
  )

  ;; Truck actions: empty and loaded drives, parameterized by from/to locations and step tokens.
  (:action truck_agent-drive-empty
    :parameters (?tr - truck ?from - location ?to - location ?h - hoist ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (at-truck ?tr ?from)
      (truck-empty ?tr)
      (hoist-idle ?h)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  (:action truck_agent-drive-loaded
    :parameters (?tr - truck ?c - container ?from - location ?to - location ?h - hoist ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (at-truck ?tr ?from)
      (loaded-on ?c ?tr)
      (hoist-idle ?h)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  ;; Hoist actions: inspect -> lift -> place-on-truck sequence
  (:action hoist_agent-inspect
    :parameters (?h - hoist ?loc - location ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (at-hoist ?h ?loc)
      (hoist-idle ?h)
    )
    :effect (and
      (hoist-inspected ?h)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  (:action hoist_agent-lift
    :parameters (?h - hoist ?c - container ?tr - truck ?loc - location ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (hoist-inspected ?h)
      (at-hoist ?h ?loc)
      (at-container ?c ?loc)
      (at-truck ?tr ?loc)
      (truck-empty ?tr)
      (hoist-idle ?h)
    )
    :effect (and
      (hoist-attached ?h ?c)
      (not (at-container ?c ?loc))
      (not (hoist-idle ?h))
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  (:action hoist_agent-place-on-truck
    :parameters (?h - hoist ?c - container ?tr - truck ?loc - location ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (hoist-attached ?h ?c)
      (at-truck ?tr ?loc)
      (at-hoist ?h ?loc)
      (truck-empty ?tr)
    )
    :effect (and
      (loaded-on ?c ?tr)
      (not (hoist-attached ?h ?c))
      (not (truck-empty ?tr))
      (hoist-idle ?h)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  ;; Hoist move and destination inspect/unload sequence
  (:action hoist_agent-move
    :parameters (?h - hoist ?from - location ?to - location ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (at-hoist ?h ?from)
      (hoist-idle ?h)
    )
    :effect (and
      (not (at-hoist ?h ?from))
      (at-hoist ?h ?to)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  (:action hoist_agent-unload-inspect
    :parameters (?h - hoist ?loc - location ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (at-hoist ?h ?loc)
      (hoist-idle ?h)
    )
    :effect (and
      (hoist-inspected ?h)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )

  (:action hoist_agent-unload-to-ground
    :parameters (?h - hoist ?c - container ?tr - truck ?loc - location ?sfrom - step ?sto - step)
    :precondition (and
      (current-step ?sfrom)
      (at-hoist ?h ?loc)
      (at-truck ?tr ?loc)
      (loaded-on ?c ?tr)
      (hoist-idle ?h)
      (hoist-inspected ?h)
    )
    :effect (and
      (at-container ?c ?loc)
      (not (loaded-on ?c ?tr))
      (truck-empty ?tr)
      (hoist-idle ?h)
      (not (current-step ?sfrom))
      (current-step ?sto)
    )
  )
)