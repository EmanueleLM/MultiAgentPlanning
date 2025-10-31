(define (domain multiagent-blocks)
  (:requirements :strips :typing)
  (:types
    entity
    block - entity
    place - entity
    vowel consonant - block
  )

  (:predicates
    (on ?x - block ?y - entity)    ; block ?x is on entity ?y (another block or place)
    (clear ?x - block)             ; nothing on top of block ?x
  )

  ;; Vowel agent actions (may move only vowel-labelled blocks)
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

  ;; Consonant agent actions (may move only consonant-labelled blocks)
  ;; Consonants are constrained to be placed only on table (place) or other consonants.
  (:action consonant-move-block-to-block
    :parameters (?b - consonant ?from - block ?to - consonant)
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
    :parameters (?b - consonant ?from - place ?to - consonant)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (not (clear ?to))
    )
  )
)