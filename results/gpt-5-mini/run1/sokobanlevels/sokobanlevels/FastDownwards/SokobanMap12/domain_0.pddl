(define (domain sokoban_jackofalltrades)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box cell)
  (:predicates
    (at_player ?pl - player ?c - cell)
    (at_box ?b - box ?c - cell)
    (occupied_by_box ?c - cell)
    (adjacent ?from - cell ?to - cell)
    (goal_cell ?c - cell)
  )

  (:action walk
    :parameters (?pl - player ?from - cell ?to - cell)
    :precondition (and
      (at_player ?pl ?from)
      (adjacent ?from ?to)
      (not (occupied_by_box ?to))
    )
    :effect (and
      (not (at_player ?pl ?from))
      (at_player ?pl ?to)
    )
  )

  (:action push
    :parameters (?pl - player ?b - box ?from - cell ?boxpos - cell ?to - cell)
    :precondition (and
      (at_player ?pl ?from)
      (at_box ?b ?boxpos)
      (adjacent ?from ?boxpos)
      (adjacent ?boxpos ?to)
      (not (occupied_by_box ?to))
    )
    :effect (and
      (not (at_player ?pl ?from))
      (at_player ?pl ?boxpos)
      (not (at_box ?b ?boxpos))
      (at_box ?b ?to)
      (not (occupied_by_box ?boxpos))
      (occupied_by_box ?to)
    )
  )
)