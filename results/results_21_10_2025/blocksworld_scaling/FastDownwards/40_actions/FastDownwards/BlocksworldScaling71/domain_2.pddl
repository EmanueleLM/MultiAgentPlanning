(define (domain blocks-multiagent)
  (:requirements :strips :typing)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
  )

  ;; Vowel-agent actions (A, E, I only)
  (:action vowel-pickup-from-table
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  (:action vowel-unstack
    :parameters (?b - vowel ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?x)
    )
  )

  (:action vowel-putdown-to-table
    :parameters (?b - vowel)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action vowel-stack-to-block
    :parameters (?b - vowel ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))
    )
  )

  ;; Consonant-agent actions (all consonants)
  (:action consonant-pickup-from-table
    :parameters (?b - consonant)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  (:action consonant-unstack
    :parameters (?b - consonant ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?x)
    )
  )

  (:action consonant-putdown-to-table
    :parameters (?b - consonant)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  (:action consonant-stack-to-block
    :parameters (?b - consonant ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (on ?b ?x)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?x))
    )
  )
)