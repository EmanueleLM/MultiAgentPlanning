(define (domain mult-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)        ; block ?b is immediately on block ?s
    (ontable ?b - block)             ; block ?b is on the table (bottom of a stack)
    (clear ?b - block)               ; block ?b is top of its stack (no block on it)
    (vowel ?b - block)               ; block is vowel (A,E,I)
    (consonant ?b - block)           ; block is consonant (others)
  )

  ;; Vowel-agent actions (only manipulate vowels A,E,I). Top-only moves only.

  ;; Move vowel block from one block to another block
  (:action move-vowel-block-to-block
    :parameters (?x - block ?s - block ?t - block)
    :precondition (and (vowel ?x) (on ?x ?s) (clear ?x) (clear ?t))
    :effect (and
      (not (on ?x ?s))
      (on ?x ?t)
      (clear ?s)
      (not (clear ?t))
      (clear ?x)
      (not (ontable ?x))
    )
  )

  ;; Move vowel block from table to on top of another block
  (:action move-vowel-table-to-block
    :parameters (?x - block ?t - block)
    :precondition (and (vowel ?x) (ontable ?x) (clear ?x) (clear ?t))
    :effect (and
      (not (ontable ?x))
      (on ?x ?t)
      (not (clear ?t))
      (clear ?x)
    )
  )

  ;; Move vowel block from on top of another block to the table
  (:action move-vowel-block-to-table
    :parameters (?x - block ?s - block)
    :precondition (and (vowel ?x) (on ?x ?s) (clear ?x))
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
      (clear ?x)
    )
  )

  ;; Consonant-agent actions (only manipulate consonants). Top-only moves only.

  ;; Move consonant block from one block to another block
  (:action move-consonant-block-to-block
    :parameters (?x - block ?s - block ?t - block)
    :precondition (and (consonant ?x) (on ?x ?s) (clear ?x) (clear ?t))
    :effect (and
      (not (on ?x ?s))
      (on ?x ?t)
      (clear ?s)
      (not (clear ?t))
      (clear ?x)
      (not (ontable ?x))
    )
  )

  ;; Move consonant block from table to on top of another block
  (:action move-consonant-table-to-block
    :parameters (?x - block ?t - block)
    :precondition (and (consonant ?x) (ontable ?x) (clear ?x) (clear ?t))
    :effect (and
      (not (ontable ?x))
      (on ?x ?t)
      (not (clear ?t))
      (clear ?x)
    )
  )

  ;; Move consonant block from on top of another block to the table
  (:action move-consonant-block-to-table
    :parameters (?x - block ?s - block)
    :precondition (and (consonant ?x) (on ?x ?s) (clear ?x))
    :effect (and
      (not (on ?x ?s))
      (ontable ?x)
      (clear ?s)
      (clear ?x)
    )
  )
)