(define (domain blockworld)
  (:requirements :typing :strips)

  (:types block)

  (:predicates
    (clear ?x - block)            ; block has nothing on top
    (on ?x - block ?y - block)    ; block x is directly on block y
    (on-table ?x - block)         ; block x is directly on the table
    (handempty)                   ; the hand is free
    (holding ?x - block)          ; the hand holds block x
  )

  (:action pick-up
    :parameters (?x - block)
    :precondition (and
                    (handempty)
                    (clear ?x)
                    (on-table ?x))
    :effect (and
              (not (handempty))
              (not (clear ?x))
              (not (on-table ?x))
              (holding ?x))
  )

  (:action put-down
    :parameters (?x - block)
    :precondition (holding ?x)
    :effect (and
              (handempty)
              (clear ?x)
              (on-table ?x)
              (not (holding ?x)))
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
                    (handempty)
                    (clear ?x)
                    (on ?x ?y))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (clear ?x))
              (not (on ?x ?y)))
  )

  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
                    (holding ?x)
                    (clear ?y))
    :effect (and
              (not (holding ?x))
              (handempty)
              (clear ?x)
              (on ?x ?y)
              (not (clear ?y)))
  )
)