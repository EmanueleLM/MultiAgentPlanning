(define (domain BlocksworldScaling1)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  ;; Predicates
  (:predicates
    (on ?b - block ?x - block)    ; block ?b is on block ?x
    (ontable ?b - block)          ; block ?b is on the table
    (clear ?b - block)            ; nothing on top of ?b
    (vowel ?b - block)            ; label is a vowel (A,E,I,O)
    (consonant ?b - block)        ; label is a consonant
  )

  ;; Vowel agent actions: may only move vowel-labeled blocks.
  ;; Move a vowel block from one block onto another block.
  (:action vowel-stack
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a vowel block from a block to the table.
  (:action vowel-move-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a vowel block from table onto a block.
  (:action vowel-move-from-table
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  ;; Consonant agent actions: may only move consonant-labeled blocks.
  ;; Move a consonant block from one block onto another block.
  (:action consonant-stack
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a consonant block from a block to the table.
  (:action consonant-move-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Move a consonant block from table onto a block.
  (:action consonant-move-from-table
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )
)