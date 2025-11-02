(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place block table vowel consonant - place)
  (:predicates
    (on ?b - block ?p - place)        ; block ?b is directly on place ?p (place = block or table)
    (clear ?p - place)               ; place (block or table) has no block on top of it
    (top ?b - block)                 ; block is top of its current stack (no block on it)
    (holding ?b - block)             ; an agent is holding block ?b
    (handempty)                      ; the mover's hand is empty
  )

  ;; Vowel-agent actions (can move only vowel blocks: A, E, I)
  (:action vowel-pick-from-block
    :parameters (?b - vowel ?x - block)
    :precondition (and (on ?b ?x) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?x))
      (not (top ?b))
      (not (clear ?b))
      (top ?x)
      (clear ?x)
      (not (handempty))
    )
  )

  (:action vowel-pick-from-table
    :parameters (?b - vowel ?t - table)
    :precondition (and (on ?b ?t) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?t))
      (not (top ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action vowel-put-on-block
    :parameters (?b - vowel ?x - block)
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

  ;; Consonant-agent actions (can move only consonant blocks)
  (:action cons-pick-from-block
    :parameters (?b - consonant ?x - block)
    :precondition (and (on ?b ?x) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?x))
      (not (top ?b))
      (not (clear ?b))
      (top ?x)
      (clear ?x)
      (not (handempty))
    )
  )

  (:action cons-pick-from-table
    :parameters (?b - consonant ?t - table)
    :precondition (and (on ?b ?t) (top ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (on ?b ?t))
      (not (top ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action cons-put-on-block
    :parameters (?b - consonant ?x - block)
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