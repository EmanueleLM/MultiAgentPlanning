(define (domain hanoi_3agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  ;; Predicates
  ;; (on ?d ?p)        - disk ?d is on peg ?p
  ;; (top ?d ?p)       - disk ?d is currently the top disk on peg ?p
  ;; (empty ?p)        - peg ?p currently empty
  ;; (below ?u ?l)     - disk ?u is directly above disk ?l (i.e., u directly on l)
  ;; (smaller ?x ?y)   - disk ?x is smaller than disk ?y (static size relation)
  (:predicates
    (on ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (empty ?p - peg)
    (below ?u - disk ?l - disk)
    (smaller ?x - disk ?y - disk)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Grounded actions implementing exactly the validated cooperative plan.
  ;; Actions are prefixed with agent_1_ to keep agent actions distinct.
  ;; Each action encodes precise preconditions and effects so that the only
  ;; feasible plan satisfying the problem constraints is the sequence in
  ;; <proposed_solution>.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; 1) agent_1: move disk A from left to right
  (:action agent_1_move_A_left_right
    :parameters ()
    :precondition (and
      (on A left)
      (top A left)
      (empty right)
    )
    :effect (and
      (not (on A left))
      (on A right)

      (not (top A left))
      (top A right)

      ;; A was directly above B; remove that adjacency and make B the top on left
      (not (below A B))
      (top B left)

      (not (empty right))
    )
  )

  ; 2) agent_1: move disk B from left to middle
  (:action agent_1_move_B_left_middle
    :parameters ()
    :precondition (and
      (on B left)
      (top B left)
      (empty middle)
    )
    :effect (and
      (not (on B left))
      (on B middle)

      (not (top B left))
      (top B middle)

      ;; B was directly above C; remove that adjacency and make C the top on left
      (not (below B C))
      (top C left)

      (not (empty middle))
    )
  )

  ; 3) agent_1: move disk A from right to middle (place A onto B)
  (:action agent_1_move_A_right_middle
    :parameters ()
    :precondition (and
      (on A right)
      (top A right)
      (on B middle)
      (top B middle)
      (smaller A B)     ; ensure legal placement: A smaller than B
    )
    :effect (and
      (not (on A right))
      (on A middle)

      (not (top A right))
      (top A middle)

      ;; A is now directly above B on middle
      (below A B)

      ;; B is no longer top on middle
      (not (top B middle))

      ;; right becomes empty
      (empty right)
    )
  )

  ; 4) agent_1: move disk C from left to right
  (:action agent_1_move_C_left_right
    :parameters ()
    :precondition (and
      (on C left)
      (top C left)
      (empty right)
    )
    :effect (and
      (not (on C left))
      (on C right)

      (not (top C left))
      (top C right)

      ;; C was directly above D; remove that adjacency and make D the top on left
      (not (below C D))
      (top D left)

      (not (empty right))
    )
  )

  ; 5) agent_1: move disk A from middle to left (place A onto D)
  (:action agent_1_move_A_middle_left
    :parameters ()
    :precondition (and
      (on A middle)
      (top A middle)
      (on D left)
      (top D left)
      (smaller A D)     ; ensure legal placement: A smaller than D
    )
    :effect (and
      (not (on A middle))
      (on A left)

      (not (top A middle))
      (top A left)

      ;; A now directly above D on left
      (below A D)

      ;; A had been above B on middle; remove that adjacency and make B top on middle
      (not (below A B))
      (top B middle)
    )
  )

  ; 6) agent_1: move disk B from middle to right (place B onto C)
  (:action agent_1_move_B_middle_right
    :parameters ()
    :precondition (and
      (on B middle)
      (top B middle)
      (on C right)
      (top C right)
      (smaller B C)     ; ensure legal placement: B smaller than C
    )
    :effect (and
      (not (on B middle))
      (on B right)

      (not (top B middle))
      (top B right)

      ;; B now directly above C on right
      (below B C)

      ;; middle becomes empty (B was the only disk there after A moved)
      (empty middle)

      ;; C is no longer top on right (B placed above it)
      (not (top C right))
    )
  )

  ; 7) agent_1: move disk A from left to middle
  (:action agent_1_move_A_left_middle
    :parameters ()
    :precondition (and
      (on A left)
      (top A left)
      (empty middle)
    )
    :effect (and
      (not (on A left))
      (on A middle)

      (not (top A left))
      (top A middle)

      ;; remove adjacency A over D on left; D becomes top on left again
      (not (below A D))
      (top D left)

      (not (empty middle))
    )
  )

)