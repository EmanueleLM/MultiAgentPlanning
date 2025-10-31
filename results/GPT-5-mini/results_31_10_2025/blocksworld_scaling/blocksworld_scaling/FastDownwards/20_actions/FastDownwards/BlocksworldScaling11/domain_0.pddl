(define (domain blocks-domain)
  (:requirements :strips :typing)
  (:types place agent block - place)

  (:predicates
    (on ?b - block ?p - place)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;-----------------------------
  ; Actions owned by vowel_agent
  ;-----------------------------

  ; Move a vowel block from one block to another block
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

  ; Move a vowel block from the table onto a block
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ; Move a vowel block from a block onto the table
  (:action vowel-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
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

  ;-----------------------------
  ; Actions owned by consonant_agent
  ;-----------------------------

  ; Move a consonant block from one block to another block
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

  ; Move a consonant block from the table onto a block
  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b table)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b table))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ; Move a consonant block from a block onto the table
  (:action consonant-move-from-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
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