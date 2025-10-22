(define (domain multiagent-blocks-explicit-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (on ?b - block ?p - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (at-step ?s - step)
  )

  (:action consonant-move-block-to-table
    :parameters (?s ?s2 - step ?b ?from - block)
    :precondition (and (at-step ?s) (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?s ?s2 - step ?b ?from - block)
    :precondition (and (at-step ?s) (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?s ?s2 - step ?b ?to - block)
    :precondition (and (at-step ?s) (consonant ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?s ?s2 - step ?b ?to - block)
    :precondition (and (at-step ?s) (vowel ?b) (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?s ?s2 - step ?b ?from ?to - block)
    :precondition (and (at-step ?s) (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?s ?s2 - step ?b ?from ?to - block)
    :precondition (and (at-step ?s) (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)