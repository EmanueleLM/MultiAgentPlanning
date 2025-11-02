(define (domain blocksworld-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types block)

  (:constants TABLE - block)

  (:predicates
    (on ?b - block ?p - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action vowel-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
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

  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b TABLE)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b TABLE))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b TABLE)
      (clear ?from)
    )
  )

  (:action consonant-move-from-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
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

  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b TABLE)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b TABLE))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b TABLE)
      (clear ?from)
    )
  )
)