(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Vowel-agent actions (vowel_agent moves only vowel blocks)
  (:action vowel_agent-move-from-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?b)
            )
  )

  (:action vowel_agent-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?from)
              (clear ?b)
            )
  )

  (:action vowel_agent-move-from-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

  ;; Consonant-agent actions (consonant_agent moves only consonant blocks)
  (:action consonant_agent-move-from-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?b)
            )
  )

  (:action consonant_agent-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (not (clear ?to))
              (on ?b ?to)
              (clear ?from)
              (clear ?b)
            )
  )

  (:action consonant_agent-move-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

)