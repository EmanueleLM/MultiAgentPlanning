(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
  )

  ;; Vowel actions
  (:action vowel-move-on-to-block
    :parameters (?b - vowel ?under - block ?dest - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
      (not (= ?under ?dest))
    )
    :effect (and
      (not (on ?b ?under))
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?under)
      (clear ?b)
    )
  )

  (:action vowel-move-on-to-table
    :parameters (?b - vowel ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (ontable ?b)
      (clear ?under)
      (clear ?b)
    )
  )

  (:action vowel-move-table-to-block
    :parameters (?b - vowel ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?b)
    )
  )

  ;; Consonant actions
  (:action consonant-move-on-to-block
    :parameters (?b - consonant ?under - block ?dest - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
      (not (= ?under ?dest))
    )
    :effect (and
      (not (on ?b ?under))
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?under)
      (clear ?b)
    )
  )

  (:action consonant-move-on-to-table
    :parameters (?b - consonant ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (ontable ?b)
      (clear ?under)
      (clear ?b)
    )
  )

  (:action consonant-move-table-to-block
    :parameters (?b - consonant ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
      (not (= ?b ?dest))
    )
    :effect (and
      (not (ontable ?b))
      (on ?b ?dest)
      (not (clear ?dest))
      (clear ?b)
    )
  )
)