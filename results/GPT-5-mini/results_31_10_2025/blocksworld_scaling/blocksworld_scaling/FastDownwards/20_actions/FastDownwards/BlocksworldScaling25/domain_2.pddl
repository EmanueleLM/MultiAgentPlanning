(define (domain blocksworld-scaling25)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    block place - object
    vowel consonant - block
  )

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
    )
  )

  (:action vowel-move-block-to-place
    :parameters (?b - vowel ?from - block ?to - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action vowel-move-place-to-block
    :parameters (?b - vowel ?from - place ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
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
    )
  )

  (:action consonant-move-block-to-place
    :parameters (?b - consonant ?from - block ?to - place)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action consonant-move-place-to-block
    :parameters (?b - consonant ?from - place ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)