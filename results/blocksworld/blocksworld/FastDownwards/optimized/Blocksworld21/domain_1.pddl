(define (domain multiagent_blocks)
  (:requirements :strips :negative-preconditions :equality :action-costs)
  (:predicates
    (on ?x ?y)        ; ?x is on block ?y
    (ontable ?x)      ; ?x is on the table
    (clear ?x)        ; nothing on top of ?x
    (vowel ?x)        ; ?x is manipulable by the vowel agent
    (consonant ?x)    ; ?x is manipulable by the consonant agent
  )

  ;; Vowel-agent actions (only move vowel-marked blocks)
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
    :cost 1
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
    :cost 1
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
    :cost 1
  )

  ;; Consonant-agent actions (only move consonant-marked blocks)
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
    :cost 1
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
    :cost 1
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
    :cost 1
  )
)