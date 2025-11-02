(define (domain two-agent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; Vowel-agent moves a vowel block that is clear and either on another block or on the table.
  ;; 1) Move a vowel from one block to another block (both must be clear at appropriate times).
  (:action move-vowel-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; 2) Move a vowel from the table onto another block.
  (:action move-vowel-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (vowel-agent ?ag)
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; 3) Move a vowel from a block to the table.
  (:action move-vowel-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (vowel-agent ?ag)
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

  ;; Consonant-agent moves a consonant block that is clear and either on another block or on the table.
  ;; 4) Move a consonant from one block to another block.
  (:action move-consonant-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; 5) Move a consonant from the table onto another block.
  (:action move-consonant-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (consonant-agent ?ag)
      (consonant ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; 6) Move a consonant from a block to the table.
  (:action move-consonant-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (consonant-agent ?ag)
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