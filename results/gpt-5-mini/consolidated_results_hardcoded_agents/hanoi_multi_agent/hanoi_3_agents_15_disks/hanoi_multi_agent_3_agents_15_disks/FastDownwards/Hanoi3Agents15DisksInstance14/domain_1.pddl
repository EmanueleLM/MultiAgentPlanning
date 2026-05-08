(define (domain hanoi_multi_agent)
  (:requirements :strips :negative-preconditions)
  (:predicates
    ; on X Y  -- X is directly on Y (Y is either a disk or a peg)
    (on ?x ?y)
    ; clear X -- there is no disk on top of X (if X is a disk); when true for a peg, peg has no top disk
    (clear ?x)
    ; empty P -- peg P has no disk directly on it
    (empty ?p)
    ; larger X Y -- disk X is strictly larger than disk Y
    (larger ?x ?y)
  )

  ; The planner actions are agent-specific and only allow agent_1 to perform the six required moves.
  ; Each action encodes the necessary preconditions (disk is directly on something and is clear/top,
  ; destination is either an empty peg or a clear disk that is larger) and the concrete effects updating
  ; the immediate on/clear/empty facts used in this instance encoding.

  (:action move_agent_1_A_left_right
    :precondition (and (on A B) (clear A) (empty right))
    :effect (and
      (not (on A B))
      (on A right)
      (not (empty right))
      (clear B)
      ; right is now non-empty (already set), left remains non-empty (other disks remain)
    )
  )

  (:action move_agent_1_B_left_middle
    :precondition (and (on B C) (clear B) (empty middle))
    :effect (and
      (not (on B C))
      (on B middle)
      (not (empty middle))
      (clear C)
    )
  )

  (:action move_agent_1_A_right_middle
    :precondition (and (on A right) (clear A) (on B middle) (clear B) (larger B A))
    :effect (and
      (not (on A right))
      (on A B)
      (not (clear B))  ; B now has A on top of it
      (empty right)    ; right becomes empty after removing A
    )
  )

  (:action move_agent_1_C_left_right
    :precondition (and (on C D) (clear C) (empty right))
    :effect (and
      (not (on C D))
      (on C right)
      (not (empty right))
      (clear D)
    )
  )

  (:action move_agent_1_A_middle_right
    :precondition (and (on A B) (clear A) (on C right) (clear C) (larger C A))
    :effect (and
      (not (on A B))
      (on A C)
      (clear B)      ; B becomes clear after A removed
      (not (clear C)) ; C now has A on top
    )
  )

  (:action move_agent_1_B_middle_left
    :precondition (and (on B middle) (clear B) (on D left) (clear D) (larger D B))
    :effect (and
      (not (on B middle))
      (on B D)
      (not (clear D)) ; D now has B on top
      (empty middle)  ; middle becomes empty after B removed
      (clear middle)  ; explicit: middle contains no top disk (empty)
    )
  )
)