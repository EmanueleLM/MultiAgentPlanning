(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)       ; ?x is on top of ?y
    (on-table ?x - block)            ; ?x is on the table (base)
    (clear ?x - block)               ; nothing is on ?x
    (vowel ?x - block)               ; static type: vowel block
    (consonant ?x - block)           ; static type: consonant block
    (must-place ?v - block ?t - block) ; mapping: vowel ?v must be placed on ?t (hard constraint)
  )

  ;========================
  ; VOWEL_AGENT actions
  ; Vowel moves are constrained by "must-place" mappings. This encodes the agents'
  ; stated preferences as strict constraints: vowels may only be moved onto their
  ; designated target block.
  ; All vowel moves require the vowel to be clear (top) and the destination clear.
  ; Vowels can come either from on-top-of-a-block or from the table.
  ;========================

  (:action vowel_agent-move-vowel-from-block-to-target
    :parameters (?v - block ?from - block ?t - block)
    :precondition (and
      (vowel ?v)
      (must-place ?v ?t)
      (clear ?v)
      (clear ?t)
      (on ?v ?from)
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?t)
      (not (clear ?t))
      (clear ?from)
      (clear ?v)
    )
  )

  (:action vowel_agent-move-vowel-from-table-to-target
    :parameters (?v - block ?t - block)
    :precondition (and
      (vowel ?v)
      (must-place ?v ?t)
      (on-table ?v)
      (clear ?t)
    )
    :effect (and
      (not (on-table ?v))
      (on ?v ?t)
      (not (clear ?t))
      (clear ?v)
    )
  )

  ;========================
  ; CONSONANT_AGENT actions
  ; Consonant agent may move any consonant block. They may move a consonant:
  ;  - from a block onto another block
  ;  - from a block to the table
  ;  - from the table onto a block
  ; All moves require the moved block to be clear (top) and the target (if block)
  ; to be clear. These actions follow the "one block at a time" and "top only"
  ; constraints from the reports.
  ;========================

  (:action consonant_agent-move-block-to-block
    :parameters (?b - block ?from - block ?t - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?t)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?t)
      (not (clear ?t))
      (clear ?from)
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

  (:action consonant_agent-move-from-table-to-block
    :parameters (?b - block ?t - block)
    :precondition (and
      (consonant ?b)
      (on-table ?b)
      (clear ?t)
    )
    :effect (and
      (not (on-table ?b))
      (on ?b ?t)
      (not (clear ?t))
      (clear ?b)
    )
  )

)