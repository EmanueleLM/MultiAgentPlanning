(define (domain multiagent_blocks)
  (:requirements :strips :negative-preconditions :equality)
  (:predicates
    (on ?x ?y)
    (ontable ?x)
    (clear ?x)
    (vowel ?x)
    (consonant ?x)
  )

  (:action vowel-move-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (not (clear ?to))
      (on ?b ?to)
      (clear ?from)
    )
  )

  (:action vowel-move-from-table
    :parameters (?b ?to)
    :precondition (and
      (vowel ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?to))
      (on ?b ?to)
    )
  )

  (:action vowel-move-to-table
    :parameters (?b ?from)
    :precondition (and
      (vowel ?b)
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

  (:action cons-move-block-to-block
    :parameters (?x ?from ?to)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action cons-move-from-table-to-block
    :parameters (?x ?to)
    :precondition (and
      (consonant ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?to)
      (not (= ?x ?to))
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
  )

  (:action cons-move-block-to-table
    :parameters (?x ?from)
    :precondition (and
      (consonant ?x)
      (on ?x ?from)
      (clear ?x)
      (not (= ?x ?from))
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )
)