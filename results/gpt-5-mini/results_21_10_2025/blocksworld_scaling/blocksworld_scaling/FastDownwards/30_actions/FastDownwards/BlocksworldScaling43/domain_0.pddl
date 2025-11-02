(define (domain blocksworld-multiagent)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (vowel ?x - block)
    (consonant ?x - block)
    (on ?x - block ?y - block)      ; ?x is directly on block ?y
    (ontable ?x - block)            ; ?x is directly on the table
    (clear ?x - block)              ; ?x is top/clear (can be picked or receive a block)
    (holding-vowel ?x - block)      ; vowel agent is holding ?x
    (holding-cons ?x - block)       ; consonant agent is holding ?x
    (handempty-vowel)               ; vowel agent's hand is empty
    (handempty-cons)                ; consonant agent's hand is empty
  )

  ;----------------------
  ; Vowel-agent actions
  ;----------------------

  (:action pickup-vowel-from-block
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty-vowel))
    :effect (and
              (holding-vowel ?x)
              (not (on ?x ?y))
              (not (clear ?x))
              (clear ?y)
              (not (handempty-vowel))
            )
  )

  (:action pickup-vowel-from-table
    :parameters (?x - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (handempty-vowel))
    :effect (and
              (holding-vowel ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty-vowel))
            )
  )

  (:action put-vowel-on-block
    :parameters (?x - block ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (not (holding-vowel ?x))
              (handempty-vowel)
            )
  )

  (:action put-vowel-on-table
    :parameters (?x - block)
    :precondition (and (holding-vowel ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding-vowel ?x))
              (handempty-vowel)
            )
  )

  ;----------------------
  ; Consonant-agent actions
  ;----------------------

  (:action pickup-cons-from-block
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty-cons))
    :effect (and
              (holding-cons ?x)
              (not (on ?x ?y))
              (not (clear ?x))
              (clear ?y)
              (not (handempty-cons))
            )
  )

  (:action pickup-cons-from-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty-cons))
    :effect (and
              (holding-cons ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty-cons))
            )
  )

  (:action put-cons-on-block
    :parameters (?x - block ?y - block)
    :precondition (and (holding-cons ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (not (clear ?y))
              (not (holding-cons ?x))
              (handempty-cons)
            )
  )

  (:action put-cons-on-table
    :parameters (?x - block)
    :precondition (and (holding-cons ?x))
    :effect (and
              (ontable ?x)
              (clear ?x)
              (not (holding-cons ?x))
              (handempty-cons)
            )
  )

)