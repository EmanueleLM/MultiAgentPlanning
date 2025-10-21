(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; pick-up a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))    ; a held block is not clear
      (holding ?x)
      (not (handempty))
    )
  )

  ;; unstack a block from another block
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))    ; held blocks are not clear
      (holding ?x)
      (not (handempty))
      (clear ?y)          ; support block becomes clear once top removed
    )
  )

  ;; put a held block down onto the table
  (:action put-down
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (ontable ?x)
      (not (holding ?x))
      (handempty)
      (clear ?x)          ; on table and not held, and no block on top => clear
    )
  )

  ;; stack a held block onto another clear block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (not (holding ?x))
      (handempty)
      (not (clear ?y))    ; support block now has a block on top
      (clear ?x)          ; placed block is not held and has no block on top
      (not (ontable ?x))  ; ensure x is not marked ontable
    )
  )
)