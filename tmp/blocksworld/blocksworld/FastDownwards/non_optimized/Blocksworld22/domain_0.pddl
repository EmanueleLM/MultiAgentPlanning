(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types block)

  (:predicates
    (on ?b - block ?x - block)
    (ontable ?b - block)
    (clear ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  ;; Actions belonging to the vowel_agent (keep names distinct)
  (:action vowel-move-table-to-block
    :parameters (?b - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?dest - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (on ?b ?from))
      (clear ?from)
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (clear ?from)
      (ontable ?b)
      (clear ?b)
    )
  )

  ;; Actions belonging to the consonant_agent (keep names distinct)
  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (consonant ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
    )
  )
)