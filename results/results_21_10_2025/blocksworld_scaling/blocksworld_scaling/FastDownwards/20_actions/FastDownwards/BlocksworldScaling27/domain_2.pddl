(define (domain blocks-multi-agent)
  (:requirements :typing :negative-preconditions)
  (:types block - place place)
  (:predicates
    (on ?b - block ?p - place)
    (clear ?p - place)
    (is-vowel ?b - block)
    (is-consonant ?b - block)
  )

  (:action vowel-agent-move-b2b
    :parameters (?x - block ?from - place ?to - place)
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

  (:action vowel-agent-move-b2t
    :parameters (?x - block ?from - place)
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

  (:action vowel-agent-move-t2b
    :parameters (?x - block ?to - place)
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

  (:action consonant-agent-move-b2b
    :parameters (?x - block ?from - place ?to - place)
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

  (:action consonant-agent-move-b2t
    :parameters (?x - block ?from - place)
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

  (:action consonant-agent-move-t2b
    :parameters (?x - block ?to - place)
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