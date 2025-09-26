(define (domain combined-vowel-consonant)
  (:requirements :strips :typing :equality)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is on top of ?y
    (ontable ?x - block)              ; ?x is directly on the table
    (clear ?x - block)                ; nothing on top of ?x
    (vowel ?x - block)                ; block is a vowel (A, E, I)
    (consonant ?x - block)            ; block is a consonant (others)

    ;; Separate hand/holding predicates for each agent so actions remain distinct
    (holding-v ?x - block)            ; vowel agent is holding ?x
    (handempty-v)                     ; vowel agent's hand is empty
    (holding-c ?x - block)            ; consonant agent is holding ?x
    (handempty-c)                     ; consonant agent's hand is empty
  )

  ;; Vowel-agent actions (only act on blocks with (vowel ?x))
  (:action pickup-vowel-from-table
    :parameters (?x - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (handempty-v))
    :effect (and
      (holding-v ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-v))
    )
  )

  (:action unstack-vowel
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (handempty-v))
    :effect (and
      (holding-v ?x)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?x))
      (not (handempty-v))
    )
  )

  (:action putdown-vowel
    :parameters (?x - block)
    :precondition (and (vowel ?x) (holding-v ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-v ?x))
      (handempty-v)
    )
  )

  (:action stack-vowel
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (clear ?y) (holding-v ?x) (not (= ?x ?y)))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding-v ?x))
      (handempty-v)
    )
  )

  ;; Consonant-agent actions (only act on blocks with (consonant ?x))
  (:action pickup-consonant-from-table
    :parameters (?x - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (handempty-c))
    :effect (and
      (holding-c ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-c))
    )
  )

  (:action unstack-consonant
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (handempty-c))
    :effect (and
      (holding-c ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty-c))
    )
  )

  (:action stack-consonant
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (holding-c ?x) (clear ?y) (not (= ?x ?y)))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding-c ?x))
      (handempty-c)
    )
  )

  (:action putdown-consonant
    :parameters (?x - block)
    :precondition (and (consonant ?x) (holding-c ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-c ?x))
      (handempty-c)
    )
  )
)