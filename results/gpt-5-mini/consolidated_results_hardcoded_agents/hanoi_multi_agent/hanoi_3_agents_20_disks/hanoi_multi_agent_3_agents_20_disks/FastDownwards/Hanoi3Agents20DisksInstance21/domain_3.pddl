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

  ; 1) agent_1: move disk a from left to right
  (:action agent_1_move_a_left_right
    :parameters ()
    :precondition (and
      (on a left)
      (top a left)
      (empty right)
    )
    :effect (and
      (not (on a left))
      (on a right)

      (not (top a left))
      (top a right)

      ;; a was directly above b; remove that adjacency and make b the top on left
      (not (below a b))
      (top b left)

      (not (empty right))
    )
  )

  ; 2) agent_1: move disk b from left to middle
  (:action agent_1_move_b_left_middle
    :parameters ()
    :precondition (and
      (on b left)
      (top b left)
      (empty middle)
    )
    :effect (and
      (not (on b left))
      (on b middle)

      (not (top b left))
      (top b middle)

      ;; b was directly above c; remove that adjacency and make c the top on left
      (not (below b c))
      (top c left)

      (not (empty middle))
    )
  )

  ; 3) agent_1: move disk a from right to middle (place a onto b)
  (:action agent_1_move_a_right_middle
    :parameters ()
    :precondition (and
      (on a right)
      (top a right)
      (on b middle)
      (top b middle)
      (smaller a b)     ; ensure legal placement: a smaller than b
    )
    :effect (and
      (not (on a right))
      (on a middle)

      (not (top a right))
      (top a middle)

      ;; a is now directly above b on middle
      (below a b)

      ;; b is no longer top on middle
      (not (top b middle))

      ;; right becomes empty
      (empty right)
    )
  )

  ; 4) agent_1: move disk c from left to right
  (:action agent_1_move_c_left_right
    :parameters ()
    :precondition (and
      (on c left)
      (top c left)
      (empty right)
    )
    :effect (and
      (not (on c left))
      (on c right)

      (not (top c left))
      (top c right)

      ;; c was directly above d; remove that adjacency and make d the top on left
      (not (below c d))
      (top d left)

      (not (empty right))
    )
  )

  ; 5) agent_1: move disk a from middle to left (place a onto d)
  (:action agent_1_move_a_middle_left
    :parameters ()
    :precondition (and
      (on a middle)
      (top a middle)
      (on d left)
      (top d left)
      (smaller a d)     ; ensure legal placement: a smaller than d
    )
    :effect (and
      (not (on a middle))
      (on a left)

      (not (top a middle))
      (top a left)

      ;; a now directly above d on left
      (below a d)

      ;; a had been above b on middle; remove that adjacency and make b top on middle
      (not (below a b))
      (top b middle)
    )
  )

  ; 6) agent_1: move disk b from middle to right (place b onto c)
  (:action agent_1_move_b_middle_right
    :parameters ()
    :precondition (and
      (on b middle)
      (top b middle)
      (on c right)
      (top c right)
      (smaller b c)     ; ensure legal placement: b smaller than c
    )
    :effect (and
      (not (on b middle))
      (on b right)

      (not (top b middle))
      (top b right)

      ;; b now directly above c on right
      (below b c)

      ;; middle becomes empty (b was the only disk there after a moved)
      (empty middle)

      ;; c is no longer top on right (b placed above it)
      (not (top c right))
    )
  )

  ; 7) agent_1: move disk a from left to middle
  (:action agent_1_move_a_left_middle
    :parameters ()
    :precondition (and
      (on a left)
      (top a left)
      (empty middle)
    )
    :effect (and
      (not (on a left))
      (on a middle)

      (not (top a left))
      (top a middle)

      ;; remove adjacency a over d on left; d becomes top on left again
      (not (below a d))
      (top d left)

      (not (empty middle))
    )
  )

)