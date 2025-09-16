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
  (:action pick-up
    :parameters (?b - block)
    :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (handempty))
    :effect (and (holding ?b) (not (ontable ?b)) (not (clear ?b)) (not (handempty)))
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (and (vowel ?b) (holding ?b))
    :effect (and (ontable ?b) (clear ?b) (handempty) (not (holding ?b)))
  )

  (:action stack
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (holding ?b) (clear ?under))
    :effect (and (on ?b ?under) (not (holding ?b)) (clear ?b) (handempty) (not (clear ?under)))
  )

  (:action unstack
    :parameters (?b - block ?under - block)
    :precondition (and (vowel ?b) (on ?b ?under) (clear ?b) (handempty))
    :effect (and (holding ?b) (clear ?under) (not (on ?b ?under)) (not (clear ?b)) (not (handempty)))
  )

  ;; Consonant Agent Actions
  (:action move
    :parameters (?b - block ?from - block ?to - block)
    :precondition (and (consonant ?b) (clear ?b) (clear ?to) (on ?b ?from))
    :effect (and 
             (not (on ?b ?from))
             (on ?b ?to)
             (clear ?from)
             (not (clear ?to))
             (clear ?from)
    )
  )

  (:action move-to-table
    :parameters (?b - block ?from - block)
    :precondition (and (consonant ?b) (clear ?b) (on ?b ?from))
    :effect (and 
             (not (on ?b ?from))
             (ontable ?b)
             (clear ?from)
    )
  )

)