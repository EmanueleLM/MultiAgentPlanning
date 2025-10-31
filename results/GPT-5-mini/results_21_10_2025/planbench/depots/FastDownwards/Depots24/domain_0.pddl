(define (domain multiagent-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent loc item door)

  (:predicates
    (at ?a - agent ?l - loc)
    (at-item ?i - item ?l - loc)
    (carrying ?a - agent ?i - item)
    (door-open ?d - door)
    (door-between ?d - door ?l1 - loc ?l2 - loc)
    (connected ?l1 - loc ?l2 - loc)
    (has-key ?a - agent ?d - door)
  )

  ;; Actions for player1
  (:action player1-move
    :parameters (?from - loc ?to - loc)
    :precondition (and (at player1 ?from) (connected ?from ?to))
    :effect (and (not (at player1 ?from)) (at player1 ?to))
  )

  (:action player1-move-through-door
    :parameters (?d - door ?from - loc ?to - loc)
    :precondition (and (at player1 ?from) (door-between ?d ?from ?to) (door-open ?d))
    :effect (and (not (at player1 ?from)) (at player1 ?to))
  )

  (:action player1-pick
    :parameters (?i - item ?loc - loc)
    :precondition (and (at player1 ?loc) (at-item ?i ?loc))
    :effect (and (not (at-item ?i ?loc)) (carrying player1 ?i))
  )

  (:action player1-drop
    :parameters (?i - item ?loc - loc)
    :precondition (and (at player1 ?loc) (carrying player1 ?i))
    :effect (and (not (carrying player1 ?i)) (at-item ?i ?loc))
  )

  ;; Actions for player2
  (:action player2-move
    :parameters (?from - loc ?to - loc)
    :precondition (and (at player2 ?from) (connected ?from ?to))
    :effect (and (not (at player2 ?from)) (at player2 ?to))
  )

  (:action player2-move-through-door
    :parameters (?d - door ?from - loc ?to - loc)
    :precondition (and (at player2 ?from) (door-between ?d ?from ?to) (door-open ?d))
    :effect (and (not (at player2 ?from)) (at player2 ?to))
  )

  (:action player2-pick
    :parameters (?i - item ?loc - loc)
    :precondition (and (at player2 ?loc) (at-item ?i ?loc))
    :effect (and (not (at-item ?i ?loc)) (carrying player2 ?i))
  )

  (:action player2-drop
    :parameters (?i - item ?loc - loc)
    :precondition (and (at player2 ?loc) (carrying player2 ?i))
    :effect (and (not (carrying player2 ?i)) (at-item ?i ?loc))
  )

  (:action player2-open-door
    :parameters (?d - door ?loc - loc ?other - loc)
    :precondition (and (at player2 ?loc) (door-between ?d ?loc ?other) (has-key player2 ?d) (not (door-open ?d)))
    :effect (door-open ?d)
  )
)