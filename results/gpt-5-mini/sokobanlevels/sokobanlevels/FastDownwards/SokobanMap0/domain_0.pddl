(define (domain jack_sokoban_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types cell agent box)

  (:predicates
    (at_agent ?a - agent ?c - cell)
    (at_box ?b - box ?c - cell)
    (goal ?c - cell)
    (up ?above - cell ?below - cell)
    (down ?below - cell ?above - cell)
  )

  ;; move the agent one cell up (toward smaller row index)
  (:action move-up
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (up ?to ?from)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  ;; move the agent one cell down (toward larger row index)
  (:action move-down
    :parameters (?a - agent ?from - cell ?to - cell)
    :precondition (and
      (at_agent ?a ?from)
      (down ?to ?from)
      (not (at_box box1 ?to))
    )
    :effect (and
      (not (at_agent ?a ?from))
      (at_agent ?a ?to)
    )
  )

  ;; push the box one cell up (box moves up, agent moves into box's former cell)
  (:action push-up
    :parameters (?a - agent ?b - box ?player_pos - cell ?box_pos - cell ?target - cell)
    :precondition (and
      (at_agent ?a ?player_pos)
      (at_box ?b ?box_pos)
      (up ?box_pos ?player_pos)
      (up ?target ?box_pos)
      (not (at_box ?b ?target))
    )
    :effect (and
      (not (at_box ?b ?box_pos))
      (at_box ?b ?target)
      (not (at_agent ?a ?player_pos))
      (at_agent ?a ?box_pos)
    )
  )

  ;; push the box one cell down (box moves down, agent moves into box's former cell)
  (:action push-down
    :parameters (?a - agent ?b - box ?player_pos - cell ?box_pos - cell ?target - cell)
    :precondition (and
      (at_agent ?a ?player_pos)
      (at_box ?b ?box_pos)
      (down ?box_pos ?player_pos)
      (down ?target ?box_pos)
      (not (at_box ?b ?target))
    )
    :effect (and
      (not (at_box ?b ?box_pos))
      (at_box ?b ?target)
      (not (at_agent ?a ?player_pos))
      (at_agent ?a ?box_pos)
    )
  )
)