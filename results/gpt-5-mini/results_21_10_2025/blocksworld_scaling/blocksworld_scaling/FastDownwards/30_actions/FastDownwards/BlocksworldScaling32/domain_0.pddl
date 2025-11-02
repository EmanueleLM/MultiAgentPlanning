(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  ;; Predicates:
  ;; (on ?x ?y)     : block ?x is directly on block ?y
  ;; (on-table ?x)  : block ?x is directly on the table
  ;; (clear ?x)     : block ?x has nothing on top (is a top)
  ;; (vowel ?x)     : block ?x is a vowel (movable by vowel_agent)
  ;; (consonant ?x) : block ?x is a consonant (movable by consonant_agent)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Vowel-agent actions (can only move A, E, I). Actions are split
  ;; to handle the two possible sources for the moved block: from
  ;; being on another block, or from being on the table.

  ;; Move a vowel from being on a block Y to the table
  (:action vowel-move-from-block-to-table
    :parameters (?x - block ?y - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (clear ?y)
      (not (on ?x ?y))
    )
  )

  ;; Move a vowel from the table onto a target top block Z
  (:action vowel-move-from-table-onto
    :parameters (?x - block ?z - block)
    :precondition (and (vowel ?x) (on-table ?x) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on-table ?x))
      (not (clear ?z))
      (clear ?x)
    )
  )

  ;; Move a vowel from being on a block Y onto a different top block Z
  (:action vowel-move-from-block-onto
    :parameters (?x - block ?y - block ?z - block)
    :precondition (and (vowel ?x) (on ?x ?y) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?z))
      (clear ?x)
    )
  )

  ;; Consonant-agent actions (can move B,C,D,F,G,H,J,K,L,M). Same split
  ;; for moves from-block and from-table, and onto-block.

  ;; Move a consonant from being on a block Y to the table
  (:action consonant-move-from-block-to-table
    :parameters (?x - block ?y - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (clear ?y)
      (not (on ?x ?y))
    )
  )

  ;; Move a consonant from the table onto a target top block Z
  (:action consonant-move-from-table-onto
    :parameters (?x - block ?z - block)
    :precondition (and (consonant ?x) (on-table ?x) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on-table ?x))
      (not (clear ?z))
      (clear ?x)
    )
  )

  ;; Move a consonant from being on a block Y onto a different top block Z
  (:action consonant-move-from-block-onto
    :parameters (?x - block ?y - block ?z - block)
    :precondition (and (consonant ?x) (on ?x ?y) (clear ?x) (clear ?z))
    :effect (and
      (on ?x ?z)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?z))
      (clear ?x)
    )
  )
)