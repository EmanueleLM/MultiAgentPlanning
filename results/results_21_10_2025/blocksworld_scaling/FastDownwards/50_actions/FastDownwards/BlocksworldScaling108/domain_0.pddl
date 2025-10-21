(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is directly on block ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on ?x
    (handempty-vowel)                 ; vowel agent's hand is empty
    (handempty-consonant)             ; consonant agent's hand is empty
    (holding-vowel ?x - block)        ; vowel agent is holding ?x
    (holding-consonant ?x - block)    ; consonant agent is holding ?x
    (is-vowel ?x - block)             ; block ?x is a vowel (A,E,I,...)
    (is-consonant ?x - block)         ; block ?x is a consonant
  )

  ;; Vowel-agent picks a vowel that is on another block
  (:action pick-vowel-from-block
    :parameters (?x - block ?y - block)
    :precondition (and (is-vowel ?x) (clear ?x) (handempty-vowel) (on ?x ?y))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  ;; Vowel-agent picks a vowel that is on the table
  (:action pick-vowel-from-table
    :parameters (?x - block)
    :precondition (and (is-vowel ?x) (clear ?x) (handempty-vowel) (ontable ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  ;; Vowel-agent places held vowel onto a clear block
  (:action place-vowel-on-block
    :parameters (?x - block ?y - block)
    :precondition (and (is-vowel ?x) (holding-vowel ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding-vowel ?x))
      (handempty-vowel)
    )
  )

  ;; Vowel-agent places held vowel onto the table
  (:action place-vowel-on-table
    :parameters (?x - block)
    :precondition (and (is-vowel ?x) (holding-vowel ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-vowel ?x))
      (handempty-vowel)
    )
  )

  ;; Consonant-agent picks a consonant that is on another block
  (:action pick-consonant-from-block
    :parameters (?x - block ?y - block)
    :precondition (and (is-consonant ?x) (clear ?x) (handempty-consonant) (on ?x ?y))
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (clear ?y)
      (not (handempty-consonant))
      (holding-consonant ?x)
    )
  )

  ;; Consonant-agent picks a consonant that is on the table
  (:action pick-consonant-from-table
    :parameters (?x - block)
    :precondition (and (is-consonant ?x) (clear ?x) (handempty-consonant) (ontable ?x))
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-consonant))
      (holding-consonant ?x)
    )
  )

  ;; Consonant-agent places held consonant onto a clear block
  (:action place-consonant-on-block
    :parameters (?x - block ?y - block)
    :precondition (and (is-consonant ?x) (holding-consonant ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding-consonant ?x))
      (handempty-consonant)
    )
  )

  ;; Consonant-agent places held consonant onto the table
  (:action place-consonant-on-table
    :parameters (?x - block)
    :precondition (and (is-consonant ?x) (holding-consonant ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-consonant ?x))
      (handempty-consonant)
    )
  )

)