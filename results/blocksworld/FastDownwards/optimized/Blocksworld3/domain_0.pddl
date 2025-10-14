(define (domain multiagent-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types vowel consonant - block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (handfree-vowel)
    (handfree-consonant)
    (holding-vowel ?x - block)
    (holding-consonant ?x - block)
  )

  ;; Vowel-agent actions (agent name: vowel_agent). Can only manipulate vowel blocks (A,E -> a,e).
  (:action pick-vowel-from-table
    :parameters (?b - vowel)
    :precondition (and (ontable ?b) (clear ?b) (handfree-vowel) (not (holding-vowel ?b)) (not (holding-consonant ?b)))
    :effect (and
              (not (ontable ?b))
              (not (handfree-vowel))
              (holding-vowel ?b)
            )
  )

  (:action pick-vowel-from-block
    :parameters (?b - vowel ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handfree-vowel) (not (holding-vowel ?b)) (not (holding-consonant ?b)))
    :effect (and
              (not (on ?b ?x))
              (clear ?x)
              (not (handfree-vowel))
              (holding-vowel ?b)
            )
  )

  (:action put-vowel-on
    :parameters (?b - vowel ?y - block)
    :precondition (and (holding-vowel ?b) (clear ?y) (not (holding-vowel ?y)) (not (holding-consonant ?y)))
    :effect (and
              (not (holding-vowel ?b))
              (handfree-vowel)
              (on ?b ?y)
              (not (clear ?y))
              (clear ?b)
            )
  )

  (:action put-vowel-on-table
    :parameters (?b - vowel)
    :precondition (and (holding-vowel ?b))
    :effect (and
              (not (holding-vowel ?b))
              (handfree-vowel)
              (ontable ?b)
              (clear ?b)
            )
  )

  ;; Consonant-agent actions (agent name: consonant_agent). Can only manipulate consonant blocks (B,C,D -> b,c,d).
  (:action pick-consonant-from-table
    :parameters (?b - consonant)
    :precondition (and (ontable ?b) (clear ?b) (handfree-consonant) (not (holding-vowel ?b)) (not (holding-consonant ?b)))
    :effect (and
              (not (ontable ?b))
              (not (handfree-consonant))
              (holding-consonant ?b)
            )
  )

  (:action pick-consonant-from-block
    :parameters (?b - consonant ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handfree-consonant) (not (holding-vowel ?b)) (not (holding-consonant ?b)))
    :effect (and
              (not (on ?b ?x))
              (clear ?x)
              (not (handfree-consonant))
              (holding-consonant ?b)
            )
  )

  (:action put-consonant-on
    :parameters (?b - consonant ?y - block)
    :precondition (and (holding-consonant ?b) (clear ?y) (not (holding-vowel ?y)) (not (holding-consonant ?y)))
    :effect (and
              (not (holding-consonant ?b))
              (handfree-consonant)
              (on ?b ?y)
              (not (clear ?y))
              (clear ?b)
            )
  )

  (:action put-consonant-on-table
    :parameters (?b - consonant)
    :precondition (and (holding-consonant ?b))
    :effect (and
              (not (holding-consonant ?b))
              (handfree-consonant)
              (ontable ?b)
              (clear ?b)
            )
  )
)