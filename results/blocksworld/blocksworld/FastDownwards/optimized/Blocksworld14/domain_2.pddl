(define (domain multiagent_blocks)
  (:requirements :strips :equality :negative-preconditions :typing :action-costs)
  (:types block)
  (:predicates
    (on ?x ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; VOWEL AGENT ACTIONS (kept distinct and explicit)
  (:action vowel-move-block-to-block
    :parameters (?x - block ?from - block ?y - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?y)
      (not (= ?x ?y))
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?from)
    )
    :cost 1
  )

  (:action vowel-move-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?y)
      (not (= ?x ?y))
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
    :cost 1
  )

  (:action vowel-move-block-to-table
    :parameters (?x - block ?from - block)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (not (= ?x ?from))
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
    :cost 1
  )

  ;; CONSONANT AGENT ACTIONS (kept distinct and explicit)
  (:action consonant-move-block-to-block
    :parameters (?x - block ?y - block ?z - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (clear ?y)
      (on ?x ?z)
      (not (= ?x ?y))
      (not (= ?x ?z))
      (not (= ?y ?z))
    )
    :effect (and
      (not (on ?x ?z))
      (on ?x ?y)
      (clear ?z)
      (not (clear ?y))
    )
    :cost 1
  )

  (:action consonant-move-table-to-block
    :parameters (?x - block ?y - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (clear ?y)
      (ontable ?x)
      (not (= ?x ?y))
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
    :cost 1
  )

  (:action consonant-move-block-to-table
    :parameters (?x - block ?z - block)
    :precondition (and
      (consonant ?x)
      (clear ?x)
      (on ?x ?z)
      (not (= ?x ?z))
    )
    :effect (and
      (not (on ?x ?z))
      (ontable ?x)
      (clear ?z)
    )
    :cost 1
  )
)