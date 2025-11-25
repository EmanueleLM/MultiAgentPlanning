(define (domain blocksworld_scaling27)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (ontable ?b - block)
    (on ?b - block ?x - block)        ; ?b is on top of ?x
    (clear ?b - block)                ; no block on top AND not currently held
    (holding ?b - block)              ; block is being held
    (handempty)                       ; hand is empty (single-handedness)
  )

  ;; Pick up a block from the table.
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (not (ontable ?b))
              (not (clear ?b))    ; holding implies not clear per spec
              (not (handempty))
            )
  )

  ;; Unstack a block from on top of another block.
  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
              (holding ?b)
              (not (on ?b ?x))
              (clear ?x)          ; removing top makes support clear
              (not (clear ?b))    ; being held makes it not clear per spec
              (not (handempty))
            )
  )

  ;; Put down a held block onto the table.
  (:action put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)          ; nothing on top when put on table
              (handempty)
              (not (holding ?b))
            )
  )

  ;; Stack a held block on top of another clear block.
  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
              (on ?b ?x)
              (not (clear ?x))    ; supporting block no longer clear
              (clear ?b)          ; placed block has nothing on top
              (handempty)
              (not (holding ?b))
            )
  )
)