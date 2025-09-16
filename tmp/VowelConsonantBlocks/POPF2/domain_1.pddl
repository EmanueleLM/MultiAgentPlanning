(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (consonant ?x - block)
    (vowel ?x - block)
  )

  ;; Vowel Agent Actions
  (:action pick-up-vowel
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and (holding ?b) (not (ontable ?b)) (not (clear ?b)) (not (handempty)))
  )

  (:action put-down-vowel
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty) (not (holding ?b)))
  )

  (:action stack-vowel
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (holding ?b) (clear ?under))
    :effect (and (on ?b ?under) (not (holding ?b)) (clear ?b) (handempty) (not (clear ?under)))
  )

  (:action unstack-vowel
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty))
    :effect (and (holding ?b) (clear ?under) (not (on ?b ?under)) (not (clear ?b)) (not (handempty)))
  )

  ;; Consonant Agent Actions
  (:action pick-up-consonant
    :parameters (?b - block)
    :precondition (and (consonant ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and (holding ?b) (not (ontable ?b)) (not (clear ?b)) (not (handempty)))
  )

  (:action put-down-consonant
    :parameters (?b - block)
    :precondition (and (consonant ?b) (holding ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty) (not (holding ?b)))
  )

  (:action stack-consonant
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (holding ?b) (clear ?under))
    :effect (and (on ?b ?under) (not (holding ?b)) (clear ?b) (handempty) (not (clear ?under)))
  )

  (:action unstack-consonant
    :parameters (?b - block ?under - block)
    :precondition (and (consonant ?b) (on ?b ?under) (clear ?b) (handempty))
    :effect (and (holding ?b) (clear ?under) (not (on ?b ?under)) (not (clear ?b)) (not (handempty)))
  )
)