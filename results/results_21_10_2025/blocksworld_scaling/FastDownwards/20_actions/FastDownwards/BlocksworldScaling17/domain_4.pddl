(define (domain multiagent-blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)    ; block ?b is directly on block ?s
    (ontable ?b - block)          ; block ?b is directly on the table
    (clear ?b - block)            ; nothing on top of ?b (it is a top block)
    (vowel ?b - block)            ; block is vowel (A,E,I)
    (consonant ?b - block)            ; block is consonant (others)
  )

  ;; VOWEL agent actions: can only move vowel-labelled blocks (A, E, I).

  ;; Move a vowel block from on another block onto another top block.
  (:action vowel-move-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?s)
      (clear ?d)
    )
    :effect (and
      (not (on ?b ?s))
      (on ?b ?d)
      (clear ?s)
      (not (clear ?d))
      (clear ?b)
    )
  )

  ;; Move a vowel block from table onto another top block.
  (:action vowel-move-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?d)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?d)
      (not (clear ?d))
      (clear ?b)
    )
  )

  ;; Move a vowel block from on another block to the table.
  (:action vowel-move-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?s)
    )
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      (clear ?s)
      (clear ?b)
    )
  )

  ;; CONSONANT agent actions: can only move consonant-labelled blocks.

  ;; Move a consonant block from on another block onto another top block.
  (:action consonant-move-block-to-block
    :parameters (?b - block ?s - block ?d - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?s)
      (clear ?d)
    )
    :effect (and
      (not (on ?b ?s))
      (on ?b ?d)
      (clear ?s)
      (not (clear ?d))
      (clear ?b)
    )
  )

  ;; Move a consonant block from table onto another top block.
  (:action consonant-move-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?d)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?d)
      (not (clear ?d))
      (clear ?b)
    )
  )

  ;; Move a consonant block from on another block to the table.
  (:action consonant-move-block-to-table
    :parameters (?b - block ?s - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?s)
    )
    :effect (and
      (not (on ?b ?s))
      (ontable ?b)
      (clear ?s)
      (clear ?b)
    )
  )
)