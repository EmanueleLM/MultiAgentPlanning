(define (domain block-manipulation)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (block ?x)
  )

  (:action move
    :parameters (?x ?y ?z)
    :precondition (and (block ?x) (block ?y) (block ?z) (clear ?x) (clear ?z) (on ?x ?y))
    :effect (and (on ?x ?z) (clear ?y) (not (on ?x ?y)) (not (clear ?z)))
  )

  (:action move-to-table
    :parameters (?x ?y)
    :precondition (and (block ?x) (block ?y) (clear ?x) (on ?x ?y))
    :effect (and (ontable ?x) (clear ?y) (not (on ?x ?y)))
  )
)