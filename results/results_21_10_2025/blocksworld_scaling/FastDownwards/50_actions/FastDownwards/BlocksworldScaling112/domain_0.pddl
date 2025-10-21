(define (domain block-stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block vowel consonant)
  (:predicates
    (on ?b - block ?under - block)
    (on-table ?b - block)
    (clear ?b - block)
    (holding ?a - agent ?b - block)
    (hand-empty ?a - agent)
  )

  ;; Vowel agent actions (can only pick/place vowel-labelled blocks)
  (:action pick-vowel-from-table
    :parameters (?a - agent ?b - vowel)
    :precondition (and (hand-empty ?a) (on-table ?b) (clear ?b))
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (hand-empty ?a))
      (holding ?a ?b)
    )
  )

  (:action pick-vowel-from-block
    :parameters (?a - agent ?b - vowel ?under - block)
    :precondition (and (hand-empty ?a) (clear ?b) (on ?b ?under))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (hand-empty ?a))
      (holding ?a ?b)
    )
  )

  (:action place-vowel-on-block
    :parameters (?a - agent ?b - vowel ?target - block)
    :precondition (and (holding ?a ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (not (holding ?a ?b))
      (hand-empty ?a)
    )
  )

  (:action place-vowel-on-table
    :parameters (?a - agent ?b - vowel)
    :precondition (and (holding ?a ?b))
    :effect (and
      (on-table ?b)
      (clear ?b)
      (not (holding ?a ?b))
      (hand-empty ?a)
    )
  )

  ;; Consonant agent actions (can only pick/place consonant-labelled blocks)
  (:action pick-consonant-from-table
    :parameters (?a - agent ?b - consonant)
    :precondition (and (hand-empty ?a) (on-table ?b) (clear ?b))
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (hand-empty ?a))
      (holding ?a ?b)
    )
  )

  (:action pick-consonant-from-block
    :parameters (?a - agent ?b - consonant ?under - block)
    :precondition (and (hand-empty ?a) (clear ?b) (on ?b ?under))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (hand-empty ?a))
      (holding ?a ?b)
    )
  )

  (:action place-consonant-on-block
    :parameters (?a - agent ?b - consonant ?target - block)
    :precondition (and (holding ?a ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (not (clear ?target))
      (clear ?b)
      (not (holding ?a ?b))
      (hand-empty ?a)
    )
  )

  (:action place-consonant-on-table
    :parameters (?a - agent ?b - consonant)
    :precondition (and (holding ?a ?b))
    :effect (and
      (on-table ?b)
      (clear ?b)
      (not (holding ?a ?b))
      (hand-empty ?a)
    )
  )
)