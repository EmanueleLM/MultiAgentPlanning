(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block vowel-block consonant-block - block)

  (:predicates
    ;; spatial relations
    (on ?b - block ?x - block)        ; ?b is on ?x (block)
    (ontable ?b - block)             ; ?b is directly on the table
    (clear ?b - block)               ; nothing on top of ?b

    ;; agent hand/holding status
    (handfree-vowel)
    (handfree-consonant)
    (holding-vowel ?b - vowel-block)
    (holding-consonant ?b - consonant-block)
  )

  ;; Vowel-agent actions
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
    :precondition (and (holding-vowel ?b) (clear ?x))
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

  ;; Consonant-agent actions
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
    :precondition (and (holding-consonant ?b) (clear ?x))
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