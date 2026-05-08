(define (domain multi-agent-hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)      ; disk is on peg
    (clear ?d - disk)           ; nothing on top of disk
    (empty ?p - peg)            ; peg has no disks
    (smaller ?d1 - disk ?d2 - disk) ; d1 is smaller than d2
  )

  ;; All agent_1 primitive moves used in the provided solution.
  ;; These actions are the only moves available for disks A,B,C,D (agent_1).
  ;; No actions exist here for agent_2 or agent_3 disks, so those disks cannot be moved.

  (:action agent_1_move_a_left_right
    :parameters ()
    :precondition (and
      (on a left)
      (clear a)
      (empty right)
    )
    :effect (and
      (not (on a left)) (on a right)
      (not (empty right))
      ;; Removing A from left makes B the top of left
      (clear b)
    )
  )

  (:action agent_1_move_b_left_middle
    :parameters ()
    :precondition (and
      (on b left)
      (clear b)
      (empty middle)
    )
    :effect (and
      (not (on b left)) (on b middle)
      (not (empty middle))
      ;; Removing B from left makes C the top of left
      (clear c)
    )
  )

  (:action agent_1_move_a_right_middle
    :parameters ()
    :precondition (and
      (on a right)
      (clear a)
      (on b middle)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a right)) (on a middle)
      ;; placing A onto B: B is no longer clear, A remains clear
      (not (clear b)) (clear a)
      ;; right becomes empty after removing A (A was the only disk there at this point)
      (empty right)
    )
  )

  (:action agent_1_move_c_left_right
    :parameters ()
    :precondition (and
      (on c left)
      (clear c)
      (empty right)
    )
    :effect (and
      (not (on c left)) (on c right)
      (not (empty right))
      ;; Removing C from left makes D the top of left
      (clear d)
      ;; C on empty peg is clear
      (clear c)
    )
  )

  (:action agent_1_move_a_middle_right
    :parameters ()
    :precondition (and
      (on a middle)
      (clear a)
      (on c right)
      (clear c)
      (smaller a c)
    )
    :effect (and
      (not (on a middle)) (on a right)
      ;; placing A onto C: C is no longer clear, A is clear
      (not (clear c)) (clear a)
      ;; removing A from middle reveals B
      (clear b)
    )
  )

  (:action agent_1_move_b_middle_left
    :parameters ()
    :precondition (and
      (on b middle)
      (clear b)
      (on d left)
      (clear d)
      (smaller b d)
    )
    :effect (and
      (not (on b middle)) (on b left)
      ;; placing B onto D: D is no longer clear, B is clear
      (not (clear d)) (clear b)
      ;; middle becomes empty after removing B
      (empty middle)
    )
  )

  (:action agent_1_move_a_right_left
    :parameters ()
    :precondition (and
      (on a right)
      (clear a)
      (on b left)
      (clear b)
      (smaller a b)
    )
    :effect (and
      (not (on a right)) (on a left)
      ;; placing A onto B: B is no longer clear, A is clear
      (not (clear b)) (clear a)
      ;; removing A may expose C on right (if C is there alone)
      (clear c)
    )
  )
)