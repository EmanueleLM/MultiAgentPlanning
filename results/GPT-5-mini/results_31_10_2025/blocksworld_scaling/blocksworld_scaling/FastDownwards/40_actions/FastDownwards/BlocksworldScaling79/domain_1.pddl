; Domain: blocks-orchestrator
; Assumptions / notes:
; - There is a single abstract table; on-table predicates mark blocks directly on the table.
; - All moves manipulate only top blocks; agents can move one block at a time.
; - Vowel-agent actions are prefixed with "vowel-"; consonant-agent actions are prefixed with "consonant-".
; - To avoid nonsensical self-moves, a binary predicate (distinct ?x ?y) is required (and populated in the problem).
(define (domain Blocksworld-Orch)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x immediately on ?y
    (on-table ?x - block)             ; ?x directly on the table
    (top ?x - block)                  ; ?x is the top block of its stack
    (vowel ?x - block)                ; ?x is a vowel block (A,E,I,...)
    (consonant ?x - block)            ; ?x is a consonant block
    (distinct ?x - block ?y - block)  ; ?x and ?y are distinct objects (static)
  )

  ; -----------------------
  ; Consonant-agent actions
  ; -----------------------

  (:action consonant-move-block-to-block
    :parameters (?x - block ?s - block ?d - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?s)
      (top ?x)
      (top ?d)
      (distinct ?x ?d)
      (distinct ?x ?s)
    )
    :effect (and
      (not (on ?x ?s))
      (on ?x ?d)
      (not (top ?d))
      (top ?x)
      (top ?s)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?x - block ?d - block)
    :precondition (and
      (consonant ?x)
      (on-table ?x)
      (top ?x)
      (top ?d)
      (distinct ?x ?d)
    )
    :effect (and
      (not (on-table ?x))
      (on ?x ?d)
      (not (top ?d))
      (top ?x)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?x - block ?s - block)
    :precondition (and
      (consonant ?x)
      (on ?x ?s)
      (top ?x)
      (distinct ?x ?s)
    )
    :effect (and
      (not (on ?x ?s))
      (on-table ?x)
      (top ?x)
      (top ?s)
    )
  )

  ; -----------------------
  ; Vowel-agent actions
  ; -----------------------

  (:action vowel-move-block-to-block
    :parameters (?v - block ?s - block ?d - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?s)
      (top ?v)
      (top ?d)
      (distinct ?v ?d)
      (distinct ?v ?s)
    )
    :effect (and
      (not (on ?v ?s))
      (on ?v ?d)
      (not (top ?d))
      (top ?v)
      (top ?s)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?v - block ?d - block)
    :precondition (and
      (vowel ?v)
      (on-table ?v)
      (top ?v)
      (top ?d)
      (distinct ?v ?d)
    )
    :effect (and
      (not (on-table ?v))
      (on ?v ?d)
      (not (top ?d))
      (top ?v)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?v - block ?s - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?s)
      (top ?v)
      (distinct ?v ?s)
    )
    :effect (and
      (not (on ?v ?s))
      (on-table ?v)
      (top ?v)
      (top ?s)
    )
  )

) ; end define domain