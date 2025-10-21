(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types place block - place)

  (:predicates
    (on ?b - block ?p - place)    ; block ?b is directly on place ?p (place may be table or block)
    (clear ?b - block)            ; block ?b has no block on top of it (is top)
  )

  ;; Vowel-agent actions (named to indicate actor)
  (:action move-vowel-block-to-block
    :parameters (?x - block ?from - block ?to - block)
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
    :parameters (?x - block ?from - block)
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
    :parameters (?x - block ?to - block)
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

  ;; Consonant-agent actions (named distinctly)
  (:action move-consonant-block-to-block
    :parameters (?x - block ?from - block ?to - block)
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
    :parameters (?x - block ?from - block)
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
    :parameters (?x - block ?to - block)
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