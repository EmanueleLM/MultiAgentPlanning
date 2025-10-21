(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj agent)

  (:predicates
    (on ?b - obj ?x - obj)        ; block ?b is directly on ?x (another block or table)
    (clear ?x - obj)              ; nothing on top of ?x (only meaningful for blocks)
    (vowel ?b - obj)              ; block is a vowel (A, E, I)
    (consonant ?b - obj)          ; block is a consonant
    (canmove ?a - agent ?b - obj) ; agent ?a is allowed to move block ?b
  )

  ;; Vowel-agent moves a vowel block onto another block (not table)
  (:action move-vowel-to-block
    :parameters (?a - agent ?b - obj ?from - obj ?to - obj)
    :precondition (and
      (canmove ?a ?b)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Vowel-agent moves a vowel block to the table
  (:action move-vowel-to-table
    :parameters (?a - agent ?b - obj ?from - obj)
    :precondition (and
      (canmove ?a ?b)
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )

  ;; Consonant-agent moves a consonant block onto another block (not table)
  (:action move-consonant-to-block
    :parameters (?a - agent ?b - obj ?from - obj ?to - obj)
    :precondition (and
      (canmove ?a ?b)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Consonant-agent moves a consonant block to the table
  (:action move-consonant-to-table
    :parameters (?a - agent ?b - obj ?from - obj)
    :precondition (and
      (canmove ?a ?b)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b table)
      (clear ?from)
    )
  )
)