(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)      ; ?x is directly on ?y
    (ontable ?x - block)            ; ?x is directly on the table
    (clear ?x - block)              ; nothing is on top of ?x
    (vowel ?x - block)              ; ?x is a vowel block (A,E,I)
    (consonant ?x - block)          ; ?x is a consonant block
  )

  ;; Vowel-agent moves a single vowel block (top-only).
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
      (clear ?b)
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
      (clear ?b)
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
      (clear ?b)
    )
  )

  ;; Consonant-agent moves a single consonant block (top-only).
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
      (clear ?b)
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
      (clear ?b)
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
      (clear ?b)
    )
  )
)