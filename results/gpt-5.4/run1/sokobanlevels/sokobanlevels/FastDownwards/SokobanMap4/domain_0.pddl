(define (domain sokoban_corridor_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent box location)

  (:predicates
    (adjacent ?l1 - location ?l2 - location)
    (push_line ?from - location ?boxpos - location ?dest - location)
    (goal_loc ?l - location)
    (player_at ?a - agent ?l - location)
    (box_at ?b - box ?l - location)
    (clear ?l - location)
  )

  (:action move
    :parameters (?a - agent ?from - location ?to - location)
    :precondition (and
      (player_at ?a ?from)
      (adjacent ?from ?to)
      (clear ?to)
    )
    :effect (and
      (not (player_at ?a ?from))
      (player_at ?a ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action push
    :parameters (?a - agent ?b - box ?from - location ?boxpos - location ?dest - location)
    :precondition (and
      (player_at ?a ?from)
      (box_at ?b ?boxpos)
      (push_line ?from ?boxpos ?dest)
      (clear ?dest)
    )
    :effect (and
      (not (player_at ?a ?from))
      (player_at ?a ?boxpos)
      (not (box_at ?b ?boxpos))
      (box_at ?b ?dest)
      (clear ?from)
      (not (clear ?boxpos))
      (not (clear ?dest))
    )
  )
)