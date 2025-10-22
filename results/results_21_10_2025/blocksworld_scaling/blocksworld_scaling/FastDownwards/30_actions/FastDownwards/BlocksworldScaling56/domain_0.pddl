(define (domain blocks-vowel-consonant)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)
  ;; vowel and consonant are subtypes of block
  (:predicates
    (on ?x - block ?y - block)        ; immediate support: x is on y
    (ontable ?x - block)              ; x is directly on the table (bottom of a stack)
    (clear ?x - block)                ; nothing on x (x is clear / no block above)
    (top ?x - block)                  ; x is a top-of-stack element (synonymous with clear for this domain)
  )

  ;; VOWEL AGENT ACTIONS
  ;; Move a vowel block from being on another block to the table
  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and
      (clear ?x)            ; must be top (no block above)
      (on ?x ?from)         ; currently on another block
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (top ?from)
      ;; ?x remains clear/top (still top after moving)
      (clear ?x)
      (top ?x)
    )
  )

  ;; Move a vowel block from the table onto another block
  (:action vowel-move-table-to-block
    :parameters (?x - vowel ?dest - block)
    :precondition (and
      (clear ?x)
      (ontable ?x)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?dest)
      (not (clear ?dest))
      (not (top ?dest))
      (clear ?x)
      (top ?x)
    )
  )

  ;; Move a vowel block from currently on some block onto another block
  (:action vowel-move-block-to-block
    :parameters (?x - vowel ?from - block ?dest - block)
    :precondition (and
      (clear ?x)
      (on ?x ?from)
      (clear ?dest)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?dest)
      (clear ?from)
      (top ?from)
      (not (clear ?dest))
      (not (top ?dest))
      (clear ?x)
      (top ?x)
    )
  )

  ;; CONSONANT AGENT ACTIONS
  ;; Move a consonant block from being on another block to the table
  (:action consonant-move-block-to-table
    :parameters (?x - consonant ?from - block)
    :precondition (and
      (clear ?x)
      (on ?x ?from)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
      (top ?from)
      (clear ?x)
      (top ?x)
    )
  )

  ;; Move a consonant block from the table onto another block
  (:action consonant-move-table-to-block
    :parameters (?x - consonant ?dest - block)
    :precondition (and
      (clear ?x)
      (ontable ?x)
      (clear ?dest)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?dest)
      (not (clear ?dest))
      (not (top ?dest))
      (clear ?x)
      (top ?x)
    )
  )

  ;; Move a consonant block from currently on some block onto another block
  (:action consonant-move-block-to-block
    :parameters (?x - consonant ?from - block ?dest - block)
    :precondition (and
      (clear ?x)
      (on ?x ?from)
      (clear ?dest)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?dest)
      (clear ?from)
      (top ?from)
      (not (clear ?dest))
      (not (top ?dest))
      (clear ?x)
      (top ?x)
    )
  )
)