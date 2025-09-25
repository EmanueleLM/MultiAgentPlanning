(define (domain stacking-multiagent)
  (:requirements :strips :negative-preconditions :equality)
  (:predicates
    (on ?x ?y)        ;; ?x is on ?y (when ?y is a block)
    (ontable ?x)      ;; ?x is on the table
    (clear ?x)        ;; top of a stack / nothing on ?x
    (vowel ?x)        ;; ownership: vowel agent can move ?x
    (consonant ?x)    ;; ownership: consonant agent can move ?x
  )

  ;; Vowel agent actions (kept distinct and explicit)
  (:action vowel-move-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (on ?b ?from)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (vowel ?b)
      (clear ?b)
      (clear ?to)
      (ontable ?b)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action vowel-move-block-to-table
    :parameters (?b ?from)
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
  )

  ;; Consonant agent actions (kept distinct and explicit)
  (:action consonant-move-block-to-block
    :parameters (?b ?from ?to)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (on ?b ?from))
      (on ?b ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b ?to)
    :precondition (and
      (consonant ?b)
      (ontable ?b)
      (clear ?b)
      (clear ?to)
      (not (= ?b ?to))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?to)
      (not (clear ?to))
    )
  )

  (:action consonant-move-block-to-table
    :parameters (?b ?from)
    :precondition (and
      (consonant ?b)
      (on ?b ?from)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?from))
      (ontable ?b)
      (clear ?from)
    )
  )
)