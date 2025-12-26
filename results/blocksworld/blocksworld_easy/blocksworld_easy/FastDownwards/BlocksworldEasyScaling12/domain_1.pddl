(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (hand-empty)
  )

  (:functions
    (total-cost) - number
  )

  ; 1. Pick up block B from the table
  (pick-up ?b - block)
    (:precondition (and
      (clear ?b)
      (ontable ?b)
      (hand-empty)
    ))
    (:effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (hand-empty))
      (holding ?b)
      (increase (total-cost) 1)
    ))

  ; 2. Put down block B onto the table
  (put-down ?b - block)
    (:precondition (and
      (holding ?b)
    ))
    (:effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (hand-empty)
      (increase (total-cost) 1)
    ))

  ; 3. Unstack block B from block C
  (unstack ?b - block ?c - block)
    (:precondition (and
      (on ?b ?c)
      (clear ?b)
      (hand-empty)
    ))
    (:effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (clear ?c)
      (not (hand-empty))
      (holding ?b)
      (increase (total-cost) 1)
    ))

  ; 4. Stack block B onto block C
  (stack ?b - block ?c - block)
    (:precondition (and
      (holding ?b)
      (clear ?c)
    ))
    (:effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (hand-empty)
      (increase (total-cost) 1)
    ))
)