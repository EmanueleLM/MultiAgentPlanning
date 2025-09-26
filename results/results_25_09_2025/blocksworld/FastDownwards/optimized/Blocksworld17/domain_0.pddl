(define (domain combined-blocksworld)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    ;; type/classification
    (vowel ?x - block)
    (consonant ?x - block)

    ;; spatial relations
    (on ?x - block ?y - block)    ; ?x is on top of block ?y
    (ontable ?x - block)          ; ?x is on the table

    ;; occupancy/topness
    (clear ?x - block)

    ;; robot-hand state used by consonant agent actions
    (holding ?x - block)
    (handempty)
  )

  ;; ------------------------
  ;; VOWEL agent actions
  ;; The vowel agent moves vowel blocks. These actions are kept distinct
  ;; and only require the vowel predicate (no hand).
  ;; ------------------------

  ;; Move a vowel block from one block (?from) onto another block (?to).
  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?from)
    )
  )

  ;; Move a vowel block from the table onto a block (?to).
  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
    )
  )

  ;; Move a vowel block from a block (?from) onto the table.
  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; ------------------------
  ;; CONSONANT agent actions
  ;; These are kept distinct (different names) and use a hand abstraction.
  ;; The consonant agent only moves blocks marked as consonant.
  ;; ------------------------

  ;; Pick up a consonant block from the table
  (:action consonant-pickup
    :parameters (?x - block)
    :precondition (and
      (clear ?x)
      (ontable ?x)
      (handempty)
      (consonant ?x)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
    )
  )

  ;; Unstack a consonant block from another block (pick it up)
  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (consonant ?x)
    )
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (clear ?y)
      (holding ?x)
    )
  )

  ;; Put down a held consonant block onto the table
  (:action consonant-putdown
    :parameters (?x - block)
    :precondition (and
      (holding ?x)
      (consonant ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; Stack a held consonant block onto another block
  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (consonant ?x)
    )
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (ontable ?x))
    )
  )
)