(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Actions executable only by the vowel-handling agent (vowel_agent).
  ;; These actions can only manipulate blocks labeled as vowels (A, E, I).
  (:action vowel-stack
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel-stack-from-table
    :parameters (?x - block ?to - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-unstack-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

  ;; Actions executable only by the consonant-handling agent (consonant_agent).
  ;; These actions can only manipulate blocks labeled as consonants.
  (:action consonant-stack
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-stack-from-table
    :parameters (?x - block ?to - block)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-unstack-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

)