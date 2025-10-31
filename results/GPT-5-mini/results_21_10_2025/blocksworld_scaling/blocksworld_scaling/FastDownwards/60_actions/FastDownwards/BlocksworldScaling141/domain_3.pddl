(define (domain BlocksworldScaling141)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types block - object
          vowel consonant - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )
  (:functions (total-cost))

  (:action move-vowel-block-to-block
    :parameters (?b - vowel ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action move-vowel-table-to-block
    :parameters (?b - vowel ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action move-vowel-block-to-table
    :parameters (?b - vowel ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action move-consonant-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and (on ?b ?from) (clear ?b) (clear ?to))
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action move-consonant-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and (ontable ?b) (clear ?b) (clear ?to))
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
      (clear ?b)
      (increase (total-cost) 1)
    )
  )

  (:action move-consonant-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and (on ?b ?from) (clear ?b))
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
      (clear ?b)
      (increase (total-cost) 1)
    )
  )
)