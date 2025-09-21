(define (domain blocks-multiagent)
  (:requirements :strips :typing :equality :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (is-vowel-agent ?a - agent)
    (is-consonant-agent ?a - agent)
  )

  (:action vowel-move-block-to-block
    :parameters (?vag - agent ?v - block ?from - block ?to - block)
    :precondition (and
      (is-vowel-agent ?vag)
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (clear ?to)
      (not (= ?v ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?v ?from))
      (on ?v ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?vag - agent ?v - block ?to - block)
    :precondition (and
      (is-vowel-agent ?vag)
      (vowel ?v)
      (ontable ?v)
      (clear ?v)
      (clear ?to)
      (not (= ?v ?to))
    )
    :effect (and
      (not (ontable ?v))
      (on ?v ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?vag - agent ?v - block ?from - block)
    :precondition (and
      (is-vowel-agent ?vag)
      (vowel ?v)
      (on ?v ?from)
      (clear ?v)
      (not (= ?v ?from))
    )
    :effect (and
      (not (on ?v ?from))
      (ontable ?v)
      (clear ?from)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?cag - agent ?b - block ?from - block ?to - block)
    :precondition (and
      (is-consonant-agent ?cag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?cag - agent ?b - block ?to - block)
    :precondition (and
      (is-consonant-agent ?cag)
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?cag - agent ?b - block ?from - block)
    :precondition (and
      (is-consonant-agent ?cag)
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (not (= ?b ?from))
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)