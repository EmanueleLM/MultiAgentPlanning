(define (domain integrated-blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)        ; ?x is on ?y
    (ontable ?x - block)              ; ?x is on the table
    (clear ?x - block)                ; nothing on ?x and not being held
    (vowel ?x - block)                ; block can be moved by vowel agent
    (consonant ?x - block)            ; block can be moved by consonant agent

    ;; separate hand/holding predicates per agent to keep actions distinct
    (handempty-vowel)
    (holding-vowel ?x - block)

    (handempty-cons)
    (holding-cons ?x - block)
  )

  ;; Vowel-agent primitive actions (pick/unstack, putdown, stack)
  (:action vowel-pickup-table
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (handempty-vowel)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))            ; when held, not clear by problem definition
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel-unstack
    :parameters (?x - block ?below - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?below)
      (clear ?x)
      (handempty-vowel)
    )
    :effect (and
      (not (on ?x ?below))
      (clear ?below)
      (not (clear ?x))
      (not (handempty-vowel))
      (holding-vowel ?x)
    )
  )

  (:action vowel-putdown-table
    :parameters (?x - block)
    :precondition (and
      (vowel ?x)
      (holding-vowel ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-vowel ?x))
      (handempty-vowel)
    )
  )

  (:action vowel-stack
    :parameters (?x - block ?to - block)
    :precondition (and
      (vowel ?x)
      (holding-vowel ?x)
      (clear ?to)
    )
    :effect (and
      (on ?x ?to)
      (clear ?x)
      (not (clear ?to))
      (not (holding-vowel ?x))
      (handempty-vowel)
    )
  )

  ;; Consonant-agent primitive actions (distinct names and hand predicates)
  (:action cons-pickup-table
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (handempty-cons)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty-cons))
      (holding-cons ?x)
    )
  )

  (:action cons-unstack
    :parameters (?x - block ?below - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?below)
      (clear ?x)
      (handempty-cons)
    )
    :effect (and
      (not (on ?x ?below))
      (clear ?below)
      (not (clear ?x))
      (not (handempty-cons))
      (holding-cons ?x)
    )
  )

  (:action cons-putdown-table
    :parameters (?x - block)
    :precondition (and
      (consonant ?x)
      (holding-cons ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (not (holding-cons ?x))
      (handempty-cons)
    )
  )

  (:action cons-stack
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (holding-cons ?x)
      (clear ?to)
    )
    :effect (and
      (on ?x ?to)
      (clear ?x)
      (not (clear ?to))
      (not (holding-cons ?x))
      (handempty-cons)
    )
  )
)