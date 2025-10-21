(define (domain multiagent-delivery)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location object)

  ;; Predicates
  (:predicates
    (at-agent ?ag - agent ?loc - location)
    (at-obj ?o - object ?loc - location)
    (holding ?ag - agent ?o - object)
    (adj ?l1 - location ?l2 - location)
    (blocked ?l1 - location ?l2 - location)
  )

  ;; Player1 actions (prefixed with p1-)
  (:action p1-move
    :parameters (?from - location ?to - location)
    :precondition (and
      (at-agent p1 ?from)
      (adj ?from ?to)
      (not (blocked ?from ?to))
    )
    :effect (and
      (not (at-agent p1 ?from))
      (at-agent p1 ?to)
    )
  )

  (:action p1-pick
    :parameters (?obj - object ?loc - location)
    :precondition (and
      (at-agent p1 ?loc)
      (at-obj ?obj ?loc)
      (not (holding p1 ?obj))
      (not (holding p2 ?obj))
    )
    :effect (and
      (not (at-obj ?obj ?loc))
      (holding p1 ?obj)
    )
  )

  (:action p1-drop
    :parameters (?obj - object ?loc - location)
    :precondition (and
      (at-agent p1 ?loc)
      (holding p1 ?obj)
    )
    :effect (and
      (not (holding p1 ?obj))
      (at-obj ?obj ?loc)
    )
  )

  ;; Player2 actions (prefixed with p2-)
  (:action p2-move
    :parameters (?from - location ?to - location)
    :precondition (and
      (at-agent p2 ?from)
      (adj ?from ?to)
      (not (blocked ?from ?to))
    )
    :effect (and
      (not (at-agent p2 ?from))
      (at-agent p2 ?to)
    )
  )

  (:action p2-pick
    :parameters (?obj - object ?loc - location)
    :precondition (and
      (at-agent p2 ?loc)
      (at-obj ?obj ?loc)
      (not (holding p2 ?obj))
      (not (holding p1 ?obj))
    )
    :effect (and
      (not (at-obj ?obj ?loc))
      (holding p2 ?obj)
    )
  )

  (:action p2-drop
    :parameters (?obj - object ?loc - location)
    :precondition (and
      (at-agent p2 ?loc)
      (holding p2 ?obj)
    )
    :effect (and
      (not (holding p2 ?obj))
      (at-obj ?obj ?loc)
    )
  )

  ;; Only player2 may unlock the blocked passage (preference treated as constraint)
  (:action p2-unlock
    :parameters (?loc1 - location ?loc2 - location ?key - object)
    :precondition (and
      (at-agent p2 ?loc1)
      (holding p2 ?key)
      (blocked ?loc1 ?loc2)
    )
    :effect (and
      (not (blocked ?loc1 ?loc2))
      (not (blocked ?loc2 ?loc1))
    )
  )
)