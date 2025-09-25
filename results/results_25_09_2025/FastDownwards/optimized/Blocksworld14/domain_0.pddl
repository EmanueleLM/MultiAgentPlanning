(define (domain multiagent_blocks)
  (:requirements :strips :equality :negative-preconditions)
  (:predicates
    (on ?x ?y)        ; ?x is on top of ?y (both are blocks)
    (ontable ?x)      ; ?x is on the table
    (clear ?x)        ; nothing is on ?x (it is the top of its stack)
    (vowel ?x)        ; ?x is a vowel block (moved by vowel-agent actions)
    (consonant ?x)    ; ?x is a consonant block (moved by consonant-agent actions)
  )

  ;; VOWEL AGENT ACTIONS (kept distinct and explicit)
  (:action vowel-move-block-to-block
    :parameters (?x ?from ?y)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?y)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?y)
      (not (clear ?y))
      (clear ?from)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?x ?y)
    :precondition (and
      (vowel ?x)
      (ontable ?x)
      (clear ?x)
      (clear ?y)
    )
    :effect (and
      (not (ontable ?x))
      (on ?x ?y)
      (not (clear ?y))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?x ?from)
    :precondition (and
      (vowel ?x)
      (on ?x ?from)
      (clear ?x)
    )
    :effect (and
      (not (on ?x ?from))
      (ontable ?x)
      (clear ?from)
    )
  )

  ;; CONSONANT AGENT ACTIONS (kept distinct and explicit)
  (:action consonant-move-block-to-block
    :parameters (?x ?y ?z)
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
  )

  (:action consonant-move-table-to-block
    :parameters (?x ?y)
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
  )

  (:action consonant-move-block-to-table
    :parameters (?x ?z)
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
  )
)