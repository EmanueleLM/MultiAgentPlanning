(define (domain blocks-world)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place)

  (:predicates
    (on ?x - block ?y - place)    ; block ?x is on place ?y (place may be table or a block)
    (clear ?x - block)            ; nothing on top of block ?x
    (handempty)                   ; the (single) manipulator's hand is empty
    (holding ?x - block)          ; the manipulator is holding block ?x
  )

  ;; pickup a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (on ?x table) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (on ?x table))
              (not (clear ?x))
              (not (handempty))
             )
  )

  ;; put down a held block onto the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (on ?x table)
              (clear ?x)
              (handempty)
              (not (holding ?x))
             )
  )

  ;; unstack a block from another block (pick it up)
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (clear ?y)
              (not (on ?x ?y))
              (not (clear ?x))
              (not (handempty))
             )
  )

  ;; stack a held block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (handempty)
              (not (clear ?y))
              (not (holding ?x))
             )
  )
)