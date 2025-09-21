(define (domain multiagent-blocks)
  (:requirements :strips :typing :equality)
  (:types
    block - object
    vowel consonant - block
  )

  (:predicates
    (on ?blk - block ?under - block)
    (on-table ?blk - block)
    (clear ?blk - block)
  )

  (:action vowel-agent-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-agent-move-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-agent-move-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on-table ?b)
      (clear ?from)
    )
  )

  (:action consonant-agent-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-agent-move-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and
      (on-table ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-agent-move-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on-table ?b)
      (clear ?from)
    )
  )
)