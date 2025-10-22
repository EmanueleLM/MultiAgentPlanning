; Domain: blocks-orchestrator
; Minimal explicit assumptions documented:
; - The table is unbounded: any action that places a block "on-table" is allowed and does not require named table spots.
; - Vowel-agent actions are forbidden from placing a vowel onto a consonant unless that consonant has been marked as "settled" (i.e., placed in its final goal support). This encodes the agents' stated hard preference as a strict constraint.
; - A generic "settle" action is available that makes a consonant settled only when that consonant currently sits on its specified final support and is top. Moving a consonant clears its settled flag.
; - No special equality/inequality operator is used; planners should avoid nonsensical self-moves.
(define (domain blocks-orch)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; x is immediately on y
    (on-table ?x - block)             ; x is directly on the table
    (top ?x - block)                  ; x is the top block of its stack
    (vowel ?x - block)                ; x is a vowel (A,E,I,...)
    (consonant ?x - block)            ; x is a consonant
    (settled ?x - block)              ; x has been placed in its final support and should not be moved by vowels
    (final ?x - block ?y - block)     ; relation saying x's final support should be y (used by settle action)
  )

  ; -----------------------
  ; Consonant general moves
  ; -----------------------
  ; Move a consonant from being on another block s to being on new block d (both s and d are blocks)
  (:action consonant-move-block-to-block
    :parameters (?x - block ?s - block ?d - block)
    :precondition (and (consonant ?x) (on ?x ?s) (top ?x) (top ?d))
    :effect (and
      (not (on ?x ?s))
      (on ?x ?d)
      (not (top ?d))
      (top ?x)
      (top ?s)
      (not (settled ?x))  ; moving clears any settled status
    )
  )

  ; Move a consonant from table to on top of block d
  (:action consonant-move-table-to-block
    :parameters (?x - block ?d - block)
    :precondition (and (consonant ?x) (on-table ?x) (top ?x) (top ?d))
    :effect (and
      (not (on-table ?x))
      (on ?x ?d)
      (not (top ?d))
      (top ?x)
      (not (settled ?x))
    )
  )

  ; Move a consonant from on block s to table
  (:action consonant-move-block-to-table
    :parameters (?x - block ?s - block)
    :precondition (and (consonant ?x) (on ?x ?s) (top ?x))
    :effect (and
      (not (on ?x ?s))
      (on-table ?x)
      (top ?x)
      (top ?s)
      (not (settled ?x))
    )
  )

  ; -----------------------
  ; Vowel moves (restricted)
  ; -----------------------
  ; Vowel moves are split by source type (on-block or on-table) and destination type.
  ; Placing a vowel onto a consonant requires that the consonant be settled. Placing onto a vowel has no such restriction.

  ; Vowel: from block s to table
  (:action vowel-move-block-to-table
    :parameters (?v - block ?s - block)
    :precondition (and (vowel ?v) (on ?v ?s) (top ?v))
    :effect (and
      (not (on ?v ?s))
      (on-table ?v)
      (top ?v)
      (top ?s)
    )
  )

  ; Vowel: from table to a vowel destination d
  (:action vowel-move-table-to-vowel
    :parameters (?v - block ?d - block)
    :precondition (and (vowel ?v) (on-table ?v) (top ?v) (top ?d) (vowel ?d))
    :effect (and
      (not (on-table ?v))
      (on ?v ?d)
      (not (top ?d))
      (top ?v)
    )
  )

  ; Vowel: from block s to a vowel destination d
  (:action vowel-move-block-to-vowel
    :parameters (?v - block ?s - block ?d - block)
    :precondition (and (vowel ?v) (on ?v ?s) (top ?v) (top ?d) (vowel ?d))
    :effect (and
      (not (on ?v ?s))
      (on ?v ?d)
      (not (top ?d))
      (top ?v)
      (top ?s)
    )
  )

  ; Vowel: from table to a consonant destination d that has been settled (strict constraint)
  (:action vowel-move-table-to-settled-consonant
    :parameters (?v - block ?d - block)
    :precondition (and (vowel ?v) (on-table ?v) (top ?v) (top ?d) (consonant ?d) (settled ?d))
    :effect (and
      (not (on-table ?v))
      (on ?v ?d)
      (not (top ?d))
      (top ?v)
    )
  )

  ; Vowel: from block s to a consonant destination d that has been settled
  (:action vowel-move-block-to-settled-consonant
    :parameters (?v - block ?s - block ?d - block)
    :precondition (and (vowel ?v) (on ?v ?s) (top ?v) (top ?d) (consonant ?d) (settled ?d))
    :effect (and
      (not (on ?v ?s))
      (on ?v ?d)
      (not (top ?d))
      (top ?v)
      (top ?s)
    )
  )

  ; -----------------------
  ; Consonant settle action (generic)
  ; Marks a consonant as settled when it is on its final support and top.
  ; The relation (final x y) is a static fact in the problem instance identifying x's final support y.
  ; -----------------------
  (:action consonant-settle
    :parameters (?x - block ?s - block)
    :precondition (and (consonant ?x) (on ?x ?s) (top ?x) (final ?x ?s))
    :effect (and
      (settled ?x)
    )
  )

) ; end define domain