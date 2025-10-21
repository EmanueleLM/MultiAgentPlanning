(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is on top of ?y
    (ontable ?x - block)             ; ?x is directly on the table
    (clear ?x - block)               ; nothing on top of ?x
    (vowel ?x - block)               ; ?x is a vowel block (A,E,I,O,U)
    (consonant ?x - block)           ; ?x is a consonant block (others)
  )

  ;; Vowel-agent actions (may move only vowel blocks; only clear/top blocks may be moved)
  (:action move-vowel-from-block-to-block
    :parameters (?b - block ?under - block ?d - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (clear ?d)
      (vowel ?b)
      (not (= ?b ?d))
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?d))
      (on ?b ?d)
      (not (clear ?b))
    )
  )

  (:action move-vowel-from-block-to-table
    :parameters (?b - block ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (vowel ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (ontable ?b)
      (not (clear ?b))
    )
  )

  (:action move-vowel-from-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?d)
      (vowel ?b)
      (not (= ?b ?d))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?d))
      (on ?b ?d)
      (not (clear ?b))
    )
  )

  ;; Consonant-agent actions (may move only consonant blocks; only clear/top blocks may be moved)
  (:action move-consonant-from-block-to-block
    :parameters (?b - block ?under - block ?d - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (clear ?d)
      (consonant ?b)
      (not (= ?b ?d))
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?d))
      (on ?b ?d)
      (not (clear ?b))
    )
  )

  (:action move-consonant-from-block-to-table
    :parameters (?b - block ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (consonant ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (ontable ?b)
      (not (clear ?b))
    )
  )

  (:action move-consonant-from-table-to-block
    :parameters (?b - block ?d - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?d)
      (consonant ?b)
      (not (= ?b ?d))
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?d))
      (on ?b ?d)
      (not (clear ?b))
    )
  )
)