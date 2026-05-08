(define (domain sokoban_domain)
  (:requirements :typing :strips)
  (:types player box cell)
  (:predicates
    (adjacent ?from - cell ?to - cell)
    (player_at ?c - cell)
    (box_at ?b - box ?c - cell)
    (free ?c - cell)
    (goal ?c - cell)
  )

  (:action move
    :parameters (?from - cell ?to - cell)
    :precondition (and (player_at ?from) (adjacent ?from ?to) (free ?to))
    :effect (and
              (not (player_at ?from))
              (player_at ?to)
              (not (free ?to))
              (free ?from)
            )
  )

  (:action push
    :parameters (?from - cell ?boxpos - cell ?to - cell ?b - box)
    :precondition (and
                    (player_at ?from)
                    (box_at ?b ?boxpos)
                    (adjacent ?from ?boxpos)
                    (adjacent ?boxpos ?to)
                    (free ?to)
                  )
    :effect (and
              (not (player_at ?from))
              (player_at ?boxpos)
              (not (box_at ?b ?boxpos))
              (box_at ?b ?to)
              (not (free ?to))
              (free ?from)
            )
  )
)