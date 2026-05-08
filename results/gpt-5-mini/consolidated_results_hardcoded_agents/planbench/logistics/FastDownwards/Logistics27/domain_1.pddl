(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck airplane package location airport - location
    city stage
  )

  ;; Predicates
  (:predicates
    (at-truck ?tr - truck ?loc - location)
    (at-plane ?pl - airplane ?ap - airport)
    (at-package ?pkg - package ?loc - location)
    (in-truck ?pkg - package ?tr - truck)
    (in-plane ?pkg - package ?pl - airplane)
    (in-city ?loc - location ?c - city)
    (air-route ?a1 - airport ?a2 - airport)
    (next ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; All actions require consuming the current stage
  ;; token and producing its successor. This encodes
  ;; a discrete global stage/time progression as a hard
  ;; requirement the planner must respect: exactly one
  ;; (at-stage) holds at any time and every action
  ;; advances it to the next stage.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Truck actions

  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-package ?pkg ?loc)
      (at-stage ?s)
      (next ?s ?s2)
      (not (in-truck ?pkg ?tr))
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in-truck ?pkg ?tr)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-truck ?pkg ?tr)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (at-package ?pkg ?loc)
      (not (in-truck ?pkg ?tr))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (at-stage ?s)
      (next ?s ?s2)
      (not (at-truck ?tr ?to))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  ;; Airplane actions

  (:action plane-load
    :parameters (?pl - airplane ?pkg - package ?ap - airport ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?ap)
      (at-package ?pkg ?ap)
      (at-stage ?s)
      (next ?s ?s2)
      (not (in-plane ?pkg ?pl))
    )
    :effect (and
      (not (at-package ?pkg ?ap))
      (in-plane ?pkg ?pl)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action plane-unload
    :parameters (?pl - airplane ?pkg - package ?ap - airport ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?ap)
      (in-plane ?pkg ?pl)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (at-package ?pkg ?ap)
      (not (in-plane ?pkg ?pl))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action fly-plane
    :parameters (?pl - airplane ?from - airport ?to - airport ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?from)
      (air-route ?from ?to)
      (at-stage ?s)
      (next ?s ?s2)
      (not (at-plane ?pl ?to))
    )
    :effect (and
      (not (at-plane ?pl ?from))
      (at-plane ?pl ?to)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)