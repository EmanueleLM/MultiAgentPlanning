(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block support vowel_agent consonant_agent)
  (:predicates
    (on ?b - block ?s - support)        ; block ?b is directly on support ?s (block or table)
    (ontable ?b - block)               ; block ?b is directly on the table surface
    (clear ?b - block)                 ; nothing is on top of block ?b
    (is-vowel ?b - block)              ; block ?b is a vowel-labelled block (A, E, I)
    (is-consonant ?b - block)          ; block ?b is a consonant-labelled block
  )

  ;; Vowel agent moves a top vowel block from one block to another block
  (:action vowel-move-block-to-block
    :parameters (?ag - vowel_agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Vowel agent moves a top vowel block from the table onto a block
  (:action vowel-move-table-to-block
    :parameters (?ag - vowel_agent ?b - block ?to - block)
    :precondition (and
      (is-vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Vowel agent moves a top vowel block from a block onto the table
  (:action vowel-move-block-to-table
    :parameters (?ag - vowel_agent ?b - block ?from - block)
    :precondition (and
      (is-vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; Consonant agent moves a top consonant block from one block to another block
  ;; Constraint: consonant agent will NOT place a consonant onto a vowel block (preference enforced as hard constraint)
  (:action consonant-move-block-to-block
    :parameters (?ag - consonant_agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (is-vowel ?to))    ; hard constraint: do not place consonant onto a vowel
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Consonant agent moves a top consonant block from the table onto a block
  (:action consonant-move-table-to-block
    :parameters (?ag - consonant_agent ?b - block ?to - block)
    :precondition (and
      (is-consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (is-vowel ?to))    ; hard constraint: do not place consonant onto a vowel
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  ;; Consonant agent moves a top consonant block from a block onto the table
  (:action consonant-move-block-to-table
    :parameters (?ag - consonant_agent ?b - block ?from - block)
    :precondition (and
      (is-consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)