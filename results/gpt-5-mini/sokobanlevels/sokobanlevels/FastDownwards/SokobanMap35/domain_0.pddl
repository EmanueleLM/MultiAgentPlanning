(define (domain sokoban_1d)
  (:requirements :strips :typing)
  (:types position player box)
  (:predicates
    (at-player ?pl - player ?p - position)
    (at-box ?b - box ?p - position)
    (goal ?p - position)
    (empty ?p - position)
    (right ?a - position ?b - position)
    (left ?a - position ?b - position)
  )

  (:action move-right
    :parameters (?pl - player ?p_from - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (right ?p_from ?p_to)
      (empty ?p_to)
    )
    :effect (and
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_to)
      (empty ?p_from)
      (not (empty ?p_to))
    )
  )

  (:action move-left
    :parameters (?pl - player ?p_from - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (left ?p_from ?p_to)
      (empty ?p_to)
    )
    :effect (and
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_to)
      (empty ?p_from)
      (not (empty ?p_to))
    )
  )

  (:action push-right
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (right ?p_player ?p_box)
      (right ?p_box ?p_target)
      (at-box ?b ?p_box)
      (empty ?p_target)
    )
    :effect (and
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      (empty ?p_player)
      (not (empty ?p_box))
      (not (empty ?p_target))
    )
  )

  (:action push-left
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (left ?p_player ?p_box)
      (left ?p_box ?p_target)
      (at-box ?b ?p_box)
      (empty ?p_target)
    )
    :effect (and
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      (empty ?p_player)
      (not (empty ?p_box))
      (not (empty ?p_target))
    )
  )
)