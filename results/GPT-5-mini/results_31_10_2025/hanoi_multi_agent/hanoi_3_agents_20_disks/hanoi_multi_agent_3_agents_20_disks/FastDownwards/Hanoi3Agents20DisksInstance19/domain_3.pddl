(define (domain hanoi_3agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?under - disk)
    (on-peg ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (allowed_agent1 ?d - disk)
    (allowed_agent2 ?d - disk)
    (allowed_agent3 ?d - disk)
    (smaller ?x - disk ?y - disk)
  )

  (:action agent_1_move_a_left_to_middle
    :parameters ()
    :precondition (and
      (on-disk A B)
      (clear-disk A)
      (clear-peg middle)
      (allowed_agent1 A)
    )
    :effect (and
      (not (on-disk A B))
      (on-peg A middle)
      (clear-disk B)
      (not (clear-peg middle))
    )
  )

  (:action agent_1_move_b_left_to_right
    :parameters ()
    :precondition (and
      (on-disk B C)
      (clear-disk B)
      (clear-peg right)
      (allowed_agent1 B)
    )
    :effect (and
      (not (on-disk B C))
      (on-peg B right)
      (clear-disk C)
      (not (clear-peg right))
    )
  )

  (:action agent_1_move_a_middle_to_right_onto_b
    :parameters ()
    :precondition (and
      (on-peg A middle)
      (on-peg B right)
      (clear-disk A)
      (clear-disk B)
      (smaller A B)
      (allowed_agent1 A)
    )
    :effect (and
      (not (on-peg A middle))
      (on-disk A B)
      (clear-peg middle)
      (not (clear-disk B))
      (clear-disk A)
    )
  )
)