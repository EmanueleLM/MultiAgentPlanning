(define (domain blocks-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
  )

  ;; Vowel-agent moves: block-to-block
  (:action vowel-agent-move-b2b
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (is-vowel ?x)
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

  ;; Vowel-agent: block (from block) to table
  (:action vowel-agent-move-b2t
    :parameters (?x - block ?from - block)
    :precondition (and
      (is-vowel ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )

  ;; Vowel-agent: from table to block
  (:action vowel-agent-move-t2b
    :parameters (?x - block ?to - block)
    :precondition (and
      (is-vowel ?x)
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

  ;; Consonant-agent moves: block-to-block
  (:action consonant-agent-move-b2b
    :parameters (?x - block ?from - block ?to - block)
    :precondition (and
      (is-consonant ?x)
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

  ;; Consonant-agent: block (from block) to table
  (:action consonant-agent-move-b2t
    :parameters (?x - block ?from - block)
    :precondition (and
      (is-consonant ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x table)
      (clear ?from)
    )
  )

  ;; Consonant-agent: from table to block
  (:action consonant-agent-move-t2b
    :parameters (?x - block ?to - block)
    :precondition (and
      (is-consonant ?x)
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