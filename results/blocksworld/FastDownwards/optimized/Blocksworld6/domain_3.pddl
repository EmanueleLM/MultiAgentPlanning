(define (domain multiagent_blocks)
  (:requirements :typing :negative-preconditions)
  (:types vowel cons - block block place - object)

  (:predicates
    (on ?x - block ?y - object)
    (clear ?x - block)
    (handfree-vowel)
    (handfree-cons)
    (holding-v ?x - vowel)
    (holding-c ?x - cons)
  )

  (:action vowel_pick_from_table
    :parameters (?b - vowel)
    :precondition (and
      (handfree-vowel)
      (on ?b table)
      (clear ?b)
    )
    :effect (and
      (not (on ?b table))
      (not (clear ?b))
      (holding-v ?b)
      (not (handfree-vowel))
    )
  )

  (:action vowel_pick_from_block
    :parameters (?b - vowel ?under - block)
    :precondition (and
      (handfree-vowel)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (holding-v ?b)
      (not (handfree-vowel))
    )
  )

  (:action vowel_put_on_table
    :parameters (?b - vowel)
    :precondition (and
      (holding-v ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (not (holding-v ?b))
      (handfree-vowel)
    )
  )

  (:action vowel_put_on_block
    :parameters (?b - vowel ?target - block)
    :precondition (and
      (holding-v ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-v ?b))
      (handfree-vowel)
    )
  )

  (:action cons_pick_from_table
    :parameters (?b - cons)
    :precondition (and
      (handfree-cons)
      (on ?b table)
      (clear ?b)
    )
    :effect (and
      (not (on ?b table))
      (not (clear ?b))
      (holding-c ?b)
      (not (handfree-cons))
    )
  )

  (:action cons_pick_from_block
    :parameters (?b - cons ?under - block)
    :precondition (and
      (handfree-cons)
      (on ?b ?under)
      (clear ?b)
    )
    :effect (and
      (not (on ?b ?under))
      (not (clear ?b))
      (clear ?under)
      (holding-c ?b)
      (not (handfree-cons))
    )
  )

  (:action cons_put_on_table
    :parameters (?b - cons)
    :precondition (and
      (holding-c ?b)
    )
    :effect (and
      (on ?b table)
      (clear ?b)
      (not (holding-c ?b))
      (handfree-cons)
    )
  )

  (:action cons_put_on_block
    :parameters (?b - cons ?target - block)
    :precondition (and
      (holding-c ?b)
      (clear ?target)
    )
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-c ?b))
      (handfree-cons)
    )
  )
)