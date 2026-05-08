(define (domain sokoban_linear)
  (:requirements :strips :typing :negative-preconditions)
  (:types position player box)

  (:predicates
    (at-player ?pl - player ?p - position)
    (at-box ?b - box ?p - position)
    (goal ?p - position)
    (right ?a - position ?b - position)
    (free ?p - position)
  )

  ;; move the player into an adjacent free position to the right
  (:action move-right
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

  ;; move the player into an adjacent free position to the left
  (:action move-left
    :parameters (?pl - player ?p_from - position ?p_to - position)
    :precondition (and
      (at-player ?pl ?p_from)
      (right ?p_to ?p_from)  ; adjacency in opposite direction
      (free ?p_to)
    )
    :effect (and
      (not (at-player ?pl ?p_from))
      (at-player ?pl ?p_to)
      (free ?p_from)
      (not (free ?p_to))
    )
  )

  ;; push a box one step to the right: player must be left of box and target must be free
  (:action push-right
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (at-box ?b ?p_box)
      (right ?p_player ?p_box)
      (right ?p_box ?p_target)
      (free ?p_target)
    )
    :effect (and
      ;; box moves right
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      ;; player moves into the box's former position
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      ;; occupancy / free bookkeeping
      (free ?p_player)
      (not (free ?p_box))
      (not (free ?p_target))
    )
  )

  ;; push a box one step to the left: player must be right of box and target must be free
  (:action push-left
    :parameters (?pl - player ?b - box ?p_player - position ?p_box - position ?p_target - position)
    :precondition (and
      (at-player ?pl ?p_player)
      (at-box ?b ?p_box)
      (right ?p_box ?p_player)   ; p_player is right of p_box
      (right ?p_target ?p_box)   ; p_target is left of p_box
      (free ?p_target)
    )
    :effect (and
      ;; box moves left
      (not (at-box ?b ?p_box))
      (at-box ?b ?p_target)
      ;; player moves into the box's former position
      (not (at-player ?pl ?p_player))
      (at-player ?pl ?p_box)
      ;; occupancy / free bookkeeping
      (free ?p_player)
      (not (free ?p_box))
      (not (free ?p_target))
    )
  )
)