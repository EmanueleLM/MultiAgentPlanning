(define (domain blocks-multiagent-domain)
  (:requirements :strips :typing :equality :adl)
  (:types block agent)

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  (:action vowel-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action vowel-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action vowel-move-from-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and (vowel-agent ?ag) (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?ag - agent ?b - block ?to - block)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
              (not (ontable ?b))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action consonant-move-block-to-block
    :parameters (?ag - agent ?b - block ?from - block ?to - block)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (clear ?from)
              (not (clear ?to))
              (clear ?b)
            )
  )

  (:action consonant-move-from-block-to-table
    :parameters (?ag - agent ?b - block ?from - block)
    :precondition (and (consonant-agent ?ag) (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
              (not (on ?b ?from))
              (ontable ?b)
              (clear ?from)
              (clear ?b)
            )
  )
)