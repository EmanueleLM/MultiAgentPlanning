(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block place)
  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action vowel_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (not (clear ?to)) (on ?b ?to) (clear ?from))
  )

  (:action vowel_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (ontable ?b) (clear ?from))
  )

  (:action vowel_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and (not (ontable ?b)) (not (clear ?to)) (on ?b ?to))
  )

  (:action consonant_agent-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and (not (on ?b ?from)) (not (clear ?to)) (on ?b ?to) (clear ?from))
  )

  (:action consonant_agent-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and (not (on ?b ?from)) (ontable ?b) (clear ?from))
  )

  (:action consonant_agent-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and (not (ontable ?b)) (not (clear ?to)) (on ?b ?to))
  )
)