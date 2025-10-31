(define (domain blocksworld)
  (:requirements :strips :multi-agent)
  (:types block agent)
  (:predicates
    (on ?x ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block ?a - agent)
    (handempty ?a - agent)
    (consonant ?x - block)
    (vowel ?x - block)
  )

  ;; Vowel Agent Actions
  (:action pick-up-vowel
    :parameters (?b - block ?a - agent)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and (holding ?b ?a) (not (ontable ?b)) (not (clear ?b)) (not (handempty ?a)))
  )

  (:action put-down-vowel
    :parameters (?b - block ?a - agent)
    :precondition (and (vowel ?b) (holding ?b ?a))
    :effect (and (ontable ?b) (clear ?b) (handempty ?a) (not (holding ?b ?a)))
  )

  (:action stack-vowel
    :parameters (?b - block ?under - block ?a - agent)
    :precondition (and (vowel ?b) (holding ?b ?a) (clear ?under))
    :effect (and (on ?b ?under) (not (holding ?b ?a)) (clear ?b) (handempty ?a) (not (clear ?under)))
  )

  (:action unstack-vowel
    :parameters (?b - block ?under - block ?a - agent)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty ?a))
    :effect (and (holding ?b ?a) (clear ?under) (not (on ?b ?under)) (not (clear ?b)) (not (handempty ?a)))
  )

  ;; Consonant Agent Actions
  (:action pick-up-consonant
    :parameters (?b - block ?a - agent)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty ?a))
    :effect (and (holding ?b ?a) (not (ontable ?b)) (not (clear ?b)) (not (handempty ?a)))
  )

  (:action put-down-consonant
    :parameters (?b - block ?a - agent)
    :precondition (and (consonant ?b) (holding ?b ?a))
    :effect (and (ontable ?b) (clear ?b) (handempty ?a) (not (holding ?b ?a)))
  )

  (:action stack-consonant
    :parameters (?b - block ?under - block ?a - agent)
    :precondition (and (consonant ?b) (holding ?b ?a) (clear ?under))
    :effect (and (on ?b ?under) (not (holding ?b ?a)) (clear ?b) (handempty ?a) (not (clear ?under)))
  )

  (:action unstack-consonant
    :parameters (?b - block ?under - block ?a - agent)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (handempty ?a))
    :effect (and (holding ?b ?a) (clear ?under) (not (on ?b ?under)) (not (clear ?b)) (not (handempty ?a)))
  )
)