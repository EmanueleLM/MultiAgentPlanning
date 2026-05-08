(define (domain blocks-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; block ?x is on block ?y
    (on-table ?x - block)           ; block ?x is on the table
    (clear ?x - block)              ; nothing on top of ?x
    (holding ?x - block)            ; agent is holding ?x
    (handempty)                     ; agent's hand is empty
  )

  ;; Pick a clear block up from the table into the hand
  (:action pick-up
    :parameters (?x - block)
    :precondition (and (on-table ?x) (clear ?x) (handempty))
    :effect (and
              (holding ?x)
              (not (on-table ?x))
              (not (clear ?x))
              (not (handempty))
             )
  )

  ;; Put a held block down on the table
  (:action put-down
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (on-table ?x)
              (clear ?x)
              (handempty)
              (not (holding ?x))
             )
  )

  ;; Unstack a clear block from on top of another block into the hand
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

  ;; Stack a held block onto a clear block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (handempty)
              (not (holding ?x))
             )
  )
)