(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?p - block)       ; ?b is directly on ?p (p can be TABLE or another block)
    (clear ?b - block)              ; nothing on ?b (top of its stack)
    (vowel ?b - block)              ; block is vowel (A,E,I)
    (consonant ?b - block)          ; block is consonant (others)
  )

  ;----------------------------------------------------------------
  ; Actions owned by vowel_agent (can move only vowel-labeled blocks)
  ;----------------------------------------------------------------

  ; Move a vowel block from one block onto another block (both non-TABLE blocks allowed)
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

  ; Move a vowel block from the TABLE onto a block
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

  ; Move a vowel block from a block onto the TABLE
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

  ;----------------------------------------------------------------
  ; Actions owned by consonant_agent (can move only consonant-labeled blocks)
  ;----------------------------------------------------------------

  ; Move a consonant block from one block onto another block
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

  ; Move a consonant block from the TABLE onto a block
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

  ; Move a consonant block from a block onto the TABLE
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