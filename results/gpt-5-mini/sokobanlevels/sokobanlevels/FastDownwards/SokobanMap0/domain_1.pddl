(define (domain jack_sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell agent box)

  (:predicates
    (at_agent ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal ?c - cell)
    (up ?above - cell ?below - cell)
    (down ?below - cell ?above - cell)
    (clear ?c - cell)
  )

  (:action move-up
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (up ?to ?from)
      (clear ?to)
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action move-down
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (down ?to ?from)
      (clear ?to)
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  (:action push-up
    :parameters (?a - agent ?b - box ?player_pos - cell ?box_pos - cell ?target - cell)
    :precondition (and
      (at_agent ?a ?player_pos)
      (at_box ?b ?box_pos)
      (up ?box_pos ?player_pos)
      (up ?target ?box_pos)
      (clear ?target)
    )
    :effect (and
      (not (at_box ?b ?box_pos))
      (at_box ?b ?target)
      (not (clear ?target))
      (clear ?box_pos)
      (not (at_agent ?a ?player_pos))
      (at_agent ?a ?box_pos)
    )
  )

  (:action push-down
    :parameters (?a - agent ?b - box ?player_pos - cell ?box_pos - cell ?target - cell)
    :precondition (and
      (at_agent ?a ?player_pos)
      (at_box ?b ?box_pos)
      (down ?box_pos ?player_pos)
      (down ?target ?box_pos)
      (clear ?target)
    )
    :effect (and
      (not (at_box ?b ?box_pos))
      (at_box ?b ?target)
      (not (clear ?target))
      (clear ?box_pos)
      (not (at_agent ?a ?player_pos))
      (at_agent ?a ?box_pos)
    )
  )
)