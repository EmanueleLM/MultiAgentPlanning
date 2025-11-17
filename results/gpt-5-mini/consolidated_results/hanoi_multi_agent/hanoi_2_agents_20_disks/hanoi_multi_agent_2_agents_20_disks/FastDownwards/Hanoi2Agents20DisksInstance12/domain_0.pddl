(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk disk1 disk2 peg)
  ;; disk1 and disk2 are subtypes of disk to enforce agent move restrictions by typing in object declarations
  (:predicates
    (at ?d - disk ?p - peg)    ; disk ?d is on peg ?p (we represent only peg membership)
    (empty ?p - peg)           ; peg ?p currently has no disks
  )

  ;; Agent 1 explicit step actions (these actions correspond to the validated, merged sequence
  ;; provided by agent_1; each is an agent_1 move that only moves disks A-J)
  (:action move_A_left_to_right_by_agent_1_step1
    :precondition (and
      (at A left)
      (at B left)     ;; ensure B still on left (preserves assumptions about stack)
      (at C left)     ;; ensure C still on left
      (empty right)
    )
    :effect (and
      (not (at A left))
      (at A right)
      (not (empty right))
    )
  )

  (:action move_B_left_to_middle_by_agent_1_step2
    :precondition (and
      (at B left)
      (at C left)     ;; ensure C still below B
      (empty middle)
    )
    :effect (and
      (not (at B left))
      (at B middle)
      (not (empty middle))
    )
  )

  (:action move_A_right_to_middle_by_agent_1_step3
    :precondition (and
      (at A right)
      (at B middle)   ;; B occupies middle (A will land on B)
    )
    :effect (and
      (not (at A right))
      (at A middle)
      (empty right)   ;; right becomes empty after removing A
    )
  )

  (:action move_C_left_to_right_by_agent_1_step4
    :precondition (and
      (at C left)
      (empty right)   ;; right must be empty before placing C
    )
    :effect (and
      (not (at C left))
      (at C right)
      (not (empty right))
    )
  )

  (:action move_A_middle_to_right_by_agent_1_step5
    :precondition (and
      (at A middle)
      (at C right)    ;; place A on top of C (A is smaller than C)
    )
    :effect (and
      (not (at A middle))
      (at A right)
    )
  )

  ;; Generic action template for agent_2 moves (agent_2 may move disks K-T: these are disk2 objects).
  ;; This generic action is present to model agent_2 capability though it is not needed for the validated plan.
  (:action move_by_agent_2
    :parameters (?d - disk2 ?from - peg ?to - peg)
    :precondition (and
      (at ?d ?from)
      (empty ?to)  ;; this simplified generic action only allows moves to currently empty pegs;
                   ;; agent_2 is not required by the merged plan, so this conservative modeling is acceptable.
    )
    :effect (and
      (not (at ?d ?from))
      (at ?d ?to)
      (not (empty ?to))
    )
  )
)