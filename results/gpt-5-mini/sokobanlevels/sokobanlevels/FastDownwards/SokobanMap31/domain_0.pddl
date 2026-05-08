(define (domain sokoban_1corridor)
  (:requirements :strips :typing :negative-preconditions)
  (:types player box position)
  (:predicates
    (at-player ?pl - player ?pos - position)
    (at-box ?b - box ?pos - position)
    (free ?pos - position)
    (adjacent ?p1 - position ?p2 - position)
    (is-goal ?pos - position)
  )

  (:action move
    :parameters (?pl - player ?from - position ?to - position)
    :precondition (and
      (at-player ?pl ?from)
      (adjacent ?from ?to)
      (free ?to)
    )
    :effect (and
      (not (at-player ?pl ?from))
      (at-player ?pl ?to)
      (free ?from)
      (not (free ?to))
    )
  )

  (:action push
    :parameters (?pl - player ?b - box ?p_from - position ?p_box - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (at-box ?b ?p_box)
      (adjacent ?p_from ?p_box)
      (adjacent ?p_box ?p_to)
      (free ?p_to)
    )
    :effect (and
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_to)
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_box)
      (not (free ?p_to))
      (free ?p_from)
      (not (free ?p_box))
    )
  )
)