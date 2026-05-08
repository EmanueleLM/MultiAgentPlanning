(define (domain sokoban_corridor)
  (:requirements :strips :typing)
  (:types player box position)
  (:predicates
    (player_at ?p - position)
    (box_at ?b - box ?p - position)
    (clear ?p - position)
    (adj_up ?lower - position ?upper - position)
    (adj_down ?upper - position ?lower - position)
  )

  (:action move_up
    :parameters (?from - position ?to - position)
    :precondition (and (player_at ?from) (adj_up ?from ?to) (clear ?to))
    :effect (and
              (not (player_at ?from))
              (player_at ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action move_down
    :parameters (?from - position ?to - position)
    :precondition (and (player_at ?from) (adj_down ?from ?to) (clear ?to))
    :effect (and
              (not (player_at ?from))
              (player_at ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  (:action push_up
    :parameters (?p - position ?bpos - position ?t - position ?b - box)
    :precondition (and
                    (player_at ?p)
                    (box_at ?b ?bpos)
                    (adj_up ?p ?bpos)
                    (adj_up ?bpos ?t)
                    (clear ?t)
                  )
    :effect (and
              (not (box_at ?b ?bpos))
              (box_at ?b ?t)
              (not (player_at ?p))
              (player_at ?bpos)
              (clear ?p)
              (not (clear ?bpos))
              (not (clear ?t))
            )
  )

  (:action push_down
    :parameters (?p - position ?bpos - position ?t - position ?b - box)
    :precondition (and
                    (player_at ?p)
                    (box_at ?b ?bpos)
                    (adj_down ?p ?bpos)
                    (adj_down ?bpos ?t)
                    (clear ?t)
                  )
    :effect (and
              (not (box_at ?b ?bpos))
              (box_at ?b ?t)
              (not (player_at ?p))
              (player_at ?bpos)
              (clear ?p)
              (not (clear ?bpos))
              (not (clear ?t))
            )
  )
)