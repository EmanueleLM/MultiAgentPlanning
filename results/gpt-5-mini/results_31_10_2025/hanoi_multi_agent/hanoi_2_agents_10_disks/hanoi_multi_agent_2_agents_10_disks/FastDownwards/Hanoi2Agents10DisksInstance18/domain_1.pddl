(define (domain hanoi2agents10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    ;; disk directly on place (disk or peg)
    (on ?d - disk ?p - place)
    ;; nothing on top of this place (disk or peg)
    (clear ?p - place)
    ;; size ordering: smaller d1 d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; agent move permissions (static)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
  )

  ;; Actions are concrete, named to indicate the performing agent and the specific disk move.
  ;; Each action enforces:
  ;;  - disk being moved is the top disk at its support (clear & on ...)
  ;;  - destination top (either peg or disk) is clear
  ;;  - agent permission for that disk
  ;; Effects update the direct-support (on ...) facts and clear flags so the plan's state evolves correctly.
  ;; (Only agent_1 actions are required by the proposed solution; agent_2 has no moves in the plan.)

  ;; Step 1: A from (on A B) -> (on A middle)
  (:action move_agent_1_A_left_middle
    :precondition (and
      (can-move-agent1 A)
      (on A B)
      (clear A)
      (clear middle)
    )
    :effect (and
      (not (on A B))
      (on A middle)
      (not (clear middle))
      (clear B)
    )
  )

  ;; Step 2: B from (on B C) -> (on B right)
  (:action move_agent_1_B_left_right
    :precondition (and
      (can-move-agent1 B)
      (on B C)
      (clear B)
      (clear right)
    )
    :effect (and
      (not (on B C))
      (on B right)
      (not (clear right))
      (clear C)
    )
  )

  ;; Step 3: A from (on A middle) -> (on A B)
  (:action move_agent_1_A_middle_right_place_on_B
    :precondition (and
      (can-move-agent1 A)
      (on A middle)
      (clear A)
      (clear B)
      ;; size check: A smaller than B (static in problem)
      (smaller A B)
    )
    :effect (and
      (not (on A middle))
      (on A B)
      (not (clear B))
      (clear middle)
    )
  )

  ;; Step 4: C from (on C D) -> (on C middle)
  (:action move_agent_1_C_left_middle
    :precondition (and
      (can-move-agent1 C)
      (on C D)
      (clear C)
      (clear middle)
    )
    :effect (and
      (not (on C D))
      (on C middle)
      (not (clear middle))
      (clear D)
    )
  )

  ;; Step 5: A from (on A B) -> (on A D)
  (:action move_agent_1_A_right_left_place_on_D
    :precondition (and
      (can-move-agent1 A)
      (on A B)
      (clear A)
      (clear D)
      (smaller A D)
    )
    :effect (and
      (not (on A B))
      (on A D)
      (not (clear D))
      (clear B)
    )
  )

  ;; Step 6: B from (on B right) -> (on B C)
  (:action move_agent_1_B_right_middle_place_on_C
    :precondition (and
      (can-move-agent1 B)
      (on B right)
      (clear B)
      (clear C)
      (smaller B C)
    )
    :effect (and
      (not (on B right))
      (on B C)
      (not (clear C))
      (clear right)
    )
  )

  ;; Step 7: A from (on A D) -> (on A B)
  (:action move_agent_1_A_left_middle_place_on_B
    :precondition (and
      (can-move-agent1 A)
      (on A D)
      (clear A)
      (clear B)
      (smaller A B)
    )
    :effect (and
      (not (on A D))
      (on A B)
      (not (clear B))
      (clear D)
    )
  )

  ;; Step 8: D from (on D E) -> (on D right)
  (:action move_agent_1_D_left_right
    :precondition (and
      (can-move-agent1 D)
      (on D E)
      (clear D)
      (clear right)
    )
    :effect (and
      (not (on D E))
      (on D right)
      (not (clear right))
      (clear E)
    )
  )

  ;; Step 9: A from (on A B) -> (on A D)
  (:action move_agent_1_A_middle_right_place_on_D
    :precondition (and
      (can-move-agent1 A)
      (on A B)
      (clear A)
      (clear D)
      (smaller A D)
    )
    :effect (and
      (not (on A B))
      (on A D)
      (not (clear D))
      (clear B)
    )
  )

  ;; Step 10: B from (on B C) -> (on B E)
  (:action move_agent_1_B_middle_left_place_on_E
    :precondition (and
      (can-move-agent1 B)
      (on B C)
      (clear B)
      (clear E)
      (smaller B E)
    )
    :effect (and
      (not (on B C))
      (on B E)
      (not (clear E))
      (clear C)
    )
  )

  ;; Step 11: A from (on A D) -> (on A B)
  (:action move_agent_1_A_right_left_place_on_B
    :precondition (and
      (can-move-agent1 A)
      (on A D)
      (clear A)
      (clear B)
      (smaller A B)
    )
    :effect (and
      (not (on A D))
      (on A B)
      (not (clear B))
      (clear D)
    )
  )

  ;; Step 12: C from (on C middle) -> (on C D)
  (:action move_agent_1_C_middle_right_place_on_D
    :precondition (and
      (can-move-agent1 C)
      (on C middle)
      (clear C)
      (clear D)
      (smaller C D)
    )
    :effect (and
      (not (on C middle))
      (on C D)
      (not (clear D))
      (clear middle)
    )
  )

  ;; Step 13: A from (on A B) -> (on A C)
  (:action move_agent_1_A_left_right_place_on_C
    :precondition (and
      (can-move-agent1 A)
      (on A B)
      (clear A)
      (clear C)
      (smaller A C)
    )
    :effect (and
      (not (on A B))
      (on A C)
      (not (clear C))
      (clear B)
    )
  )

)