(define (domain combined-blocksworld)
  (:requirements :strips :typing :action-costs :equality)
  (:types block)

  (:predicates
    (vowel ?x - block)
    (consonant ?x - block)
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  (:action move-vowel-block-to-block
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?b ?from))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?from)
    )
    :cost 1
  )

  (:action move-vowel-table-to-block
    :parameters (?b - block ?to - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (ontable ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
    )
    :cost 1
  )

  (:action move-vowel-block-to-table
    :parameters (?b - block ?from - block)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (on ?b ?from)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
    :cost 1
  )

  (:action consonant-pickup
    :parameters (?x - block)
    :precondition (and
      (clear ?x)
      (ontable ?x)
      (handempty)
      (consonant ?x)
    )
    :effect (and
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
      (holding ?x)
    )
    :cost 1
  )

  (:action consonant-unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (consonant ?x)
    )
    :effect (and
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (clear ?y)
      (holding ?x)
    )
    :cost 1
  )

  (:action consonant-putdown
    :parameters (?x - block)
    :precondition (and
      (holding ?x)
      (consonant ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
    :cost 1
  )

  (:action consonant-stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding ?x)
      (clear ?y)
      (consonant ?x)
    )
    :effect (and
      (not (clear ?y))
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (ontable ?x))
    )
    :cost 1
  )
)