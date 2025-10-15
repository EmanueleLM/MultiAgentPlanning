(define (domain blocks-multiagent)
  (:requirements :typing :negative-preconditions)
  (:types block place)
  (:predicates
    (on ?b - block ?p - (either block place))
    (clear ?p - (either block place))
    (vowel ?b - block)
    (consonant ?b - block)
  )

  (:action vowel-move-block-to-block
    :parameters (?b - block ?from - (either block place) ?to - (either block place))
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action vowel-move-block-to-place
    :parameters (?b - block ?from - (either block place) ?to - place)
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action vowel-move-place-to-block
    :parameters (?b - block ?from - place ?to - (either block place))
    :precondition (and (vowel ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action consonant-move-block-to-block
    :parameters (?b - block ?from - (either block place) ?to - (either block place))
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action consonant-move-block-to-place
    :parameters (?b - block ?from - (either block place) ?to - place)
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )

  (:action consonant-move-place-to-block
    :parameters (?b - block ?from - place ?to - (either block place))
    :precondition (and (consonant ?b) (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
              (not (on ?b ?from))
              (on ?b ?to)
              (not (clear ?to))
              (clear ?from)
              (not (clear ?b))
            )
  )
)