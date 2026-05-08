(define (domain sokoban_jack_of_all_trades)
  (:requirements :strips :typing)
  (:types box cell)

  (:predicates
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (goal ?c - cell)
    (adjacent ?from - cell ?to - cell)
    (clear ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and
      (player_at ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?from))
      (player_at ?to)
    )
  )

  (:action push
    :parameters (?agent_from - cell ?box_from - cell ?box_to - cell ?b - box)
    :precondition (and
      (player_at ?agent_from)
      (adjacent ?agent_from ?box_from)
      (box_at ?b ?box_from)
      (adjacent ?box_from ?box_to)
      (clear ?box_to)
    )
    :effect (and
      (not (box_at ?b ?box_from))
      (box_at ?b ?box_to)
      (not (player_at ?agent_from))
      (player_at ?box_from)
      (clear ?box_from)
      (not (clear ?box_to))
    )
  )
)