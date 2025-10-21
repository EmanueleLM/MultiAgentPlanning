(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (block ?b - block)
    (vowel ?b - block)
    (consonant ?b - block)
    (on ?x - block ?y - block)        ;; ?x is immediately on ?y
    (ontable ?x - block)
    (clear ?x - block)                ;; nothing on ?x
    (handempty-vowel)
    (handempty-consonant)
    (holding-vowel ?b - block)
    (holding-consonant ?b - block)
  )

  ;; Vowel agent actions
  (:action vowel-pickup-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-vowel))
    )
  )

  (:action vowel-pickup-from
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (on ?b ?x) (clear ?b) (handempty-vowel))
    :effect (and
      (holding-vowel ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty-vowel))
    )
  )

  (:action vowel-put-down-to-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  (:action vowel-put-on
    :parameters (?b - block ?x - block)
    :precondition (and (vowel ?b) (holding-vowel ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (handempty-vowel)
      (not (holding-vowel ?b))
    )
  )

  ;; Consonant agent actions
  (:action consonant-pickup-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty-consonant))
    :effect (and
      (holding-consonant ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-consonant))
    )
  )

  (:action consonant-pickup-from
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (on ?b ?x) (clear ?b) (handempty-consonant))
    :effect (and
      (holding-consonant ?b)
      (clear ?x)
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty-consonant))
    )
  )

  (:action consonant-put-down-to-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding-consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty-consonant)
      (not (holding-consonant ?b))
    )
  )

  (:action consonant-put-on
    :parameters (?b - block ?x - block)
    :precondition (and (consonant ?b) (holding-consonant ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (not (clear ?x))
      (handempty-consonant)
      (not (holding-consonant ?b))
    )
  )
)