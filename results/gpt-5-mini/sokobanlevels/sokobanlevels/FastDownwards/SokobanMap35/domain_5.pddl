(define (domain sokoban_map35)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)

  (:predicates
    (at-player ?pl - player ?p - position)
    (at-box ?b - box ?p - position)
    (goal ?p - position)
    (right ?a - position ?b - position)
    (free ?p - position)
  )

  ;; move player right into adjacent free position
  (:action move_right
    :parameters (?pl - player ?p_from - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (right ?p_from ?p_to)
      (free ?p_to)
    )
    :effect (and
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_to)
      (free ?p_from)
      (not (free ?p_to))
    )
  )

  ;; move player left into adjacent free position (uses right relation reversed)
  (:action move_left
    :parameters (?pl - player ?p_from - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (right ?p_to ?p_from)
      (free ?p_to)
    )
    :effect (and
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_to)
      (free ?p_from)
      (not (free ?p_to))
    )
  )

  ;; push box right (player is left of box)
  (:action push_right
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (at-box ?b ?p_box)
      (right ?p_player ?p_box)
      (right ?p_box ?p_target)
      (free ?p_target)
    )
    :effect (and
      ;; box moves from p_box to p_target
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      ;; player moves into former box position
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      ;; occupancy bookkeeping
      (free ?p_player)
      (not (free ?p_box))
      (not (free ?p_target))
    )
  )

  ;; push box left (player is right of box)
  (:action push_left
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (at-box ?b ?p_box)
      (right ?p_box ?p_player)
      (right ?p_target ?p_box)
      (free ?p_target)
    )
    :effect (and
      ;; box moves from p_box to p_target
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      ;; player moves into former box position
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      ;; occupancy bookkeeping
      (free ?p_player)
      (not (free ?p_box))
      (not (free ?p_target))
    )
  )
)