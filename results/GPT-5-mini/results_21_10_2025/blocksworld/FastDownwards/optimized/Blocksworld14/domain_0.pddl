(define (domain multi_agent_stack)
  (:requirements :strips :typing :negative-preconditions)
  (:types block table)

  (:predicates
    (on ?x - block ?y - block)      ; block ?x is on block ?y
    (ontable ?x - block)            ; block ?x is on the table
    (clear ?x - block)              ; nothing on top of ?x
    (vowel ?x - block)              ; block is a vowel (moved only by vowel agent)
    (consonant ?x - block)          ; block is a consonant (moved only by consonant agent)
  )

  ;; Vowel agent actions (only operate on blocks marked (vowel ?b))

  ;; Move a vowel block from one block to another block
  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block from the table onto a block
  (:action vowel-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block from a block down to the table
  (:action vowel-move-block-to-table
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

  ;; Consonant agent actions (only operate on blocks marked (consonant ?b))

  ;; Move a consonant block from one block to another block
  (:action consonant-move-block-to-block
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
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from the table onto a block
  (:action consonant-move-from-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from a block down to the table
  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)