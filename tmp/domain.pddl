(define (domain blocksworld-coordinated)
  (:requirements :strips :typing)
  (:types block)   
  (:predicates 
    (on ?x - block ?y - block)  
    (ontable ?x - block)        
    (clear ?x - block)          
    (holding-vowel ?x - block)  
    (holding-consonant ?x - block)  
    (arm-empty-vowel)           
    (handempty-consonant)       
    (is-consonant ?b - block)   
    (is-vowel ?b - block)       
  )

  (:action pick-up-vowel
    :parameters (?x - block)
    :precondition (and (clear ?x) (ontable ?x) (arm-empty-vowel) (is-vowel ?x))
    :effect (and (holding-vowel ?x) (not (ontable ?x)) (not (clear ?x)) (not (arm-empty-vowel)))
  )

  (:action put-down-vowel
    :parameters (?x - block)
    :precondition (holding-vowel ?x)
    :effect (and (ontable ?x) (clear ?x) (not (holding-vowel ?x)) (arm-empty-vowel))
  )

  (:action stack-vowel
    :parameters (?x - block ?y - block)
    :precondition (and (holding-vowel ?x) (clear ?y) (is-vowel ?x))
    :effect (and (on ?x ?y) (clear ?x) (not (holding-vowel ?x)) (arm-empty-vowel) (not (clear ?y)))
  )

  (:action unstack-vowel
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (arm-empty-vowel) (is-vowel ?x))
    :effect (and (holding-vowel ?x) (clear ?y) (not (on ?x ?y)) (not (clear ?x)) (not (arm-empty-vowel)))
  )

  (:action pick-up-consonant
    :parameters (?b - block)
    :precondition (and (clear ?b) (ontable ?b) (handempty-consonant) (is-consonant ?b))
    :effect (and (holding-consonant ?b) (not (ontable ?b)) (not (handempty-consonant)))
  )

  (:action put-down-consonant
    :parameters (?b - block)
    :precondition (holding-consonant ?b)
    :effect (and (ontable ?b) (clear ?b) (handempty-consonant) (not (holding-consonant ?b)))
  )

  (:action stack-consonant
    :parameters (?b - block ?under - block)
    :precondition (and (holding-consonant ?b) (clear ?under) (is-consonant ?b))
    :effect (and (on ?b ?under) (clear ?b) (handempty-consonant) (not (holding-consonant ?b)) (not (clear ?under)))
  )

  (:action unstack-consonant
    :parameters (?b - block ?under - block)
    :precondition (and (on ?b ?under) (clear ?b) (handempty-consonant) (is-consonant ?b))
    :effect (and (holding-consonant ?b) (clear ?under) (not (on ?b ?under)) (not (handempty-consonant)))
  )
)