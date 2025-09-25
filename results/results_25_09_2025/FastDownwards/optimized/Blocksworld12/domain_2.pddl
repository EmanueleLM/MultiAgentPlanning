(define (domain multiagent_blocks)
  (:requirements :typing :strips :negative-preconditions :fluents :action-costs)
  (:types block place - object)

  (:predicates
    (on ?b - block ?s - object)
    (clear ?o - object)
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:functions (total-cost))

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action vowel-move-block-to-place
    :parameters (?b - block ?from - block ?p - place)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?p)
      (clear ?from)
      (increase (total-cost) 1)
    )
  )

  (:action vowel-move-place-to-block
    :parameters (?b - block ?p - place ?to - block)
    :precondition (and (vowel ?b) (on ?b ?p) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?p))
      (on ?b ?to)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action cons-move-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action cons-move-block-to-place
    :parameters (?b - block ?from - block ?p - place)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?p)
      (clear ?from)
      (increase (total-cost) 1)
    )
  )

  (:action cons-move-place-to-block
    :parameters (?b - block ?p - place ?to - block)
    :precondition (and (consonant ?b) (on ?b ?p) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?p))
      (on ?b ?to)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )
)