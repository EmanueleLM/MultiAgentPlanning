(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel-block consonant-block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding-vowel ?x - vowel-block)
    (holding-consonant ?x - consonant-block)
    (handfree-vowel)
    (handfree-consonant)
    (protected ?x - block)
  )

  ;; Vowel-agent actions (can only pick/place vowel-block)
  (:action vowel-pick-from-table
    :parameters (?b - vowel-block)
    :precondition (and (handfree-vowel) (ontable ?b) (clear ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding-vowel ?b)
      (not (handfree-vowel))
    )
  )

  (:action vowel-pick-from-block
    :parameters (?b - vowel-block ?x - block)
    :precondition (and (handfree-vowel) (on ?b ?x) (clear ?b))
    :effect (and
      (not (on ?b ?x))
      (not (clear ?b))
      (holding-vowel ?b)
      (not (handfree-vowel))
      (clear ?x)
    )
  )

  (:action vowel-place-on
    :parameters (?b - vowel-block ?x - block)
    :precondition (and (holding-vowel ?b) (clear ?x) (not (protected ?x)))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (not (holding-vowel ?b))
      (handfree-vowel)
    )
  )

  (:action vowel-place-on-table
    :parameters (?b - vowel-block)
    :precondition (and (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-vowel ?b))
      (handfree-vowel)
    )
  )

  ;; Consonant-agent actions (can only pick/place consonant-block)
  (:action consonant-pick-from-table
    :parameters (?b - consonant-block)
    :precondition (and (handfree-consonant) (ontable ?b) (clear ?b))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (holding-consonant ?b)
      (not (handfree-consonant))
    )
  )

  (:action consonant-pick-from-block
    :parameters (?b - consonant-block ?x - block)
    :precondition (and (handfree-consonant) (on ?b ?x) (clear ?b))
    :effect (and
      (not (on ?b ?x))
      (not (clear ?b))
      (holding-consonant ?b)
      (not (handfree-consonant))
      (clear ?x)
    )
  )

  (:action consonant-place-on
    :parameters (?b - consonant-block ?x - block)
    :precondition (and (holding-consonant ?b) (clear ?x) (not (protected ?x)))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (not (holding-consonant ?b))
      (handfree-consonant)
    )
  )

  (:action consonant-place-on-table
    :parameters (?b - consonant-block)
    :precondition (and (holding-consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-consonant ?b))
      (handfree-consonant)
    )
  )
)