(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)        ; ?x is on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on top of ?x and it is not being held
    (holding ?x - block)              ; the (single) hand is holding ?x
    (handempty)                       ; the (single) hand is empty
    (vowel ?x - block)                ; block is movable by the vowel agent
    (consonant ?x - block)            ; block is movable by the consonant agent
  )

  ;; Vowel-agent actions
  (:action vowel-pickup-from-table
    :parameters (?x - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action vowel-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action vowel-putdown
    :parameters (?x - block)
    :precondition (and (vowel ?x) (holding ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?x))
      (handempty)
    )
  )

  (:action vowel-stack
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (not (holding ?x))
      (handempty)
    )
  )

  ;; Consonant-agent actions
  (:action cons-pickup-from-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action cons-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action cons-putdown
    :parameters (?x - block)
    :precondition (and (consonant ?x) (holding ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding ?x))
      (handempty)
    )
  )

  (:action cons-stack
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (not (clear ?y))
      (clear ?x)
      (not (holding ?x))
      (handempty)
    )
  )
)