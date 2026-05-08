(define (domain sokoban)
  (:requirements :strips :typing)
  (:types player box goal position)
  (:predicates
    (player-at ?p - position)
    (box-at ?b - box ?p - position)
    (goal-at ?g - goal ?p - position)
    (is-clear ?p - position)
    (adjacent ?p1 ?p2 - position)
  )

  (:action move
    :parameters (?from ?to - position)
    :precondition (and
        (player-at ?from)
        (is-clear ?to)
        (adjacent ?from ?to))
    :effect (and
        (not (player-at ?from))
        (player-at ?to))
  )

  (:action push
    :parameters (?player-pos ?box-pos ?new-box-pos - position ?b - box)
    :precondition (and
        (player-at ?player-pos)
        (box-at ?b ?box-pos)
        (is-clear ?new-box-pos)
        (adjacent ?player-pos ?box-pos)
        (adjacent ?box-pos ?new-box-pos))
    :effect (and
        (not (player-at ?player-pos))
        (not (box-at ?b ?box-pos))
        (is-clear ?box-pos)
        (player-at ?box-pos)
        (box-at ?b ?new-box-pos)
        (not (is-clear ?new-box-pos)))
  )
)