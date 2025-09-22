(define (domain multiagent-blocks)
  (:requirements :strips :typing :equality :negative-preconditions :action-costs)
  (:types block agent)

  (:predicates
    (on ?b - block ?s - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (agent ?a - agent)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  ;; Vowel-agent actions (must be executed by an agent marked as vowel-agent)
  (:action vowel_agent-move-from-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?ag)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?b)
    )
    :cost 1
  )

  (:action vowel_agent-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?ag)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
    :cost 1
  )

  (:action vowel_agent-move-from-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (vowel-agent ?ag)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
    :cost 1
  )

  ;; Consonant-agent actions (must be executed by an agent marked as consonant-agent)
  (:action consonant_agent-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?ag)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
    :cost 1
  )

  (:action consonant_agent-move-from-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?ag)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
    :cost 1
  )

  (:action consonant_agent-move-from-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (consonant-agent ?ag)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
    :cost 1
  )
)