(define (domain BlocksworldScaling142)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object
          block - place
          vowel consonant - block)

  (:constants table - place)

  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
  )

  ;; Vowel-agent actions (only vowel blocks may be moved)
  (:action move-vowel-block-to-block
    :parameters (?x - vowel ?from - block ?to - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?x - vowel ?to - block)
    :precondition (and
      (on ?x table)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x table))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant-agent actions (only consonant blocks may be moved)
  (:action move-consonant-block-to-block
    :parameters (?x - consonant ?from - block ?to - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?x - consonant ?from - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?x - consonant ?to - block)
    :precondition (and
      (on ?x table)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x table))
      (on ?x ?to)
      (not (clear ?to))
    )
  )
)