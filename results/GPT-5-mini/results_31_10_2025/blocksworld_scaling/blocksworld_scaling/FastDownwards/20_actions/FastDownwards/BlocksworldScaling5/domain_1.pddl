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

  ;; Vowel agent: move a vowel block from one block to another block
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

  ;; Vowel agent: move a vowel from the table onto a block
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

  ;; Vowel agent: move a vowel block from a block to the table
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

  ;; Consonant agent: move a consonant block from one block to another block
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

  ;; Consonant agent: move a consonant from the table onto a block
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

  ;; Consonant agent: move a consonant block from a block to the table
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