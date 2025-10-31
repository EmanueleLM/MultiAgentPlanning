(define (domain blocks_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vowel consonant - block
    block table - object
  )

  (:predicates
    ; a block is directly on an object (another block or a table)
    (on ?b - block ?x - object)
    ; an object (block or table) has no block directly on it
    (clear ?o - object)
  )

  ;; Vowel agent actions (only vowels may be moved by these schemas)
  (:action move-vowel-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      ; the object we put ?b on is no longer clear
      (not (clear ?to))
      ; the source object becomes clear after removing ?b
      (clear ?from)
      ; the moved block is top (clear)
      (clear ?b)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - vowel ?from - block ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - vowel ?from - table ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-vowel-table-to-table
    :parameters (?b - vowel ?from - table ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  ;; Consonant agent actions (only consonants may be moved by these schemas)
  (:action move-consonant-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - consonant ?from - block ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - consonant ?from - table ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action move-consonant-table-to-table
    :parameters (?b - consonant ?from - table ?to - table)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )
)