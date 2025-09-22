(define (domain multiagent-vowel-consonant)
  (:requirements :strips :typing :equality :negative-preconditions :action-costs)
  (:types vowel consonant - block)
  (:predicates
    (on ?b - block ?below - block)
    (ontable ?b - block)
    (clear ?b - block)
  )

  ;; Vowel-agent actions (moves cost 1)
  (:action vowel-move-block-to-block
    :parameters (?x - vowel ?from - block ?to - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
    :cost 1
  )

  (:action vowel-move-block-to-table
    :parameters (?x - vowel ?from - block)
    :precondition (and
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
    :cost 1
  )

  (:action vowel-move-table-to-block
    :parameters (?x - vowel ?to - block)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?to)
      (not (clear ?to))
    )
    :cost 1
  )

  ;; Consonant-agent actions (moves cost 1)
  (:action cons-move-from-block-to-block
    :parameters (?b - consonant ?from - block ?to - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
    :cost 1
  )

  (:action cons-move-from-table-to-block
    :parameters (?b - consonant ?to - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?to)
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
    :cost 1
  )

  (:action cons-move-from-block-to-table
    :parameters (?b - consonant ?from - block)
    :precondition (and
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
    :cost 1
  )
)