(define (domain multiagent-blocks)
  (:requirements :typing :negative-preconditions)
  (:types block place - object vowel consonant - block)
  (:predicates
    (on ?b - block ?x - object)
    (clear ?b - block)
  )

  (:action vowel-move-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-place-to-block
    :parameters (?b - vowel ?p - place ?to - block)
    :precondition (and (on ?b ?p) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?p))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action vowel-move-block-to-place
    :parameters (?b - vowel ?from - block ?p - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?p)
      (clear ?from)
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-place-to-block
    :parameters (?b - consonant ?p - place ?to - block)
    :precondition (and (on ?b ?p) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?p))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
    )
  )

  (:action consonant-move-block-to-place
    :parameters (?b - consonant ?from - block ?p - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?p)
      (clear ?from)
      (clear ?b)
    )
  )
)