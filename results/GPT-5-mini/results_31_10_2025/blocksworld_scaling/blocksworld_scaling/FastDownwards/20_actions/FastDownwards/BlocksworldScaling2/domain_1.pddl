(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel consonant)

  (:predicates
    (on ?x - block ?y - block)      ;; ?x is directly on ?y
    (ontable ?x - block)            ;; ?x is directly on the table
    (clear ?x - block)              ;; nothing is on ?x
  )

  ;; Vowel-agent actions: can only move vowels (A E I O U). Each action enforces
  ;; that the moved block is clear and that target is clear when placing on a block.
  (:action move-vowel-from-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-vowel-from-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action move-vowel-from-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )

  ;; Consonant-agent actions: can only move consonants. Same top-of-stack and single-block constraints.
  (:action move-consonant-from-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move-consonant-from-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
            )
  )

  (:action move-consonant-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
            )
  )
)