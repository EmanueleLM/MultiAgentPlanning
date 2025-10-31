(define (domain multi_agent_blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding-vowel ?x - block)
    (holding-consonant ?x - block)
    (handempty-vowel)
    (handempty-consonant)
    (vowel ?x - block)
    (consonant ?x - block)
  )

  ;; Actions available to vowel_agent (can only manipulate A, E, I)
  (:action vowel-pickup-from-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty-vowel))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-vowel))
      (holding-vowel ?b)
    )
  )

  (:action vowel-pickup-from
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty-vowel))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (handempty-vowel))
      (holding-vowel ?b)
    )
  )

  (:action vowel-put-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (vowel ?b) (holding-vowel ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-vowel ?b))
      (handempty-vowel)
    )
  )

  (:action vowel-put-on-table
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding-vowel ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-vowel ?b))
      (handempty-vowel)
    )
  )

  ;; Actions available to consonant_agent (can only manipulate B C D F G H J)
  (:action consonant-pickup-from-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty-consonant))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty-consonant))
      (holding-consonant ?b)
    )
  )

  (:action consonant-pickup-from
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (handempty-consonant))
    :effect (and
      (not (on ?b ?under))
      (clear ?under)
      (not (clear ?b))
      (not (handempty-consonant))
      (holding-consonant ?b)
    )
  )

  (:action consonant-put-on-block
    :parameters (?b - block ?target - block)
    :precondition (and (consonant ?b) (holding-consonant ?b) (clear ?target))
    :effect (and
      (on ?b ?target)
      (clear ?b)
      (not (clear ?target))
      (not (holding-consonant ?b))
      (handempty-consonant)
    )
  )

  (:action consonant-put-on-table
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding-consonant ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding-consonant ?b))
      (handempty-consonant)
    )
  )
)