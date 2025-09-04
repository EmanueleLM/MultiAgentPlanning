(define (domain block-world)
  (:requirements :strips :typing)

  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (vowel ?x - block)
    (consonant ?x - block)
    (vowel-agent ?a - agent)
    (consonant-agent ?a - agent)
  )

  (:action pick-up-vowel
    :parameters (?a - agent ?b - block)
    :precondition (and (vowel-agent ?a) 
                       (vowel ?b) 
                       (clear ?b) 
                       (ontable ?b))
    :effect (and (holding ?a ?b) (not (ontable ?b)) (not (clear ?b)))
  )

  (:action pick-up-consonant
    :parameters (?a - agent ?b - block)
    :precondition (and (consonant-agent ?a) 
                       (consonant ?b) 
                       (clear ?b) 
                       (ontable ?b))
    :effect (and (holding ?a ?b) (not (ontable ?b)) (not (clear ?b)))
  )

  (:action put-down
    :parameters (?a - agent ?b - block)
    :precondition (holding ?a ?b)
    :effect (and (ontable ?b) (clear ?b) (not (holding ?a ?b)))
  )

  (:action stack-vowel
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (vowel-agent ?a) 
                       (vowel ?b)
                       (holding ?a ?b) (clear ?c))
    :effect (and (on ?b ?c) (clear ?b) (not (holding ?a ?b)) (not (clear ?c)))
  )

  (:action stack-consonant
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (consonant-agent ?a) 
                       (consonant ?b)
                       (holding ?a ?b) (clear ?c))
    :effect (and (on ?b ?c) (clear ?b) (not (holding ?a ?b)) (not (clear ?c)))
  )

  (:action unstack-vowel
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (vowel-agent ?a) 
                       (vowel ?b) 
                       (on ?b ?c) 
                       (clear ?b))
    :effect (and (holding ?a ?b) (clear ?c) (not (on ?b ?c)) (not (clear ?b)))
  )

  (:action unstack-consonant
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (consonant-agent ?a) 
                       (consonant ?b) 
                       (on ?b ?c) 
                       (clear ?b))
    :effect (and (holding ?a ?b) (clear ?c) (not (on ?b ?c)) (not (clear ?b)))
  )
)