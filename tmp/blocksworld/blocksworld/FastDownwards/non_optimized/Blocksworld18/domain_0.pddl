(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel agent actions (may only move vowel blocks)
  ;; Move a vowel block from one block onto another block
  (:action vowel_agent-move-block-to-block
    :parameters (?v - block ?from - block ?to - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      ;; moved block is now top / clear
      (clear ?v)
      ;; source becomes clear because top removed
      (clear ?from)
      ;; destination is no longer clear
      (not (clear ?to))
    )
  )

  ;; Move a vowel block from the table onto another block
  (:action vowel_agent-move-table-to-block
    :parameters (?v - block ?to - block)
    :precondition (and
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?v))
      (on ?v ?to)
      (clear ?v)
      (not (clear ?to))
    )
  )

  ;; Move a vowel block from on top of a block to the table
  (:action vowel_agent-move-block-to-table
    :parameters (?v - block ?from - block)
    :precondition (and
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
    )
    :effect (and
      (not (on ?v ?from))
      (ontable ?v)
      (clear ?v)
      (clear ?from)
    )
  )

  ;; Consonant agent actions (may only move consonant blocks)
  ;; Move a consonant block from one block onto another block
  (:action consonant_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      ;; moved block is now top / clear
      (clear ?b)
      ;; source becomes clear because top removed
      (clear ?from)
      ;; destination loses clear
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from the table onto another block
  (:action consonant_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (clear ?b)
      (not (clear ?to))
    )
  )

  ;; Move a consonant block from on top of a block to the table
  (:action consonant_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?b)
      (clear ?from)
    )
  )
)