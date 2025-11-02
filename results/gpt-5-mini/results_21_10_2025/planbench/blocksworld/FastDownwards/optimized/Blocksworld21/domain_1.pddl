(define (domain multiagent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)           ; ?x is on top of ?y
    (ontable ?x - block)                 ; ?x is on the table
    (clear ?x - block)                   ; nothing on top of ?x and it's not held
    (vowel ?x - block)                   ; block is a vowel (movable by vowel-agent)
    (consonant ?x - block)               ; block is a consonant (movable by consonant-agent)
    (handempty-vowel)                    ; vowel-agent's hand is empty
    (holding-vowel ?x - block)           ; vowel-agent is holding ?x
    (handempty-consonant)                ; consonant-agent's hand is empty
    (holding-consonant ?x - block)       ; consonant-agent is holding ?x
  )

  ;; Vowel-agent primitives (must obey: only A,E,I; only when hand empty; one block at a time)
  (:action vowel-pickup-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))                 ; while held, not considered clear
      (holding-vowel ?b)
      (not (handempty-vowel))
    )
  )

  (:action vowel-unstack
    :parameters (?b - block ?below - block)
    :precondition (and (vowel ?b) (on ?b ?below) (clear ?b) (handempty-vowel))
    :effect (and
      (not (on ?b ?below))
      (holding-vowel ?b)
      (not (handempty-vowel))
      (clear ?below)
      (not (clear ?b))
    )
  )

  (:action vowel-putdown-to-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  (:action vowel-stack
    :parameters (?b - block ?target - block)
    :precondition (and (vowel ?b) (holding-vowel ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  ;; Consonant-agent primitives (must obey: only consonants; one block at a time)
  (:action consonant-pickup-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty-consonant))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding-consonant ?b)
      (not (handempty-consonant))
    )
  )

  (:action consonant-unstack
    :parameters (?b - block ?below - block)
    :precondition (and (consonant ?b) (on ?b ?below) (clear ?b) (handempty-consonant))
    :effect (and
      (not (on ?b ?below))
      (holding-consonant ?b)
      (not (handempty-consonant))
      (clear ?below)
      (not (clear ?b))
    )
  )

  (:action consonant-putdown-to-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding-consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-consonant)
      (not (holding-consonant ?b))
    )
  )

  (:action consonant-stack
    :parameters (?b - block ?target - block)
    :precondition (and (consonant ?b) (holding-consonant ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (handempty-consonant)
      (not (holding-consonant ?b))
    )
  )
)