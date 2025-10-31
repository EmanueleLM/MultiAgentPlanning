(define (domain two-agent-hanoi-15-twoagents)
  :requirements :strips :typing :negative-preconditions
  :types diskA diskB - disk peg
  :predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?d2 - disk)
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  ;; pegs are declared as domain constants so actions can directly reference them
  :constants left middle right - peg

  ;; agent_1 moves disk A from left to right
  (:action agent_1_move_A_left_to_right
    :parameters (?a - diskA ?b - disk)
    :precondition (and
      (top left ?a)
      (on-disk ?a ?b)
      (on-peg ?b left)
      (empty right)
    )
    :effect (and
      (not (top left ?a))
      (not (on-disk ?a ?b))
      (on-peg ?a right)
      (top right ?a)
      (not (empty right))
      (top left ?b)
      (not (empty left))
    )
  )

  ;; agent_1 moves disk B from left to middle
  (:action agent_1_move_B_left_to_middle
    :parameters (?b - diskB ?below - disk)
    :precondition (and
      (top left ?b)
      (on-disk ?b ?below)
      (on-peg ?b left)
      (empty middle)
    )
    :effect (and
      (not (top left ?b))
      (not (on-peg ?b left))
      (on-peg ?b middle)
      (top middle ?b)
      (not (empty middle))
      (top left ?below)
      (not (empty left))
    )
  )

  ;; agent_1 moves disk A from right to middle placing it on top of B
  (:action agent_1_move_A_right_to_middle_on_B
    :parameters (?a - diskA ?b - diskB)
    :precondition (and
      (top right ?a)
      (on-peg ?a right)
      (top middle ?b)
      (on-peg ?b middle)
      (smaller ?a ?b)
    )
    :effect (and
      (not (on-peg ?a right))
      (not (top right ?a))
      (empty right)
      (on-disk ?a ?b)
      (not (top middle ?b))
      (top middle ?a)
      (not (empty middle))
    )
  )
)