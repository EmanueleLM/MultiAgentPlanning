(define (domain multi-agent-blocks)
  (:requirements :strips :typing)
  (:types block)
  (:predicates 
    (on-table ?b - block)
    (on ?b1 - block ?b2 - block)
    (clear ?b - block)
    (holding ?b - block)
    (hand-empty)
    (vowel ?b - block)
    (consonant-block ?b - block)
  )
  
  (:action vowel-pick-up
    :parameters (?b - block)
    :precondition (and (vowel ?b) (clear ?b) (on-table ?b) (hand-empty))
    :effect (and (holding ?b) (not (on-table ?b)) (not (hand-empty)))
  )
  
  (:action vowel-put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (on-table ?b) (clear ?b) (not (holding ?b)) (hand-empty))
  )
  
  (:action vowel-move
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (holding ?b1) (clear ?b2) (vowel ?b1))
    :effect (and (on-table ?b1) (clear ?b1) (not (holding ?b1)) (not (clear ?b2)) (hand-empty))
  )
  
  (:action consonant-pick-up
    :parameters (?b - block)
    :precondition (and (clear ?b) (on-table ?b) (hand-empty) (consonant-block ?b))
    :effect (and (holding ?b) (not (on-table ?b)) (not (hand-empty)))
  )
  
  (:action consonant-put-down
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and (hand-empty) (not (holding ?b)) (on-table ?b) (clear ?b))
  )
  
  (:action consonant-stack
    :parameters (?b1 - block ?b2 - block)
    :precondition (and (holding ?b1) (clear ?b2) (consonant-block ?b1))
    :effect (and (not (holding ?b1)) (hand-empty) (on ?b1 ?b2) (clear ?b1) (not (clear ?b2)))
  )
)