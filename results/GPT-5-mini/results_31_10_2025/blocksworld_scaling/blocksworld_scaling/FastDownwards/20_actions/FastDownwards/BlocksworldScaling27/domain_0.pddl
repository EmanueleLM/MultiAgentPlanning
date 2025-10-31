(define (domain blocks-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block - place)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
  )

  ;; Vowel-agent moves
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
      (not (clear ?to))
      (clear ?from)
    )
  )

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

  ;; Consonant-agent moves
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
      (not (clear ?to))
      (clear ?from)
    )
  )

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
)