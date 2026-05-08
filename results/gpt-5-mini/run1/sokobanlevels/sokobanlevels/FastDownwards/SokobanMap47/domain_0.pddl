(define (domain jack_of_all_trades_sokoban)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box cell)

  (:predicates
    (player_at ?p - agent ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (right_of ?l - cell ?r - cell)
  )

  (:action move_right
    :parameters (?p - agent ?from - cell ?to - cell ?b - box)
    :precondition (and (player_at ?p ?from) (right_of ?from ?to) (not (box_at ?b ?to)))
    :effect (and (not (player_at ?p ?from)) (player_at ?p ?to))
  )

  (:action move_left
    :parameters (?p - agent ?from - cell ?to - cell ?b - box)
    :precondition (and (player_at ?p ?from) (right_of ?to ?from) (not (box_at ?b ?to)))
    :effect (and (not (player_at ?p ?from)) (player_at ?p ?to))
  )

  (:action push_right
    :parameters (?p - agent ?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (player_at ?p ?player_from)
      (right_of ?player_from ?box_from)
      (box_at ?b ?box_from)
      (right_of ?box_from ?box_to)
      (not (box_at ?b ?box_to))
    )
    :effect (and
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_from)
    )
  )

  (:action push_left
    :parameters (?p - agent ?b - box ?player_from - cell ?box_from - cell ?box_to - cell)
    :precondition (and
      (player_at ?p ?player_from)
      (right_of ?box_from ?player_from)
      (box_at ?b ?box_from)
      (right_of ?box_to ?box_from)
      (not (box_at ?b ?box_to))
    )
    :effect (and
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (not (player_at ?p ?player_from))
      (player_at ?p ?box_from)
    )
  )
)