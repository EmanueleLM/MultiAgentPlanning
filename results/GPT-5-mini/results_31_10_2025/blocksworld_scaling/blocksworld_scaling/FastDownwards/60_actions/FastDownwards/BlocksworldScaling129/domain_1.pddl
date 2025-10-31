(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)       ; ?x is on top of ?y
    (on-table ?x - block)            ; ?x is on the table (base of a stack)
    (clear ?x - block)               ; nothing is on ?x (it is a top block)
    (vowel ?x - block)               ; static: block is vowel
    (consonant ?x - block)           ; static: block is consonant
  )

  ;========================
  ; VOWEL_AGENT actions
  ; Vowel agent may only move vowel-labelled blocks.
  ; All moves require the moved block to be clear (top). When moving onto a block
  ; the destination must be clear. Effects maintain clear/on/on-table consistency.
  ;========================

  (:action vowel_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action vowel_agent-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (on-table ?b)
      (clear ?to)
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (on-table ?b)
      (clear ?from)
      (clear ?b)
    )
  )

  ;========================
  ; CONSONANT_AGENT actions
  ; Consonant agent may only move consonant-labelled blocks.
  ; Same top-only and single-block constraints enforced.
  ;========================

  (:action consonant_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant_agent-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on-table ?b)
      (clear ?to)
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (on-table ?b)
      (clear ?from)
      (clear ?b)
    )
  )

)