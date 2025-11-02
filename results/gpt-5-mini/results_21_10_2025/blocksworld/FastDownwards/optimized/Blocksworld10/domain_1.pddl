(define (domain multiagent_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)     ; ?x is on top of block ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on ?x AND ?x is not being held
    (vowel ?x - block)            ; ?x is a vowel block (moved by vowel_agent)
    (consonant ?x - block)        ; ?x is a consonant block (moved by consonant_agent)
    (handempty-v)                 ; vowel_agent's hand is empty
    (handempty-c)                 ; consonant_agent's hand is empty
    (holding-v ?x - block)        ; vowel_agent is holding block ?x
    (holding-c ?x - block)        ; consonant_agent is holding block ?x
  )

  ;; -------------------------
  ;; Vowel agent actions (A, E, I, O)
  ;; -------------------------

  (:action vowel-unstack
    :parameters (?b - block ?under - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?under)
      (clear ?b)
      (handempty-v)
    )
    :effect (and
      (not (on ?b ?under))
      (holding-v ?b)
      (not (clear ?b))
      (clear ?under)
      (not (handempty-v))
    )
  )

  (:action vowel-pickup-table
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (handempty-v)
    )
    :effect (and
      (not (ontable ?b))
      (holding-v ?b)
      (not (clear ?b))
      (not (handempty-v))
    )
  )

  (:action vowel-putdown
    :parameters (?b - block)
    :precondition (and
      (vowel ?b)
      (holding-v ?b)
    )
    :effect (and
      (ontable ?b)
      (not (holding-v ?b))
      (handempty-v)
      (clear ?b)
    )
  )

  (:action vowel-stack
    :parameters (?b - block ?target - block)
    :precondition (and
      (vowel ?b)
      (holding-v ?b)
      (clear ?target)
    )
    :effect (and
      (not (holding-v ?b))
      (on ?b ?target)
      (not (clear ?target))
      (handempty-v)
      (clear ?b)
    )
  )

  ;; -------------------------
  ;; Consonant agent actions (all other letters)
  ;; -------------------------

  (:action consonant-unstack
    :parameters (?b - block ?under - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?under)
      (clear ?b)
      (handempty-c)
    )
    :effect (and
      (not (on ?b ?under))
      (holding-c ?b)
      (not (clear ?b))
      (clear ?under)
      (not (handempty-c))
    )
  )

  (:action consonant-pickup-table
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (handempty-c)
    )
    :effect (and
      (not (ontable ?b))
      (holding-c ?b)
      (not (clear ?b))
      (not (handempty-c))
    )
  )

  (:action consonant-putdown
    :parameters (?b - block)
    :precondition (and
      (consonant ?b)
      (holding-c ?b)
    )
    :effect (and
      (ontable ?b)
      (not (holding-c ?b))
      (handempty-c)
      (clear ?b)
    )
  )

  (:action consonant-stack
    :parameters (?b - block ?target - block)
    :precondition (and
      (consonant ?b)
      (holding-c ?b)
      (clear ?target)
    )
    :effect (and
      (not (holding-c ?b))
      (on ?b ?target)
      (not (clear ?target))
      (handempty-c)
      (clear ?b)
    )
  )

)