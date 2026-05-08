(define (domain sokoban_1d)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)
  (:predicates
    (at-player ?pl - player ?p - position)
    (at-box ?b - box ?p - position)
    (goal ?p - position)
    (right ?a - position ?b - position)
    (occupied ?p - position)
  )

  (:action move-right
    :parameters (?pl - player ?p_from - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (right ?p_from ?p_to)
      (not (occupied ?p_to))
    )
    :effect (and
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_to)
      (not (occupied ?p_from))
      (occupied ?p_to)
    )
  )

  (:action move-left
    :parameters (?pl - player ?p_from - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (right ?p_to ?p_from)  ; adjacency in opposite direction
      (not (occupied ?p_to))
    )
    :effect (and
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_to)
      (not (occupied ?p_from))
      (occupied ?p_to)
    )
  )

  (:action push-right
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (right ?p_player ?p_box)
      (right ?p_box ?p_target)
      (at-box ?b ?p_box)
      (not (occupied ?p_target))
    )
    :effect (and
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      (not (occupied ?p_player))
      (occupied ?p_box)
      (occupied ?p_target)
    )
  )

  (:action push-left
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (right ?p_target ?p_box)  ; p_box to p_target is left, so right p_target p_box
      (right ?p_player ?p_target) ; p_player adjacent left of box: right p_player p_target and right p_target p_box
      (at-box ?b ?p_box)
      (not (occupied ?p_target))
    )
    :effect (and
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      (not (occupied ?p_player))
      (occupied ?p_box)
      (occupied ?p_target)
    )
  )
)