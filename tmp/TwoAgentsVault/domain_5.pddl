(define (domain block-manipulation)
  (:requirements :strips :typing)
  (:types agent block)
  (:predicates
    (on-table ?b - block)
    (on ?b - block ?bb - block)
    (clear ?b - block)
    (vowel-block ?b - block)
    (consonant-block ?b - block)
    (has ?a - agent ?b - block)
  )

  (:action pick-up-vowel
    :parameters (?a - agent ?b - block)
    :precondition (and (vowel-block ?b) (clear ?b)
       (or (on-table ?b) (exists (?bb - block) (on ?b ?bb))))
    :effect (and (has ?a ?b) (not (clear ?b)) 
      (forall (?bb - block) (not (on ?b ?bb))) 
      (not (on-table ?b)))
  )

  (:action pick-up-consonant
    :parameters (?a - agent ?b - block)
    :precondition (and (consonant-block ?b) (clear ?b)
       (or (on-table ?b) (exists (?bb - block) (on ?b ?bb))))
    :effect (and (has ?a ?b) (not (clear ?b))
      (forall (?bb - block) (not (on ?b ?bb))) 
      (not (on-table ?b)))
  )

  (:action put-down-vowel
    :parameters (?a - agent ?b - block ?bb - block)
    :precondition (and (has ?a ?b) (vowel-block ?b) (clear ?bb))
    :effect (and (clear ?b) (not (has ?a ?b)) (on ?b ?bb))
  )

  (:action put-down-consonant
    :parameters (?a - agent ?b - block ?bb - block)
    :precondition (and (has ?a ?b) (consonant-block ?b) (clear ?bb))
    :effect (and (clear ?b) (not (has ?a ?b)) (on ?b ?bb))
  )

  (:action put-on-table
    :parameters (?a - agent ?b - block)
    :precondition (and (has ?a ?b))
    :effect (and (clear ?b) (not (has ?a ?b)) (on-table ?b))
  )
)