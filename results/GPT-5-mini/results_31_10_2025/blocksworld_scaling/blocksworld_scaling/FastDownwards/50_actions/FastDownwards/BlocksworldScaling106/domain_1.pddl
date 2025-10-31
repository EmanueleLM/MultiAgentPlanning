(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types table vowel consonant - object)

  (:predicates
    (on ?b - object ?p - object)    ; ?b is directly on ?p (p can be a block or table)
    (clear ?p - object)             ; place (block or table) has nothing on top of it
    (top ?b - object)               ; block is currently top of its stack (no block on it)
    (holding ?b - object)           ; mover is holding block ?b
    (handempty)                     ; mover's hand is empty
  )

  ;; Vowel-agent actions (move only vowel blocks: A, E, I)
  (:action vowel-pick-from-block
    :parameters (?b - vowel ?x - object)
    :precondition (and (on ?b ?x) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?x))
      (not (top ?b))
      (not (handempty))
      ; removing ?b makes its support ?x become top and clear (if ?x is a block)
      (top ?x)
      (clear ?x)
      (not (clear ?b))
    )
  )

  (:action vowel-pick-from-table
    :parameters (?b - vowel ?t - table)
    :precondition (and (on ?b ?t) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?t))
      (not (top ?b))
      (not (handempty))
      (not (clear ?b))
    )
  )

  (:action vowel-put-on-block
    :parameters (?b - vowel ?x - object)
    :precondition (and (holding ?b) (top ?x) (clear ?x))
    :effect (and
      (on ?b ?x)
      (not (holding ?b))
      (handempty)
      (top ?b)
      (clear ?b)
      (not (top ?x))
      (not (clear ?x))
    )
  )

  (:action vowel-put-on-table
    :parameters (?b - vowel ?t - table)
    :precondition (and (holding ?b))
    :effect (and
      (on ?b ?t)
      (not (holding ?b))
      (handempty)
      (top ?b)
      (clear ?b)
    )
  )

  ;; Consonant-agent actions (move only consonant blocks)
  (:action cons-pick-from-block
    :parameters (?b - consonant ?x - object)
    :precondition (and (on ?b ?x) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?x))
      (not (top ?b))
      (not (handempty))
      (top ?x)
      (clear ?x)
      (not (clear ?b))
    )
  )

  (:action cons-pick-from-table
    :parameters (?b - consonant ?t - table)
    :precondition (and (on ?b ?t) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?t))
      (not (top ?b))
      (not (handempty))
      (not (clear ?b))
    )
  )

  (:action cons-put-on-block
    :parameters (?b - consonant ?x - object)
    :precondition (and (holding ?b) (top ?x) (clear ?x))
    :effect (and
      (on ?b ?x)
      (not (holding ?b))
      (handempty)
      (top ?b)
      (clear ?b)
      (not (top ?x))
      (not (clear ?x))
    )
  )

  (:action cons-put-on-table
    :parameters (?b - consonant ?t - table)
    :precondition (and (holding ?b))
    :effect (and
      (on ?b ?t)
      (not (holding ?b))
      (handempty)
      (top ?b)
      (clear ?b)
    )
  )
)