(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (different ?x - block ?y - block)
  )

  (:action vowel-move-from-on-to-block
    :parameters (?b - vowel ?under - block ?dest - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (clear ?dest)
      (different ?b ?dest)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action vowel-move-from-on-to-table
    :parameters (?b - vowel ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action vowel-move-from-table-to-block
    :parameters (?b - vowel ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
      (different ?b ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action vowel-move-from-table-to-table
    :parameters (?b - vowel)
    :precondition (and
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action consonant-move-from-on-to-block
    :parameters (?b - consonant ?under - block ?dest - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
      (clear ?dest)
      (different ?b ?dest)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action consonant-move-from-on-to-table
    :parameters (?b - consonant ?under - block)
    :precondition (and
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (ontable ?b)
      (clear ?b)
    )
  )

  (:action consonant-move-from-table-to-block
    :parameters (?b - consonant ?dest - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (clear ?dest)
      (different ?b ?dest)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?dest))
      (on ?b ?dest)
      (clear ?b)
    )
  )

  (:action consonant-move-from-table-to-table
    :parameters (?b - consonant)
    :precondition (and
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
    )
  )
)