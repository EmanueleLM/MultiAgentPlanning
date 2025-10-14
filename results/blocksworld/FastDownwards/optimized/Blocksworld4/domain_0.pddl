(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types block vowel-block consonant-block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Vowel-agent actions (vowel_agent can only move A E I)
  (:action vowel-move-table-to-block
    :parameters (?b - vowel-block ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      ;; ?b remains clear (nothing placed on it)
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?b - vowel-block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - vowel-block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )

  ;; Consonant-agent actions (consonant_agent can only move B C D F G H J)
  (:action consonant-move-table-to-block
    :parameters (?b - consonant-block ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?b - consonant-block ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - consonant-block ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)